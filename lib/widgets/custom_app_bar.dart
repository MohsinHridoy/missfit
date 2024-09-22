import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackTap;
  final double iconSpacing;

  CustomAppBar({
    required this.title,
    required this.onBackTap,
    required this.iconSpacing, // Default value for iconSpacing
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Colors.white.withOpacity(0.11)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onBackTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0,right: 0),
                child: Image.asset(
                  "assets/cart/icon_left_arrow.png",
                  scale: 2,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width /iconSpacing),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 18,
                fontFamily: 'Kanit-Medium',
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
