



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.red,
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height *
                0.68, // Adjusted height based on screen height
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 50.0.h),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF334155).withOpacity(0.9),
            fontSize: 24,
            fontFamily: 'Kanit-SemiBold',
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        SizedBox(height: 11.0.h),
        Padding(
          padding: EdgeInsets.only(left: 1, right: 1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF334155).withOpacity(0.9),
                fontSize: 16,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
