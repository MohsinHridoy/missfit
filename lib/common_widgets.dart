
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildNextButton(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 52,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    decoration: BoxDecoration(
      color: Color(0xFFFF4343),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Suivante',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Archivo-SemiBold',
            fontWeight: FontWeight.w500,
            height: 0.09,
          ),
        ),
      ),
    ),
  );
}



Widget textAmW5S16(String title){

  return SizedBox(
    width: 235.h,
    child: Text(
      title,
      style: TextStyle(
        color: Color(0xFF334155),
        fontSize: 16,
        fontFamily: 'Archivo-Medium',
        fontWeight: FontWeight.w500,
        height: 0.09,
      ),
    ),
  );

}
Widget  buildDivider(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: Color(0xFFE5E7EB),
        ),
      ),
    ),
  );
}

Widget textVwSeeAll(String title){
  return SizedBox(
    height: 30,
    child: Center(
      child: Text(
        title,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFFFF4343),
          fontSize: 14,
          fontFamily: 'Archivo-Medium',
          fontWeight: FontWeight.w500,
          height: 0.10,
        ),
      ),
    ),
  );
}
Widget title_textView_Kt_SBld(String title){
  return Text(
    title,
    style: TextStyle(
      color: Color(0xFF334155),
      fontSize: 20,
      fontFamily: 'Kanit-SemiBold',
      fontWeight: FontWeight.w600,
      height: 0.06,
    ),
  );
}


Widget title_textView(String title){
  return Padding(
    padding: const EdgeInsets.only(left: 3.0),
    child: Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Color(0xFF334155),
        fontSize: 24,
        fontFamily: 'Kanit-Medium',
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
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
