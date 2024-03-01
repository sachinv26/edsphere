import 'package:flutter/material.dart';
import 'package:schoolapp/core/app_export.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/models/student_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {


  ClientProfile? client;
  @override
  void initState() {
    // TODO: implement initState
    client = AuthenticateUser.clientProfile;
    super.initState();
  }


  void launchWhatsApp(String phone) async {
    String defaultMessage = "Hi";
    String url = "whatsapp://send?phone=91$phone&text=${Uri.encodeComponent(defaultMessage)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {

    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1D3B),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_backspace),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Row(
          children: [
            Text(
              'Messaging',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF2BA1B),
      body: Center(
        child: Container(
          width: 300.v,
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08, vertical: screenHeight * 0.01),
              ),
              backgroundColor: MaterialStateProperty.all(Color(0xFF02335F)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              shadowColor: MaterialStateProperty.all(Color(0x14212121)),
              elevation: MaterialStateProperty.all(1),
            ),
            onPressed: () {
              launchWhatsApp(client?.contact1 ?? "");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                'Go to WhatsApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.30,
                ),
              ),
                Container(
                  child: Image.asset("assets/icons/whatsapp.png",fit: BoxFit.contain,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
