import 'package:flutter/material.dart';
import 'package:schoolapp/mainpage.dart';
import 'package:schoolapp/widgets/studentinfo.dart';

class PaymentReciept extends StatefulWidget {
  const PaymentReciept({Key? key,required this.orderId,required this.amount}) : super(key: key);
  final String orderId;

  final String amount;
  @override
  State<PaymentReciept> createState() => _PaymentRecieptState();
}

class _PaymentRecieptState extends State<PaymentReciept> {

  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Container(
              child: Image.asset('assets/icons/tick.png'),
            ),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              width: screenWidth * 0.95,
              height: screenHeight * 0.30,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: screenWidth * 0.002, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x26212121),
                    blurRadius: screenWidth * 0.01,
                    offset: Offset(screenWidth * 0.005, screenWidth * 0.005),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'ID: ${widget.orderId}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF797979),
                      fontSize: screenWidth * 0.03,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text(
                    '${today}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF797979),
                      fontSize: screenWidth * 0.03,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Academic Fee',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF797979),
                          fontSize: screenWidth * 0.03,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Text(
                        '${widget.amount}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: screenWidth * 0.005,
                  ),
                  SizedBox(
                    height: screenHeight*0.01,
                  ),
                  StudentInfoWidget(),
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.1,),
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
                    builder: (BuildContext context) => MainPage(), // Replace with your main page widget
                  ),
                      (route) => false, // This predicate removes all routes from the stack
                );
                },
              child: Text(
                'Back to Home',
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
        ),
      ),
    );
  }
}
