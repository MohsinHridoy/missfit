import 'package:flutter/material.dart';
import 'package:miss_fit/common_widgets.dart';

// class SelectableTextContainer extends StatefulWidget {
//   final String text;
//   final Function(String text, bool isSelected) onSelectChanged;
//
//   const SelectableTextContainer({
//     Key? key,
//     required this.text,
//     required this.onSelectChanged,
//   }) : super(key: key);
//
//   @override
//   _SelectableTextContainerState createState() =>
//       _SelectableTextContainerState();
// }
//
// class _SelectableTextContainerState extends State<SelectableTextContainer> {
//   bool isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isSelected = !isSelected;
//           widget.onSelectChanged(widget.text, isSelected);
//         });
//       },
//       child: Container(
//         width: 200,
//         height: 50,
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blue : Colors.grey,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: isSelected ? Colors.red : Colors.transparent,
//             // Change border color based on selection
//             width: 2, // Border width
//           ),
//         ),
//         padding: EdgeInsets.all(8),
//         margin: EdgeInsets.symmetric(vertical: 4),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               widget.text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontFamily: 'Archivo',
//                 fontWeight: FontWeight.w500,
//                 height: 0.09,
//               ),
//             ),
//             Icon(
//               isSelected ? Icons.check_circle : Icons.circle,
//               color: isSelected ? Colors.white : Colors.transparent,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Usage:


