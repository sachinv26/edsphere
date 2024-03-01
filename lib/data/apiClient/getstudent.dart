import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:schoolapp/data/apiClient/getattendance.dart';
import 'package:schoolapp/data/apiClient/getbirthdays.dart';
import 'package:schoolapp/data/apiClient/getevents.dart';
import 'package:schoolapp/data/apiClient/getfee.dart';
import 'package:schoolapp/data/apiClient/getreport.dart';
import 'package:schoolapp/data/apiClient/getstudymaterial.dart';
import 'package:schoolapp/main.dart';
import 'package:schoolapp/mainpage.dart';
import 'package:schoolapp/data/models/student_model.dart';
import 'package:schoolapp/data/apiClient/getnotifications.dart';

class AuthenticateUser {
  static StudentBasic? studentBasic;
  static StudentFamily? studentFamily;
  static List<MenuDetail> menuDetail = [];
  static AppSetting? appSetting;
  static ClientProfile? clientProfile;
  static Token? token;

  static Future<void> authenticateUser(BuildContext context, String clientId,
      String clientPwd, String clientCode) async {
    String apiUrl = "https://demo.shubhsoftsolution.in/api/Users/Authenticate/";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
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
        studentBasic =
            StudentBasic.fromJson(json.decode(response.body)['studentBasic']);
        studentFamily =
            StudentFamily.fromJson(json.decode(response.body)['studentFamily']);
        appSetting =
            AppSetting.fromJson(json.decode(response.body)['appSetting']);
        clientProfile =
            ClientProfile.fromJson(json.decode(response.body)['clientProfile']);
        var temp = json.decode(response.body)['menuDetail'];

        menuDetail.clear();
        // menuDetail = MenuDetail.fromJson(json.decode(response.body)['menuDetail']);
        for (var i in temp) {
          MenuDetail menu = MenuDetail.fromJson(i);
          menuDetail.add(menu);
        }
        token = Token.fromJson(json.decode(response.body)['token']);
        await AttendanceApi.getAttendance(
          context,
          clientId,
          clientPwd,
          clientCode,
          clientId, // Replace with the actual parameter1 value
          token?.token ?? '',
        );
        await Notifications.getnotification(
            clientId, clientPwd, clientCode, token?.token ?? '');
        await Events.getEvents(
            clientId, clientPwd, clientCode, token?.token ?? '');
        await FeeApi.getDues(clientCode, clientId, token?.token ?? '');
        await Birthdays.getBirthdays(
            clientId, clientPwd, clientCode, token?.token ?? '');
        await Report.getReportCard(
            clientId, clientPwd, clientCode, token?.token ?? '');
        await Study.getstudymaterial(studentBasic!.kclass.toString(),token?.token ?? '');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainPage()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Successful'),
            duration:
            Duration(seconds: 1), // You can adjust the duration as needed
          ),
        );
        // TODO: Add logic to handle the authentication response, such as navigating to the next screen.
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Student not found!'),
            duration:
                Duration(seconds: 1), // You can adjust the duration as needed
          ),
        );
        // wrongpassword=true;
        // if(checkagain==false){
        //     if(wrongpassword==true){
        //   Navigator.pop(context);
        // }
        // }
        // TODO: Add logic to handle authentication errors.
      }
    } catch (e) {
    }
  }
}
