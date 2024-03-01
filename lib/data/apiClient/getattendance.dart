import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:schoolapp/data/models/attendance_model.dart';

class AttendanceApi {
  static List<StYearlyAttendance> yearlydata = [];
  static Future<void> getAttendance(
    BuildContext context,
    String clientId,
    String clientPwd,
    String clientCode,
    String parameter1,
    String token,
  ) async {
    String apiUrl =
        "https://demo.shubhsoftsolution.in/api/Users/getAttendance/";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> body = {
      "ClientId": clientId,
      "ClientPwd": clientPwd,
      "ClientCode": clientCode,
      "Parameter1": parameter1,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var temp = json.decode(response.body)['stYearlyAttendance'];
        yearlydata.clear();
        for (var i in temp) {
          StYearlyAttendance year = StYearlyAttendance.fromJson(i);
          yearlydata.add(year);
        }
        // TODO: Add logic to handle the attendance data, such as updating the UI or storing the data.
      } else {
        // Handle errors
        print("Error: ${response.statusCode}, ${response.body}");
        // TODO: Add logic to handle API errors.
      }
    } catch (e) {
      // Handle exceptions
      print("An error occurred while fetching attendance data");
      // TODO: Add logic to handle API call exceptions.
    }
  }
}
