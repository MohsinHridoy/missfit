import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'package:miss_fit/screens/splash_screen/splashScreen.dart';

import '../../providers/onboarding_state.dart';
import '../../strings.dart';
import '../../widgets/common_buttons.dart';
import '../../widgets/onboardingpage.dart';

// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   List<Widget> _pages = [
//     OnboardingPage(
//       title: '${onboardingPage_fr}',
//       description: ''
//           '${'Lorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.'}',
//       image: 'assets/onboarding/img_onboarding_4.png',
//     ),
//     OnboardingPage(
//       title: '${onboardingPage_fr2}',
//       description:
//           '${'Lorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.'}',
//       image: 'assets/onboarding/img_onboarding_5.png',
//     ),
//     OnboardingPage(
//       title: '${'Atteint tes objectifs'}',
//       description:
//           '${'Lorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.'}',
//       image: 'assets/onboarding/img_onbaording_6.png',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             color: Color(0xFFF6F6F6),
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: _pages.length,
//               onPageChanged: (int page) {
//                 setState(() {
//                   _currentPage = page;
//                 });
//               },
//               itemBuilder: (context, index) {
//                 return _pages[index];
//               },
//             ),
//           ),
//           if (_currentPage != 2)
//             Positioned(
//               bottom: 20.h,
//               left: 28,
//               right: 27,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         print("cliekd");
//
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginPage(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                           height: 30,
//                           width: 50,
//                           color: Colors.transparent,
//                           child: Center(
//                               child: Padding(
//                             padding: const EdgeInsets.only(top: 15.0),
//                             child: skip_text('${'Sauter'}'),
//                           ))),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         _pageController.nextPage(
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.ease,
//                         );
//                       },
//                       child: Container(
//                         width: 52,
//                         height: 52,
//                         // padding: const EdgeInsets.symmetric(
//                         //     horizontal: 32, vertical: 14),
//                         decoration: ShapeDecoration(
//                           color: Color(0xFFFF4343),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                         ),
//                         child: Center(
//                             child: Image.asset(
//                           "assets/onboarding/icon_left_arrow.png",
//                           width: 30,
//                           height: 30,
//                         )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           if (_currentPage != 0 && _currentPage != 1)
//             Positioned(
//                 bottom: 20.h,
//                 left: 27,
//                 right: 27,
//                 child:
//                     customButtonRed(context, '${'Commencer'}', onPressed: () {
//                   navigateToPage(
//                       context,
//                       LoginPage(
//                         status: 'onboarding',
//                       ));
//                 })),
//           Positioned(
//             top: MediaQuery.of(context).size.height *
//                 0.71, // Adjusted top position based on screen height
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               // Center the row horizontally
//               children: List.generate(
//                 _pages.length,
//                 (index) => buildIndicator(index),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildIndicator(int index) {
//     return Container(
//       width: _currentPage == index ? 27.0 : 8.0,
//       height: 8.0,
//       margin: EdgeInsets.symmetric(horizontal: 4.0),
//       decoration: BoxDecoration(
//         // shape:  _currentPage == index ?BoxShape.rectangle:BoxShape.circle,
//         color: _currentPage == index ? Color(0xFFFFA142) : Color(0xFFD1D5DB),
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//     );
//   }
// }
//
// void navigateToPage(BuildContext context, Widget destinationPage) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => destinationPage,
//     ),
//   );
// }
// Widget skip_text(String text) {
//   return Text(
//     text,
//     textAlign: TextAlign.center,
//     style: TextStyle(
//       color: Color(0xFF334155).withOpacity(0.9),
//       fontSize: 16,
//       fontFamily: 'Archivo',
//       fontWeight: FontWeight.w600,
//       height: 1.00,
//     ),
//   );
// }
class OnboardingScreen extends ConsumerWidget {
    List<Widget> _pages = [
    OnboardingPage(
      title: '${onboardingPage_fr}',
      description: ''
          '${'Lorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.'}',
      image: 'assets/onboarding/img_onboarding_4.png',
    ),
    OnboardingPage(
      title: '${onboardingPage_fr2}',
      description:
          '${'Lorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.'}',
      image: 'assets/onboarding/img_onboarding_5.png',
    ),
    OnboardingPage(
      title: '${'Atteint tes objectifs'}',
      description:
          '${'Lorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.'}',
      image: 'assets/onboarding/img_onbaording_6.png',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFF6F6F6),
            child: PageView.builder(
              controller: onboardingNotifier.pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                onboardingNotifier.setCurrentPage(page);
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          if (onboardingState != 2)
            Positioned(
              bottom: 20,
              left: 28,
              right: 27,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      onboardingNotifier.skipOnboarding(context);
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      color: Colors.transparent,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: skipText('Sauter'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onboardingNotifier.nextPage,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF4343),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/onboarding/icon_left_arrow.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (onboardingState == 2)
            Positioned(
              bottom: 20,
              left: 27,
              right: 27,
              child: customButtonRed(context, 'Commencer', onPressed: () {
                navigateToPage(context, LoginPage(status: 'onboarding'));
              }),
            ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.71,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                    (index) => buildIndicator(index, onboardingState),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(int index, int currentPage) {
    return Container(
      width: currentPage == index ? 27.0 : 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFFFFA142) : Color(0xFFD1D5DB),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  Widget skipText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF334155).withOpacity(0.9),
        fontSize: 16,
        fontFamily: 'Archivo',
        fontWeight: FontWeight.w600,
        height: 1.00,
      ),
    );
  }
}

void navigateToPage(BuildContext context, Widget destinationPage) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => destinationPage,
    ),
  );
}