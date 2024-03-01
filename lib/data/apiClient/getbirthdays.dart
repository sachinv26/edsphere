import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:schoolapp/data/models/birthday_model.dart';

class Birthdays {
  static List<Birthday> birthdays = [];

  static Future<void> getBirthdays(
    String clientId,
    String clientPwd,
    String clientCode,
    String token,
  ) async {
    String apiUrl =
        "https://demo.shubhsoftsolution.in/api/Users/GetStudentBirthDay/";

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
        birthdays.clear();
        for (var i in temp) {
          Birthday birthday = Birthday.fromJson(i);
          birthdays.add(birthday);
        }
      } else {
        // Handle errors
        print("Error: ${response.statusCode}, ${response.body}");
        // TODO: Add logic to handle API errors.
      }
    } catch (e) {
      // Handle exceptions
      print(e.toString());
      // TODO: Add logic to handle API call exceptions.
    }
  }
}
