//
// import 'dart:convert';
// import 'package:lottie/lottie.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:miss_fit/common_widgets.dart';
// import 'package:miss_fit/screens/onboarding_screen/rough.dart';
// import 'package:miss_fit/widgets/custom_page_indiacator.dart';
//
// class RegistrationStatusPage extends StatefulWidget {
//   const RegistrationStatusPage({Key? key}) : super(key: key);
//
//   @override
//   _RegistrationStatusPageState createState() => _RegistrationStatusPageState();
// }
//
// class _RegistrationStatusPageState extends State<RegistrationStatusPage> {
//   int selectedIndex = 1;
//   bool isVisible=false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.cyanAccent,
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   SizedBox(height: 50),
//
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20.0,right: 20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//
//                         Image.asset("assets/registration/icon_right_arrow.png",scale: 2.2,),
//                         CustomPageIndicator(
//                           currentIndex: 3,
//                           itemCount: 5,
//                         ),
//                         skip_text("Skip")
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 50),
//                   txt_headline('How long do you like to workout for?'),
//                   SizedBox(height: 50),
//                   buildLevelContainer(0, 'Light Activity', 'About 10-20 minutes'),
//                   buildLevelContainer(1, 'Moderate Activity', 'About 30-40 minutes'),
//                   buildLevelContainer(2, 'Pro Activity', 'About 40-60 minutes'),
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20.0,right: 20),
//                     child: GestureDetector(
//                         onTap: (){
//                           setState(() {
//                             isVisible=true;
//                           });
//                         },
//                         child: buildNextButton(context)
//
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Opacity(
//               opacity: 0.80,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 decoration: BoxDecoration(color: Color(0xFF111827)),
//               ),
//             ),
//         Positioned(
//           bottom: 0,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: 303,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//             clipBehavior: Clip.antiAlias,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//           child:   Column(
//             children: [
//               SizedBox(
//                 height: 100,
//                 width: 100,
//                 child: Lottie.asset(
//                   'assets/lottie_anim/tik_anim.json', // Path to the Lottie JSON file in the assets folder
//                   height: 200, // Adjust height as needed
//                   width: 200, // Adjust width as needed
//                   fit: BoxFit.cover, // Adjust the fit
//                   repeat: false, // Play animation only once
//
//                 ),
//               ),
//
//               SizedBox(
//                 width: 320,
//                 child: Text(
//                   'Congratulations !',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFF334155),
//                     fontSize: 18,
//                     fontFamily: 'Archivo',
//                     fontWeight: FontWeight.w600,
//                     height: 1.08,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: SizedBox(
//                   width: 320,
//                   child: Text(
//                     'You Have successfullly registerd',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Color(0xFF334155),
//                       fontSize: 16,
//                       fontFamily: 'Archivo',
//                       fontWeight: FontWeight.w500,
//                       height: 1.09,
//                     ),
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0,right: 20),
//                 child: GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         isVisible=true;
//                       });
//                     },
//                     child: buildNextButton(context)
//
//                 ),
//               ),
//             ],
//           ),
//           ),
//         )
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildLevelContainer(int index, String title, String subtitle) {
//     Color titleColor = index == selectedIndex ? Colors.red : Color(0xFFFFA142);
//     Color borderColor = index == selectedIndex ? Colors.red : Color(0xFF252323);
//
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
//         child: Container(
//           width: 320,
//           height: 84,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//           clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(
//             color: Color(0xFF252323),
//             border: Border.all(
//               width: 1,
//               color: borderColor,
//             ),
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: titleColor,
//                   fontSize: 18,
//                   fontFamily: 'Archivo',
//                   fontWeight: FontWeight.w500,
//                   height: 1.08,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: TextStyle(
//                   color: Color(0xFFCBD5E1),
//                   fontSize: 14,
//                   fontFamily: 'Archivo',
//                   fontWeight: FontWeight.w400,
//                   height: 1.11,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }
//
//
