import 'package:http/http.dart' as http;
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/study_material.dart';
import 'dart:convert';

class Study {
  static List<StudyMaterialClass> materials = [];

  static Future<void> getstudymaterial(
      String clientcode,
      String token,
      ) async {
    String apiUrl =
        "https://demo.shubhsoftsolution.in/api/Users/GetStudyMaterial/";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> body = {
      "SchoolCode": AuthenticateUser.studentBasic?.schoolCode.toString(),
      "ClassName": AuthenticateUser.studentBasic?.kclass.toString(),
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        materials.clear();
        var temp = json.decode(response.body);
        for (var i in temp) {
          StudyMaterialClass noti = StudyMaterialClass.fromJson(i);
          materials.add(noti);
        }
        print(materials);
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
