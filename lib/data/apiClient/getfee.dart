import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:schoolapp/data/models/fees_model.dart';

class FeeApi {
  static List<FeeDetail> feedetails = [];
  static List<String> itemIds = [];
  static Future<void> getDues(
      String instituteId,
      String enrolmentNo,
      String token,
      ) async {
    final String apiUrl = 'https://demo.shubhsoftsolution.in/api/Users/GetDues/';
    final Uri uri = Uri.parse('$apiUrl?institute_id=$instituteId&enrolment_no=$enrolmentNo');

    try {
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parsing the JSON response
        feedetails.clear();
        var data = json.decode(response.body)['fee_details'];
        for (var i in data) {
          FeeDetail fee = FeeDetail.fromJson(i);
          feedetails.add(fee);
        }
        itemIds.clear();
        var otherFeeDetailsArray = json.decode(response.body)['other_Fee_details'];
        for (var otherFeeDetailsData in otherFeeDetailsArray) {
          var itemId = otherFeeDetailsData['item_id'];
          itemIds.add(itemId);
        }
      } else {
        // If the request was not successful, throw an exception with the response
        throw http.Response(response.body, response.statusCode);
      }
    } catch (error) {
      print('Error is here only: $error');
      throw error; // Re-throw the error to propagate it to the caller
    }
  }
}
