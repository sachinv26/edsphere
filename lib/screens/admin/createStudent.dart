import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/clipper.dart';

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({Key? key}) : super(key: key);

  @override
  _StudentFormPageState createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController admissionNoController = TextEditingController();
  final TextEditingController admissionDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoad= false;
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
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                      'Student Registration',
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
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildText("Name *"),
                            buildTextField("", nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a name';
                                  }
                                  return null;
                                }),
                            buildText("Email *"),
                            buildTextField("", emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  // Add custom validation for email if needed
                                  return null;
                                }),
                            buildText("Password *"),
                            buildTextField("", passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                }),
                            buildText("Number *"),
                            buildTextField("", numberController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a number';
                                  }
                                  return null;
                                }),
                            buildText("Class *"),
                            buildTextField("", classController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a class';
                                  }
                                  return null;
                                }),
                            buildText("Date of Birth *"),
                            buildTextField("", dobController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter date of birth';
                                  }
                                  return null;
                                }),
                            buildText("Father's Name *"),
                            buildTextField("", fatherNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter father's name";
                                  }
                                  return null;
                                }),
                            buildText("Mother's Name *"),
                            buildTextField("", motherNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter mother's name";
                                  }
                                  return null;
                                }),
                            buildText("Gender *"),
                            buildTextField("", genderController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter gender';
                                  }
                                  return null;
                                }),
                            buildText("Address *"),
                            buildTextField("", addressController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter address';
                                  }
                                  return null;
                                }),
                            buildText("Admission No *"),
                            buildTextField("", admissionNoController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter admission number';
                                  }
                                  return null;
                                }),
                            buildText("Admission Date *"),
                            buildTextField("", admissionDateController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter admission date';
                                  }
                                  return null;
                                }),
                            SizedBox(height: height * 0.02),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, submit student details
                                    submitStudentDetails();
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
                                  children: const [
                                    Text(
                                      'Register',
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
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ),
          ),
          if(isLoad)
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              color: Colors.lightBlue.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      {String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
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
      ),
    );
  }

  Widget buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF02335F),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void submitStudentDetails() async {
    // Get the current user's email
  //  String userEmail = FirebaseAuth.instance.currentUser!.email!;

    // Get student details from text controllers

    setState(() {
      isLoad= true;
    });

    String name = nameController.text;
    String email = emailController.text.toLowerCase();
    String number = numberController.text;
    String classValue = classController.text;
    String dob = dobController.text;
    String fatherName = fatherNameController.text;
    String motherName = motherNameController.text;
    String gender = genderController.text;
    String address = addressController.text;
    String admissionNo = admissionNoController.text;
    String admissionDate = admissionDateController.text;
    String password= passwordController.text;

    // Create a map of student data
    Map<String, dynamic> studentData = {
      'name': name,
      'email': email,
      'number': number,
      'password':password,
      'class': classValue,
      'dob': dob,
      'fatherName': fatherName,
      'motherName': motherName,
      'gender': gender,
      'address': address,
      'admissionNo': admissionNo,
      'admissionDate': admissionDate,
    };

    // Reference to Firestore collection
    CollectionReference students =
    FirebaseFirestore.instance.collection('scl1001').doc("students").collection("students");

    // Add student data to Firestore with email as document ID
    await students.doc(email).set(studentData, SetOptions(
      merge: true
    )).then((value) {
      addressController.clear();
      nameController.clear();
      emailController.clear();
      classController.clear();
      dobController.clear();
      fatherNameController.clear();
      motherNameController.clear();
      genderController.clear();
      admissionDateController.clear();
      admissionNoController.clear();
      passwordController.clear();
      setState(() {
        isLoad= false;
      });
    });

    // Show a snackbar indicating successful registration
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Student registered successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
