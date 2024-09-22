import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/screens/termsconditions/terms_conditions.dart';

import '../common_utils.dart';

class TermsAndConditionsText extends StatelessWidget {
  final String regularText;
  final String highlightedText;

  const TermsAndConditionsText({
    Key? key,
    required this.regularText,
    required this.highlightedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        navigateToNextPage(context,TermConditions());

      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // Full screen width
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: regularText,
                style: TextStyle(
                  color: Color(0xFF66758C),
                  fontSize: 16,
                  fontFamily: 'Archivo-Medium',
                  fontWeight: FontWeight.w500,
                  height: 1.3, // Adjusted for better readability
                ),
              ),
              TextSpan(
                text: highlightedText,
                style: TextStyle(
                  color: Color(0xFFFFA142),
                  fontSize: 16,
                  fontFamily: 'Archivo-Medium',
                  fontWeight: FontWeight.w500,
                  height: 1.3, // Adjusted for better readability
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
