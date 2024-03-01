import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'dart:convert';
import 'package:schoolapp/data/models/marks_model.dart';

class MarksApi {
  static List<MarksDetail> yearlymarksData = [];
  static List<MarksDetail> HyearlymarksData = [];

  static List<String> notes=[];
  static Future<void> getMarks(
      BuildContext context,
      String AdmsnNo,
      String ExamName,
      String SchoolCode,
      String token,
      ) async {
    String apiUrl = "https://demo.shubhsoftsolution.in/api/Users/getReportCardMarks/";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> ybody = {
      "AdmsnNo": AuthenticateUser.studentBasic?.admsnNo,
      "ExamName": "YearlyExam",
      "SchoolCode": "2324999"
    };
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(ybody),
      );
      if (response.statusCode == 200) {
        var temp = json.decode(response.body)['marksDetail'];
        yearlymarksData.clear();
        for (var i in temp) {
          MarksDetail marks = MarksDetail.fromJson(i);
          yearlymarksData.add(marks);
        }
        // TODO: Add logic to handle the marks data, such as updating the UI or storing the data.
      } else {
        // Handle errors
        print("Error: ${response.statusCode}, ${response.body}");
        // TODO: Add logic to handle API errors.
      }
    } catch (e) {
      // Handle exceptions
      print(e);
      // TODO: Add logic to handle API call exceptions.
    }

    final Map<String, dynamic> hbody = {
      "AdmsnNo": AuthenticateUser.studentBasic?.admsnNo,
      "ExamName": "HYearlyExam",
      "SchoolCode": "2324999"
    };
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(hbody),
      );
      if (response.statusCode == 200) {
        var temp = json.decode(response.body)['marksDetail'];
        HyearlymarksData.clear();
        for (var i in temp) {
          MarksDetail marks = MarksDetail.fromJson(i);
          HyearlymarksData.add(marks);
        }
        // TODO: Add logic to handle the marks data, such as updating the UI or storing the data.
      } else {
        // Handle errors
        print("Error: ${response.statusCode}, ${response.body}");
        // TODO: Add logic to handle API errors.
      }
    } catch (e) {
      // Handle exceptions
      print(e);
      // TODO: Add logic to handle API call exceptions.
    }
  }
}
