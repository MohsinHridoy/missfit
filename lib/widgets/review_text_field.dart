

import 'package:flutter/material.dart';

Widget buildReviewTextField(BuildContext context,TextEditingController textEditingController) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 160,
    decoration: ShapeDecoration(
      // color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFFD1D5DB)),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        controller: textEditingController,
        maxLines: null,

        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 16,
          fontFamily: 'Archivo-Medium',
          fontWeight: FontWeight.w500,
          height: 1.09,

        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15,top: 10,right: 15),
          hintText: 'Décrivez votre expérience (facultatif)', // Your hint text here
          hintStyle: TextStyle(
            color: Color(0xFF334155),
            fontSize: 16,
            fontFamily: 'Archivo-Medium',
            fontWeight: FontWeight.w500,
            height: 1.09,

          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}