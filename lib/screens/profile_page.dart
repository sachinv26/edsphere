import 'package:flutter/material.dart';
import 'package:schoolapp/core/app_export.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(label),
              Spacer(),
              Text(value),
            ],
          ),
          Divider(thickness: 1,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              'Profile',
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
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: const Color(0xFF0C1D3B),
                width: double.infinity,
                child: Center(child: Image.asset("assets/icons/childlogo.png")),
              ),
            ],
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 150.0, left: 30.0, right: 30.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 25.h),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
              ),
              // height: 350.h,
              width: 500.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Student’s Information',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildDataRow('Name', 'Sachin Verma'),
                    buildDataRow('Father', 'XYZ'),
                    buildDataRow('Class', '2ND'),
                    buildDataRow('Gender', 'MALE'),
                    buildDataRow('Date of Birth', '26/07/2022'),
                    buildDataRow('Mobile No', '9026634459'),
                    buildDataRow(
                      'Address',
                      'Gomti Nagar',
                    ),
                    buildDataRow('Bus Name', '2'),
                    buildDataRow('Admission No', '201b225'),
                    buildDataRow('Admission Date', '26/07/2002'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
