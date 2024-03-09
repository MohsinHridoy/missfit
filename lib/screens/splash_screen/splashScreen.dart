import 'package:flutter/material.dart';
import 'dart:async';

import 'package:miss_fit/screens/onboarding_screen/onboardingScreen.dart';
import 'package:miss_fit/screens/onboarding_screen/rough.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 3 seconds
    Timer(Duration(seconds: 3), () {
      // After 3 seconds, navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen1(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Customize your splash screen UI here
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
        color: Color(0xFF18181B),
        child: Image.asset(
          "assets/splash/splash_icon.png",
          fit: BoxFit.contain, // Adjust image fit to contain within the container
        ),
      ),
    );
  }
}