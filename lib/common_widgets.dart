
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
          fontSize: 14,
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w500,
          height: 0.11,
        ),
      ),
    ),
  );
}




Widget txt_headline(String txt){
  return  Text(
    txt,
    style: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: 'Kanit',
      fontWeight: FontWeight.w500,
      height: 1.05,
    ),
  );
}