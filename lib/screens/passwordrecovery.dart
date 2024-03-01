import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PasswordRecoveryScreen extends StatefulWidget {
  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController loginCodeController = TextEditingController();

  Future<void> sendPasswordRecoveryRequest() async {
    final url = 'https://demo.shubhsoftsolution.in/api/Users/forgetPassword/';
    final headers = {'Content-Type': 'application/json'}; // Set the content type

    final Map<String, dynamic> requestData = {
      'Aadhar': aadharController.text.toString(),
      'Mobile': mobileController.text.toString(),
      'LoginCode': loginCodeController.text.toString(),
    };
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Password Recovery Successfully',
              style: TextStyle(
                color: Color(0xFF0C1D3B), // Set title color
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Login ID: ${responseData['loginId']}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Login Password: ${responseData['loginPwd']}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Login Code: ${responseData['loginCode']}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Color(0xFF0C1D3B), // Set button text color
                  ),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            backgroundColor: Colors.white,
          );
        },
      );
    } else {
      print('Failed to send password recovery request. Status code: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Your details do not match'),
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2BA1B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1D3B),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_backspace),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Text('Password Recovery',style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: aadharController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(12), // Restrict input to 10 characters
              ],
              decoration: InputDecoration(
                labelText: 'Aadhar',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10), // Restrict input to 10 characters
              ],
              decoration: InputDecoration(
                labelText: 'Mobile',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: loginCodeController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10), // Restrict input to 10 characters
              ],
              decoration: InputDecoration(
                labelText: 'Login Code',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                sendPasswordRecoveryRequest();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16.0,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
