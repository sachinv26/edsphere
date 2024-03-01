import 'package:flutter/material.dart';
import 'package:schoolapp/core/app_export.dart';
import 'package:schoolapp/data/apiClient/getfee.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/fees_model.dart';
import 'package:schoolapp/data/models/student_model.dart';
import 'package:schoolapp/screens/qr_page.dart';

class MainFees extends StatefulWidget {

  final List<String> itemIds;
  MainFees({Key? key, required this.itemIds}) : super(key: key);

  @override
  State<MainFees> createState() => _MainFeesState();
}

class _MainFeesState extends State<MainFees> {

  final ScrollController _firstController = ScrollController();
  List<FeeDetail> transportFee = [];
  List<FeeDetail> academicFee = [];
  bool _isPreviousMonthPaid = true;

  List<String> itemId = [];

  Map<String, int> selectedMonths = {};

  int transportFeeTotal=0;
  bool isfeesLoading = false;
  FeeDetail? old;
  Token? token;
  int FeeTotal=0;
  Map<String, bool> isfee = {
    'January Fee': true,
    'February Fee': true,
    'March Fee': true,
    'April Fee': true,
    'May Fee': true,
    'June Fee': true,
    'July Fee': true,
    'August Fee': true,
    'September Fee': true,
    'October Fee': true,
    'November Fee': true,
    'December Fee': true,
  };

  Map<String, bool> istrp = {
    'January Trp': true,
    'February Trp': true,
    'March Trp': true,
    'April Trp': true,
    'May Trp': true,
    'June Trp': true,
    'July Trp': true,
    'August Trp': true,
    'September Trp': true,
    'October Trp': true,
    'November Trp': true,
    'December Trp': true,
  };

  Future<void> fetchFeeData() async {
    try {
      // Fetch fee details using your FeeApi.getDues method
      await FeeApi.getDues(
        AuthenticateUser.studentBasic!.schoolCode.toString(),
        AuthenticateUser.studentBasic!.admsnNo.toString(),
        token?.token ?? '',
      ); // Add this line to print the fetched data
      setState(() {
        transportFee.clear();
        academicFee.clear();
        separateData(FeeApi.feedetails);
      });
    } catch (error) {
      // Handle errors (display a message or take appropriate action)
      print('Error fetching fee data: $error');

      // Rest of the error handling code remains the same
      // ...
    }
  }



  void _showOldBalanceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            color: Color(0xFF02335F),
            alignment: Alignment.topCenter,
            child: Text(
              'Old Balance',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          content: Row(
            children: [
              Text(
                'Your Old Balance is: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF445154),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${old!.amount.toString()}',
                style: TextStyle(
                  color: Color(0xFFDB2C0B),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 72.h, vertical: 6.h),
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
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  void separateData(List<FeeDetail> feedetails) {
    transportFee.clear();
    academicFee.clear();
    selectedMonths.clear();
    for (var i in feedetails) {

      if (istrp.containsKey(i.feeHead)) {
        transportFee.add(i);
      } else if (isfee.containsKey(i.feeHead)) {
        academicFee.add(i);

      } else {
        old = i;
      }
    }
  }

  bool _isChecked = false;

  void uncheckmodel(){
    for(int i=0;i<FeeApi.feedetails.length;i++){
      FeeApi.feedetails[i].ischeck=false;
    }
  }
  @override
  void initState() {
    uncheckmodel();
    separateData(FeeApi.feedetails);
    token = AuthenticateUser.token;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1D3B),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_backspace),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Row(
          children: [
            Text(
              'Fees Status',
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
      backgroundColor: Color(0xFFF2BA1B),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 260.h,
                      color: const Color(0xFF0C1D3B),
                      width: double.infinity,
                    ),
                  ],
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 72, vertical: 6),
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
                        onPressed: () async {
                          setState(() {
                            isfeesLoading = true; // Set loading to true before fetching data
                          });
                          await fetchFeeData();
                          FeeTotal=0;
                          setState(() {
                            isfeesLoading = false; // Set loading to false after fetching data
                          });
                        },
                        child: isfeesLoading
                            ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                            : Text(
                          'Refresh Fees',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Month',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                _showOldBalanceDialog(context);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Old Balance: ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF445154),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${old?.amount.toString() ?? "N/A"}', // Use null-aware operator and provide a default value
                                    style: TextStyle(
                                      color: Color(0xFFDB2C0B),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),

                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 380,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              // height: 35,
                              // width: 430,
                              decoration: ShapeDecoration(
                                color: Color(0xFF02335F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text('Fees',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Scrollbar(
                                  controller: _firstController,
                                  thumbVisibility: true,
                                  trackVisibility: true,
                                  thickness: 5,
                                  child: SingleChildScrollView(
                                    controller: _firstController,
                                    scrollDirection: Axis.vertical,
                                    child: DataTable(
                                      columnSpacing: 15,
                                      columns: [
                                        DataColumn(label: Text('Month',style: TextStyle(fontSize: 10),)),
                                        DataColumn(label: Text('Fees',style: TextStyle(fontSize: 10),)),

                                        DataColumn(label: Text('Transport',style: TextStyle(fontSize: 10),),),
                                      ],
                                      rows: [
                                        for (int i = 0; i < academicFee.length; i++)
                                          DataRow(cells: [
                                            DataCell(Row(
                                              children: [
                                                academicFee[i].isPaid
                                                    ? Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                )
                                                    : Checkbox(
                                                  activeColor: Color(0xFF0C1D3B),
                                                  checkColor: Colors.white,
                                                  value: academicFee[i].ischeck,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        if (i > 0 && (academicFee[i - 1].isPaid || academicFee[i - 1].ischeck!)) {
                                                          academicFee[i].ischeck = value ?? true;
                                                          if (value ?? false) {
                                                            FeeTotal += academicFee[i].amount + transportFee[i].amount;
                                                            selectedMonths.addAll({
                                                              '${academicFee[i].feeHead}': academicFee[i].amount,
                                                              '${transportFee[i].feeHead}': transportFee[i].amount,
                                                            });

                                                            // Uncheck subsequent months if the current month is unchecked
                                                          } else {
                                                            FeeTotal -= academicFee[i].amount + transportFee[i].amount;

                                                            // Remove entries for the unchecked month from selectedMonths
                                                            selectedMonths.remove(academicFee[i].feeHead);
                                                            selectedMonths.remove(transportFee[i].feeHead);

                                                            for (int j = i + 1; j < academicFee.length; j++) {
                                                              if (academicFee[j].ischeck!) {
                                                                FeeTotal -= academicFee[j].amount + transportFee[j].amount;
                                                                // Remove entries for subsequent months from selectedMonths
                                                                selectedMonths.remove(academicFee[j].feeHead);
                                                                selectedMonths.remove(transportFee[j].feeHead);
                                                              }
                                                              academicFee[j].ischeck = false;
                                                            }
                                                          }
                                                        } else if (i == 0 && _isPreviousMonthPaid) {
                                                          academicFee[i].ischeck = value ?? true;
                                                          if (value ?? false) {
                                                            FeeTotal += academicFee[i].amount + transportFee[i].amount;
                                                            selectedMonths[academicFee[i].feeHead] = academicFee[i].amount; // Highlighted change
                                                            selectedMonths[transportFee[i].feeHead] = transportFee[i].amount;
                                                          } else {
                                                            FeeTotal -= academicFee[i].amount + transportFee[i].amount;
                                                            selectedMonths.remove(academicFee[i].feeHead);
                                                            selectedMonths.remove(transportFee[i].feeHead);
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(
                                                              content: Text('Please pay the previous month first.'),
                                                              duration: Duration(seconds: 1),
                                                            ),
                                                          );
                                                        }
                                                      });
                                                    },
                                                ),
                                                Text('${academicFee[i].feeHead}',style: TextStyle(
                                                  fontSize: 10.h,
                                                  color: academicFee[i].isPaid ? Colors.green : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              ],
                                            )),
                                            DataCell(
                                              Text(
                                                '${academicFee[i].amount}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: academicFee[i].isPaid ? Colors.green : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                '${transportFee[i].amount}',
                                                style: TextStyle(
                                                  color: transportFee[i].isPaid ? Colors.green : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ]),
                                      ],
                                    ),
                                  ),
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: Color(0xFF0C1D3B),
                  checkColor: Colors.white,
                  value:
                  _isChecked, // Add a boolean variable to track the checkbox state
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                Text(
                  'I accept the terms and conditions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 72, vertical: 6),
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
                  if (_isChecked && FeeTotal != 0) {

                    if (old?.amount != null && old!.amount != 0) {
                      selectedMonths['OldBal'] = old!.amount!;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrPage(
                          amount: FeeTotal + old!.amount,
                          selectedMonths: selectedMonths,
                        ),
                      ),
                    );
                  } else if (!_isChecked) {
                    // Display a SnackBar with the message about accepting terms and conditions
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please accept the terms and conditions.'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  } else {
                    // Display a SnackBar with the message about selecting a month
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select a month.'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: Text('Pay Fees',style: TextStyle(
                  color: Colors.white
              ),)
            ),
          ],
        ),
      ),
    );
  }
}




