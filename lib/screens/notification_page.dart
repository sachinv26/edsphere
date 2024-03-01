import 'package:flutter/material.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/notification_model.dart';
import 'package:schoolapp/data/apiClient/getnotifications.dart';
import 'package:schoolapp/data/models/student_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notifications = Notifications.notifications;
  StudentBasic? student;
  Token? token;

  @override
  void initState() {
    student = AuthenticateUser.studentBasic!;
    token = AuthenticateUser.token;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int unreadCount = notifications.where((notification) => !notification.readed).length;
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
                Navigator.pop(context,unreadCount);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Column(
          children: [
            Text(
              'Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            // Display the count of unread notifications
            Text(
              '$unreadCount Unread',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(
            notification: notifications[index],
            onTap: () async{
              // Handle notification tap, e.g., navigate to a detailed view
              await markNotificationAsRead(
              token?.token ?? '',
              notifications[index].id.toString(),
              );
              setState(() {
                notifications[index].readed = true;
              });
            },
          );
        },
      ),
    );
  }

  Future<void> markNotificationAsRead(String token, String notificationId) async {
    try {
      String apiEndpoint = 'https://demo.shubhsoftsolution.in/api/Users/readNotification';

      final Map<String, dynamic> body = {
        "AdmsnNo": AuthenticateUser.studentBasic?.admsnNo,
        "NotificationId": notificationId,
        "SchoolCode": AuthenticateUser.studentBasic?.schoolCode,
      };
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      };

      final response = await http.post(
        Uri.parse(apiEndpoint),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Update the UI state immediately
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

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  NotificationCard({
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: notification.readed ? Colors.green[300] : Colors.red,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: notification.readed ? Colors.grey[400]! : Colors.blue,
          width: 1.0,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: Text(
            notification.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: notification.readed ? Colors.black : Colors.black,
            ),
          ),
          subtitle: Text(
            notification.msg,
            style: TextStyle(
              color: notification.readed ? Colors.white : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
