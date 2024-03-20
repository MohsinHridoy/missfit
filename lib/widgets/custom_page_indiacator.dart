import 'package:flutter/material.dart';







class CustomPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final Color currentDotColor;
  final Color previousDotColor;
  final Color nextDotColor;
  static const Color colour=Color(0xFF22C55E);
  static const Color colourRed=Color(0xFFFF4343);
  static const Color colourGrey=Color(0xFFD1D5DB);
  const CustomPageIndicator({
    Key? key,
    required this.currentIndex,
    required this.itemCount,
    this.currentDotColor = colour,
    this.previousDotColor = colourRed,
    this.nextDotColor =colourGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
            (index) {
          Color dotColor;
          if (index == currentIndex) {
            dotColor = currentDotColor;
          } else if (index < currentIndex) {
            dotColor = previousDotColor;
          } else {
            dotColor = nextDotColor;
          }
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor,
              ),
            ),
          );
        },
      ),
    );
  }
}