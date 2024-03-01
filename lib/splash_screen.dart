import 'dart:async';
import 'package:flutter/material.dart';
import 'package:schoolapp/services/loginpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _initAnimation();
    _initTimer();
    super.initState();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    );
    _animationController.forward();
  }

  void _initTimer() {
    Timer(
      Duration(milliseconds: 2500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildSplashScreenUI(height),
    );
  }

  Widget _buildSplashScreenUI(double height) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage('assets/icons/bannerbackground.png'),
        ),
      ),
      child: Container(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            "assets/icons/schoollogo.png",
            height: height * 0.3,
          ),
        ),
      ),
    );
  }
}
