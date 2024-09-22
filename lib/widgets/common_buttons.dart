import 'package:flutter/material.dart';




Widget outlineButton(BuildContext context,String title){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 52,

    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side:
        BorderSide(width: 1, color: Color(0xFFFF4343)),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFFFF4343),
          fontSize: 14,
          fontFamily: 'Archivo-SemiBold',
          fontWeight: FontWeight.w600,
          height: 1.00,
        ),
      ),
    ),
  );
}

Widget deactiveButton(BuildContext context,String title){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 52,
    decoration: ShapeDecoration(
      color: Color(0xFFD1D5DB),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child:  Center(
      child: Text(
        'Suivante',
        style: TextStyle(
          color: Color(0xFF66758C),
          fontSize: 16,
          fontFamily: 'Archivo-SemiBold',
          fontWeight: FontWeight.w600,
          height: 1.09,
        ),
      ),
    ),
  );
}

Widget customButtonRed(BuildContext context, String buttonText, {VoidCallback? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      decoration: BoxDecoration(
        color: Color(0xFFFF4343),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child:  Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Archivo-SemiBold',
            fontWeight: FontWeight.w600,
            height: 1.09,

          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}


