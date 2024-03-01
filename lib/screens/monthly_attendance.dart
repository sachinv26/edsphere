import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/student_model.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import '../data/models/attendance_model.dart';

class MonthlyPage extends StatefulWidget {
  @override
  State<MonthlyPage> createState() => _MonthlyPageState();
}

class _MonthlyPageState extends State<MonthlyPage> {
  List<StMonthlyAttendance> monthly = [];
  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  String selectedMonth = 'April';
  Token? token;
  @override
  void initState() {
    token = AuthenticateUser.token;
    updateMonthlyData(selectedMonth,token?.token ?? '');
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2BA1B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1D3B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Monthly Calendar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // Header container
              padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Color(0xFFF2BA1B),
              ),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Text(
                        'Yearly View',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  // Monthly view indicator
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF0C1D3B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Monthly View',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Yellow line separator
            Container(
              height: 4,
              width: double.infinity,
              color: Colors.yellow,
            ),
            // Dropdown to select month
            DropdownButton<String>(
              value: selectedMonth,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMonth = newValue!;
                  updateMonthlyData(selectedMonth,token?.token ?? '');
                });
              },
              items: months.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            // Table to display attendance data
            Container(
              margin: EdgeInsets.all(1),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20,
                  columns: [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Present', style: TextStyle(color: Colors.green))),
                    DataColumn(label: Text('Absent', style: TextStyle(color: Colors.red))),
                    DataColumn(label: Text('Leave', style: TextStyle(color: Colors.black))),
                    DataColumn(label: Text('Holiday', style: TextStyle(color: Colors.indigoAccent))),
                  ],
                  rows: monthly.map((attendance) {
                    String datePart = attendance.attendanceDt!.split(' ')[0];
                    DateTime dateTime = DateFormat('MM/dd/yyyy').parse(datePart);
                    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
                    return DataRow(cells: [
                      DataCell(Text(formattedDate, style: TextStyle(color: Colors.white))),
                      DataCell(Center(child: Text(attendance.present! ? 'P' : '', style: TextStyle(color: Colors.green)))),
                      DataCell(Center(child: Text(attendance.absent! ? 'A' : '', style: TextStyle(color: Colors.red)))),
                      DataCell(Center(child: Text(attendance.leave! ? 'L' : '', style: TextStyle(color: Colors.black)))),
                      DataCell(Center(child: Text(attendance.halfDay! ? 'HD' : '', style: TextStyle(color: Colors.indigoAccent)))),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update the data based on the selected month
  Future<void> updateMonthlyData(String selectedMonth,String token) async {
    final apiUrl = 'https://demo.shubhsoftsolution.in/api/Users/getAttendance/';
    final Map<String, dynamic> body = {
      "ClientId": "11",
      "ClientPwd": "1",
      "ClientCode": "2324999",
      "Parameter1": (months.indexOf(selectedMonth) + 1).toString(),
    };
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: headers,
    );

    if (response.statusCode == 200) {
      // Handle the response data
      var data = jsonDecode(response.body);
      // Assuming 'stMonthlyAttendance' is the key for the list in the API response
      List<dynamic> apiMonthlyData = data['stMonthlyAttendance'];

      // Convert API data to your model
      monthly = apiMonthlyData
          .map((attendanceData) => StMonthlyAttendance.fromJson(attendanceData))
          .toList();
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
    }

    setState(() {

    });
  }
}
