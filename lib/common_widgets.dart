
import 'package:flutter/material.dart';

Widget buildNextButton(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 44,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    decoration: BoxDecoration(
      color: Color(0xFFFF4343),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        'Next',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Archivo-SemiBold',
          fontWeight: FontWeight.w500,
          height: 0.09,
        ),
      ),
    ),
  );
}




Widget txt_headline(String txt){
  return SizedBox(
    width: 320,
    child: Text(
      txt,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontFamily: 'Kanit-Medium',
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
    ),
  );
}