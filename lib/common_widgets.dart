
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


Widget title_textView(String title){
  return Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color(0xFF1E293B),
      fontSize: 18,
      fontFamily: 'Kanit-Medium',
      fontWeight: FontWeight.w500,
    ),
  );
}





Widget item_txt_Archvo_M_500(String title,Color colour){
 return  Text(
    title,
    style: TextStyle(
      color: colour,
      fontSize: 18,
      fontFamily: 'Archivo-Medium',
      fontWeight: FontWeight.w500,
      height: 1.08,
    ),
  );
}
Widget subItem_txt_Archvo_R_400(String title){
  return  Text(
    title,
    style: TextStyle(
      color: Color(0xFF475569),
      fontSize: 14,
      fontFamily: 'Archivo-Regular',
      fontWeight: FontWeight.w400,
      height: 1.11,
    ),
  );
}
