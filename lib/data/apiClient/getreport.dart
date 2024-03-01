import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/reportcard_model.dart';

class Report {
  static List<ReportCard> reports = [];
  static List<List<MarksDetail>> allSubjectMarks = [];
  static List<List<Note>> reviewnotes=[];
  static List<String> ExamName=[];
  static List<int> MaximumMarks=[];

  static Future<void> getReportCard(
      String clientId,
      String clientPwd,
      String clientCode,
      String token,
      ) async {
    String apiUrl = "https://demo.shubhsoftsolution.in/api/Users/getReportCardSetting/";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> body = {
      "ClientId": clientId,
      "ClientPwd": clientPwd,
      "ClientCode": clientCode,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var temp = json.decode(response.body);
        reports.clear();
        allSubjectMarks.clear(); // Clear the existing list of lists
        for (var i in temp) {
          ReportCard report = ReportCard.fromJson(i);
          reports.add(report);
          List<MarksDetail> marks = await getReportCardMarks(clientCode, report.examName, token);
          List<Note> noteee=  await getnotes(clientCode, report.examName, token);
          allSubjectMarks.add(marks);
          reviewnotes.add(noteee);
        }
        MaximumMarks.clear();
        ExamName.clear();

        for (var i in temp) {
          ReportCard report = ReportCard.fromJson(i);
          MaximumMarks.add(report.examMM);
          ExamName.add(report.examName);
        }
      } else {
        // Handle errors
        print("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      // Handle exceptions
      print(e.toString());
    }
  }

  static Future<List<MarksDetail>> getReportCardMarks(
      String schoolCode,
      String examName,
      String token,
      ) async {
    String apiUrl = "https://demo.shubhsoftsolution.in/api/Users/getReportCardMarks";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> body = {
      "AdmsnNo": AuthenticateUser.studentBasic?.admsnNo,
      "ExamName": examName,
      "SchoolCode": schoolCode,
    };

    List<MarksDetail> marks = [];
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var temp = json.decode(response.body)['marksDetail'];
        for (var i in temp) {
          MarksDetail marksDetail = MarksDetail.fromJson(i);
          marks.add(marksDetail);
        }
        // temp2 = json.decode(response.body)['note'];
      } else {
        // Handle errors
        print("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
    return marks;
  }

  static Future<List<Note>> getnotes(
      String schoolCode,
      String examName,
      String token,
      ) async {
    String apiUrl = "https://demo.shubhsoftsolution.in/api/Users/getReportCardMarks";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> body = {
      "AdmsnNo": AuthenticateUser.studentBasic?.admsnNo,
      "ExamName": examName,
      "SchoolCode": schoolCode,
    };

    List<Note> notessss = [];
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var temp = json.decode(response.body)['note'];
        for (var i in temp) {
          Note note = Note.fromJson(i);
          notessss.add(note);
        }
      } else {
        // Handle errors
        print("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
    return notessss;
  }

  static List<String> getExamNames() {
    return ExamName;
  }

  static List<int> getmaximarks(){
    return MaximumMarks;
  }
}
