import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';

class LevelContainer extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final int selectedIndex;
  final Function(int) onTap; // Callback function for tap
  final Color selectedTitleColor;
  final Color defaultTitleColor;
  final Color selectedBorderColor;
  final Color defaultBorderColor;

  const LevelContainer({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.selectedIndex,
    required this.onTap,
    this.selectedTitleColor = const Color(0xFFE88E32),
    this.defaultTitleColor = const Color(0xFF334155),
    this.selectedBorderColor = const Color(0xFFFFA142),
    this.defaultBorderColor = const Color(0xFFE5E7EB),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color titleColor = index == selectedIndex ? selectedTitleColor : defaultTitleColor;
    Color borderColor = index == selectedIndex ? selectedBorderColor : defaultBorderColor;

    return GestureDetector(
      onTap: () async {
        onTap(index); // Trigger the callback with the selected index
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.4.h), // Make vertical padding responsive
        child: Container(
          width: 320.w, // Scale width responsively
          padding: EdgeInsets.symmetric(
            horizontal: 20.w, // Responsive horizontal padding
            vertical: 16.h,   // Responsive vertical padding
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(4.r), // Responsive border radius
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Allow the column to take the minimum required space
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.h), // Responsive padding
                child: item_txt_Archvo_M_500(title, titleColor),
              ),
              SizedBox(height: 8.h), // Responsive height
              subItem_txt_Archvo_R_400(subtitle),
            ],
          ),
        ),
      ),
    );
  }
}
