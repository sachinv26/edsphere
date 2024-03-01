import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:schoolapp/data/models/birthday_model.dart';

class StudentBirthdayInfoWidget extends StatefulWidget {
  final Birthday studentBirthday;

  StudentBirthdayInfoWidget({required this.studentBirthday});

  @override
  State<StudentBirthdayInfoWidget> createState() =>
      _StudentBirthdayInfoWidgetState();
}

class _StudentBirthdayInfoWidgetState
    extends State<StudentBirthdayInfoWidget> {
  Birthday? studentBirthday;

  @override
  void initState() {
    studentBirthday = widget.studentBirthday;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double imageDimension = deviceHeight * 0.1;

    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(deviceWidth * 0.01),
            child: CircleAvatar(
              radius: imageDimension / 2.3,
              backgroundImage: CachedNetworkImageProvider(
                studentBirthday?.photo ?? '',
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${studentBirthday?.firstName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceHeight * 0.020,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: deviceHeight * 0.005),
                Text(
                  "Class- ${studentBirthday?.stClass} Section- ${studentBirthday?.section}  Roll No: ${studentBirthday?.rollNo}",
                  style: TextStyle(
                    color: Color(0xFF797979),
                    fontSize: deviceHeight * 0.015,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                launchWhatsApp(studentBirthday?.mobile ?? "");
              },
              child: Icon(
                Icons.message,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void launchWhatsApp(String phone) async {
    String defaultMessage = "Happy Birthday! 🎉";
    String url =
        "whatsapp://send?phone=91$phone&text=${Uri.encodeComponent(defaultMessage)}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


class BirthdayPage extends StatelessWidget {
  final List<Birthday> birthdays;

  BirthdayPage({required this.birthdays});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2BA1B),
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
              // tooltip: MaterialLocalizations.pop(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Row(
          children: [
            Text(
              'Today Birthdays',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var birthday in birthdays)
                Padding(
                  padding: const EdgeInsets.only( top: 20),
                  child: StudentBirthdayInfoWidget(studentBirthday: birthday,),
                ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

