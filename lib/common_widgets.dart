
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/widgets/dashedlinepainter.dart';

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
          width: 0.6,
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




Widget buildSummeryItemText(BuildContext context,String title, String value) {
  return Padding(
    padding:
    const EdgeInsets.only(left: 26.0, right: 26, top: 7, bottom: 7),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                title,
                style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                    height: 1.09,
                    wordSpacing: 1),
              ),
            ),
            SizedBox(
              width: 71,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 16,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 1.09,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 15,),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              // side: BorderSide(
              //   width: 0.5,
              //   color: Colors.grey.withOpacity(0.3),
              // ),
            ),
          ),
          child: CustomPaint(
            painter: DashedLinePainter(),
          ),
        )
      ],
    ),
  );
}

Widget buildSummeryItemText1(String title, String value) {
  return Padding(
    padding:
    const EdgeInsets.only(left: 26.0, right: 26, top: 7, bottom: 12),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                title,
                style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                    height: 1.09,
                    wordSpacing: 1),
              ),
            ),
            SizedBox(
              width: 71,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 16,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10,),

      ],
    ),
  );
}



Widget buildEsrtimatedDateStatus(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              width: 122,
              child: Text(
                'Estimated Date',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 14,
                  fontFamily: 'Archivo-Medium',
                  fontWeight: FontWeight.w500,
                  height: 1.10,
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 90,
            child: Text(
              '20 Mar - 26 Mar',
              style: TextStyle(
                color: Color(0xFF66758C),
                fontSize: 12,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
                height: 1.12,
              ),
            ),
          )
        ],
      ),
    ),
  );
}


Widget buildPaymentMethodStatus() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      clipBehavior: Clip.antiAlias,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 6),
              child: Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(12),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFF3F4F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/payment/img_delivary_item2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: 153,
                      child: Text(
                        "Stripe",
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Regular',
                          fontWeight: FontWeight.w400,
                          height: 1.09,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      height: 10,
                      child: Text(
                        '•••• •••• •••• 222323',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Regular',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    ),
  );
}
