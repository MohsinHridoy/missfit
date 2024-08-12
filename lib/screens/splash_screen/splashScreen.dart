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
    _checkLoggedInStatus();
  }

  void _checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstLaunchStatus = prefs.getString('first_launch_status') ?? 'first_time';
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    // bool isFirstLaunch=false;
    // Log the values for debugging
    print("isFirstLaunch: $firstLaunchStatus");
    print("isLoggedIn: $isLoggedIn");
    // Simulate a splash screen delay
    await Future.delayed(Duration(seconds: 3));

    if (firstLaunchStatus == 'first_time') {
      // First launch, navigate to OnboardingScreen
      // await prefs.setBool('first_launch', false); // Set first launch to false


      navigateToNextPage(context,OnboardingScreen());

    } else {
     print("+++++++++++++++++++++++++");
      print(isLoggedIn);
      // Not the first launch
      if (isLoggedIn) {
        // Navigate to Dashboard if logged in

        print(isLoggedIn);

        navigateToNextPage(context,DashBoard());

      } else {
        // Navigate to LoginScreen if not logged in


        navigateToNextPage(context,LoginPage());

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