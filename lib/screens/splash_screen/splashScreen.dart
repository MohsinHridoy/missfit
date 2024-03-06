import 'package:flutter/material.dart';

import 'dart:async';

import 'package:miss_fit/screens/onboarding_screen/onboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task, such as loading data or initializing resources
    Timer(Duration(seconds: 3), () {
      // After 3 seconds, navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
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
        padding: const EdgeInsets.symmetric(horizontal: 62),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFF18181B)),
        child: Image.asset("assets/splash/splash_icon.png"),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to Home Screen!'),
      ),
    );
  }
}
