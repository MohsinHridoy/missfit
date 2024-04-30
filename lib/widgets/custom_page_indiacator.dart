import 'package:flutter/material.dart';






//
// class CustomPageIndicator extends StatelessWidget {
//   final int currentIndex;
//   final int itemCount;
//   final Color currentDotColor;
//   final Color previousDotColor;
//   final Color nextDotColor;
//   static const Color colour=Color(0xFFFFA142);
//   static const Color colourRed=Color(0xFFFF4343);
//   static const Color colourGrey=Color(0xFFD1D5DB);
//   const CustomPageIndicator({
//     Key? key,
//     required this.currentIndex,
//     required this.itemCount,
//     this.currentDotColor = colour,
//     this.previousDotColor = colourRed,
//     this.nextDotColor =colourGrey,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
//         itemCount,
//             (index) {
//           Color dotColor;
//           if (index == currentIndex) {
//             dotColor = currentDotColor;
//           } else if (index < currentIndex) {
//             dotColor = previousDotColor;
//           } else {
//             dotColor = nextDotColor;
//           }
//           return Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Container(
//               width:index ==currentIndex? 27:8,
//               height: 10,
//               decoration: BoxDecoration(
//                 shape: index == currentIndex?BoxShape.rectangle:BoxShape.circle,
//                 borderRadius:index == currentIndex? BorderRadius.circular(20):null, // Round rectangle border
//
//                 color: dotColor,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class CustomPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final List<Color> indicatorColors; // New parameter for specifying colors for each dot
  static const Color amberColor = Color(0xFFFFBF00); // Amber color

  const CustomPageIndicator({
    Key? key,
    required this.currentIndex,
    required this.itemCount,
    required this.indicatorColors, // Add the new parameter here
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
            dotColor = amberColor; // Use amber color for the current index
          }
          else {
            // dotColor = indicatorColors.length > index ? indicatorColors[index] : Color(0xFFD1D5DB); // Use the specified color if available, else grey
            dotColor = indicatorColors.length > index ? indicatorColors[index] : Color(0xFFD1D5DB).withOpacity(0.3); // Use the specified color if available, else grey
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: index == currentIndex ? 27 : 8,
              height: 8,
              decoration: BoxDecoration(
                shape: index == currentIndex ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: index == currentIndex ? BorderRadius.circular(20) : null,
                color: dotColor,
              ),
            ),
          );
        },
      ),
    );
  }
}