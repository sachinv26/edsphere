import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_bloc.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_state.dart';
import 'package:schoolapp/mainpage.dart';
import 'package:schoolapp/services/loginpage.dart';
import 'package:schoolapp/splash_screen.dart';
import 'package:flutter/services.dart';
import 'core/utils/pref_utils.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
