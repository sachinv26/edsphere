import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_bloc.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_event.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_state.dart';
import 'package:schoolapp/screens/home_page.dart';
import 'package:schoolapp/widgets/clipper.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/main.dart';
import 'package:schoolapp/screens/passwordrecovery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController studentId = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController schoolCode = TextEditingController();

  bool obscureText = true;
  final double defaultPadding = 8.0;
  final double textFieldPadding = 6.0;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
        return Scaffold(
          body:Stack(
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
                          'Welcome Back!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF02335F),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        const Text(
                          'Enter your ID, Password & Login Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF02335F),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Container(
                          width: width * 0.9,
                          height: height * 0.65,
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
                                  "Student ID *",
                                  const TextStyle(
                                    color: Color(0xFF02335F),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                buildTextField("", studentId),
                                buildText(
                                  "Password *",
                                  const TextStyle(
                                    color: Color(0xFF02335F),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                buildPasswordField(password),
                                buildText(
                                  "Login Code *",
                                  const TextStyle(
                                    color: Color(0xFF02335F),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                buildTextField("", schoolCode),
                                SizedBox(height: height * 0.02),
                                Center(
                                  child:ElevatedButton(
                                    onPressed: () async {
                                      // Check for internet connectivity
                                      var connectivityResult = await (Connectivity().checkConnectivity());
                                      if (connectivityResult != ConnectivityResult.none) {
                                        // Internet connection is available, proceed with login
                                        String clientId = studentId.text;
                                        String clientPwd = password.text;
                                        String clientCode = schoolCode.text;
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.setString('id', clientId);
                                        prefs.setString('password', clientPwd);
                                        prefs.setString('schoolcode', clientCode);
                                        if (clientId.isEmpty || clientPwd.isEmpty || clientCode.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Please enter all fields'),
                                              duration: Duration(seconds: 1),
                                            ),
                                          );
                                        } else {
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                                        }
                                      } else {
                                        // No internet connection, show a Snackbar or other error message
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('No internet connection'),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      }
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
                                      children: [
                                        const Text(
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
                                SizedBox(height: height * 0.02),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Forgotten Password ?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PasswordRecoveryScreen()),
                                        );
                                      },
                                      child: Text(
                                        'Click Here ',
                                        textAlign: TextAlign.center,
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
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                ],
              )
    );
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
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
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.all(textFieldPadding),
      child: TextFormField(
        controller: controller,
        decoration: buildInputDecoration(labelText),
        keyboardType: TextInputType.phone,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10), // Restrict input to 10 characters
        ],
      ),
    );
  }
  Widget buildPasswordField(TextEditingController controller) {
    // Initially hide the password
    return Padding(
      padding: EdgeInsets.all(textFieldPadding),
      child: TextFormField(
        controller: controller,
        decoration: buildInputDecoration("").copyWith(
          // Add a suffix icon to toggle the visibility of the password
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
            onPressed: () {
              // Toggle the visibility of the password
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: obscureText, // Set the obscureText property
        inputFormatters: [
          LengthLimitingTextInputFormatter(10), // Restrict input to 10 characters
        ],
      ),
    );
  }

  Widget buildText(String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(
        top: defaultPadding,
        left: defaultPadding,
        bottom: defaultPadding,
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}


