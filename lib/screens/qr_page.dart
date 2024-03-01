import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:schoolapp/constants/constants.dart';
import 'package:schoolapp/data/apiClient/getfee.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/student_model.dart';
import 'package:schoolapp/mainpage.dart';
import 'package:schoolapp/screens/payment_reciept.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class QrPage extends StatefulWidget {
  final int amount;
  final Map<String, int> selectedMonths;
  final List<String> itemId = FeeApi.itemIds;
  QrPage({Key? key, required this.amount, required this.selectedMonths})
      : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  late UPIDetails upiDetails;
  String orderId = "";
  StudentBasic? student;
  String qrData = "";
  Token? token;
  late Razorpay _razorpay;
  static const String _chars = '1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void createOrder() async {
    http.Response res = await http.post(
      Uri.parse(Constants.createOrderUrl),
      headers: {
        'content-type': 'application/json',
        'authorization': 'Basic ${base64Encode(utf8.encode(Constants.keyId + ':' + Constants.keySecret))}'
      },
      body: jsonEncode({
        "amount": widget.amount * 100,
        "currency": "INR",
        "receipt": 'recpt_' + getRandomString(4),
      }),
    );
    orderId = jsonDecode(res.body)['id'];

    // Call createPayment method here to initialize _razorpay
    createPayment(orderId);
  }


  void createPayment(String orderId) async {


    var options = {
      'key': Constants.keyId,
      'amount': widget.amount * 100, // in the smallest currency sub-unit.
      'name': 'Shubh Soft Solution',
      'order_id': orderId, // Generate order_id using Orders API
      'description': widget.itemId[0].toString(),
      'timeout': 300, // in seconds
      'prefill': {
        'contact': '+91-8299473028',
        'email': 'info@shubhsoftsolution.com',
      }
    };
    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    await saveOnlineFee(response.orderId.toString(), token.toString(), widget.itemId);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentReciept(
          orderId: orderId,
          amount: widget.amount.toString(),
        ),
      ),
    );
  }

  Future<void> saveOnlineFee(String orderId, String token, List<String> itemIds) async {
    List<Map<String, dynamic>> requestBody = [];
    widget.selectedMonths.forEach((key, value) {
      requestBody.add({
        "SchoolCode": student?.schoolCode.toString(),
        "Enrollment": student?.admsnNo.toString(),
        "ItemId": widget.itemId[0].toString(),
        "OrderId": orderId.toString(),
        "HeadName": key.toString(),
        "Amount": value.toString(),
      });
    });

    try {
      final apiResponse = await http.post(
        Uri.parse('https://demo.shubhsoftsolution.in/Api/Users/SaveOnlineFee/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );
      if (apiResponse.statusCode == 200) {
      } else {
        print("Error: ${apiResponse.statusCode}, ${apiResponse.body}");
      }
    } catch (e) {
      print(e);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment failed : ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  void initState() {
    upiDetails = UPIDetails(
        upiID: Constants.upiid,
        payeeName: "Shubh soft solution",
        amount: widget.amount.toDouble(),
        transactionNote: "Pay Fees");
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    token = AuthenticateUser.token;
    student = AuthenticateUser.studentBasic;
    qrData = 'amount: ${widget.amount.toString()}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool showQrAndFeePayment = Constants.keyId.isEmpty;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C1D3B),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.keyboard_backspace),
              color: Colors.white,
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => MainPage(),
                //   ),
                //       (route) => false,
                // );
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Row(
          children: [
            Text(
              'Pay Fees',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Total Amount',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.04,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              widget.amount.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.1,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08, vertical: screenHeight * 0.01),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFF02335F)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                shadowColor: MaterialStateProperty.all(Color(0x14212121)),
                elevation: MaterialStateProperty.all(1),
              ),
              onPressed: () {
                createOrder();
              },
              child: Text(
                'Pay Fees Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.30,
                ),
              ),
            ),
            if (showQrAndFeePayment) ...[
              SizedBox(height: screenHeight * 0.06),
              UPIPaymentQRCode(
                upiDetails: upiDetails,
                size: 220,
                upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.low,
              ),
              SizedBox(height: screenHeight * 0.06),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08, vertical: screenHeight * 0.01),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color(0xFF02335F)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  shadowColor: MaterialStateProperty.all(Color(0x14212121)),
                  elevation: MaterialStateProperty.all(1),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MainPage(),
                    ),
                        (route) => false,
                  );
                },
                child: Text(
                  'Fee Payment done via QR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: -0.30,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
