import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'dart:async';

import 'package:miss_fit/screens/onboarding_screen/onboardingScreen.dart';
import 'package:miss_fit/screens/onboarding_screen/rough.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoggedInStatus(context);
  }

  // void _navigateToNextScreen() {
  //   Timer(Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => OnboardingScreen(),
  //       ),
  //     );
  //   });
  // }


  // void _checkLoggedInStatus(BuildContext context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   bool isLoggedOut = prefs.getBool('isLoggedOut') ?? false;
  //
  //   // Simulate a splash screen delay
  //   await Future.delayed(Duration(seconds: 3));
  //
  //   if (isLoggedOut) {
  //     //       // Clear login status and navigate to OnboardingScreen or LoginScreen
  //     // prefs.setBool('isLoggedOut', false);
  //
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginPage()),
  //     );
  //   } else {
  //     // Navigate to Dashboard if logged in
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => isLoggedIn ? DashBoard() : OnboardingScreen()),
  //     );
  //   }
  // }


  void _checkLoggedInStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isLoggedIn') ?? true;
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Simulate a splash screen delay
    await Future.delayed(Duration(seconds: 3));

    if (isFirstLaunch) {
      // First launch, navigate to OnboardingScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
      await prefs.setBool('first_launch', false); // Set first launch to false
    } else {
      // Not the first launch
      if (isLoggedIn) {
        // Navigate to Dashboard if logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      } else {
        // Navigate to LoginScreen if not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.20),
          child: Image.asset(
            "assets/splash/splash_icon.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}