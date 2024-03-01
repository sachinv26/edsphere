import 'package:flutter/material.dart';
import 'package:schoolapp/core/app_export.dart';
import 'package:schoolapp/data/apiClient/getattendance.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/attendance_model.dart';
import 'package:schoolapp/data/models/student_model.dart';
import 'package:schoolapp/screens/monthly_attendance.dart';
import 'package:schoolapp/widgets/studentinfo.dart';

class YearlyPage extends StatefulWidget {
  @override
  State<YearlyPage> createState() => _YearlyPageState();
}

class _YearlyPageState extends State<YearlyPage> {

  final ScrollController _firstController = ScrollController();
  final ScrollController _secondController = ScrollController();
  List<StYearlyAttendance> yearly = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF2BA1B),
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
        title: const Row(
          children: [
            Text(
              'Attendance',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left:30,right:30,top: 10,bottom: 10),
              decoration: BoxDecoration(
                color: Color(0xFFF2BA1B), // Set the color for the active page
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for the "Yearly View" page
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF0C1D3B),
                        borderRadius: BorderRadius.circular(10),// Set the color for the active page
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Yearly View',
                        style: TextStyle(
                          color: Colors.white, // Set the text color for the active page
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MonthlyPage(),
                        ),
                      );
                    },
                    child: Container(
                      child: Text(
                        'Monthly View',
                        style: TextStyle(
                          color: Colors.black, // Set the text color for the inactive page
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to generate a random value for present and absent days
}

class CustomMonthContainer extends StatelessWidget {
  final String monthName;

  CustomMonthContainer({required this.monthName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.h,
      height: 36,
      padding: EdgeInsets.only(top: 10, left: 10),
      margin: EdgeInsets.only(left: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.30, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0C212121),
            blurRadius: 1,
            offset: Offset(1, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Text(
        monthName,
        // textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
  }
}



