import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:schoolapp/data/models/event_model.dart'; // Assuming you have an EventModel class

class Events {
  static List<Event> events = [];

  static Future<void> getEvents(
      String clientId,
      String clientPwd,
      String clientCode,
      String token,
      ) async {
    String apiUrl = "https://demo.shubhsoftsolution.in/api/Users/getHolidayDetail/";

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
        events.clear();
        for (var i in temp) {
          Event event = Event.fromJson(i);
          events.add(event);
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
