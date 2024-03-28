import 'package:flutter/material.dart';

import '../screens/admin/adminHome.dart';
import '../widgets/clipper.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController adminIdController = TextEditingController();
  final TextEditingController adminPasswordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  ClipPath(
                    clipper: Clip2(),
                    child: Container(
                      color: const Color(0xFFBFD6FF),
                      width: width * 0.5,
                      height: height * 0.25,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  ClipPath(
                    clipper: Clip1(),
                    child: Container(
                      color: const Color(0xFFFFEEBC),
                      height: height * 0.25,
                      width: width * 0.5,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/schoollogo.png",
                      height: height * 0.15,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                const Text(
                  'Admin Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF02335F),
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  width: width * 0.9,
                  height: height * 0.45,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.30, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26212121),
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(
                          "School ID *",
                          const TextStyle(
                            color: Color(0xFF02335F),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        buildTextField("", adminIdController),
                        buildText(
                          "Password *",
                          const TextStyle(
                            color: Color(0xFF02335F),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        buildPasswordField(adminPasswordController),
                        SizedBox(height: height * 0.02),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomeScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF02335F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Student Login?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Click Here',
                                style: TextStyle(
                                  color: Color(0xFF02335F),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.10, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.10, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey.shade300,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget buildPasswordField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "",
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.10, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.10, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey.shade300,
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }

  Widget buildText(String text, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        bottom: 8.0,
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

class Clip111 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Clip22 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height * 0.25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
