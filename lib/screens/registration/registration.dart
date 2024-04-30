import 'package:flutter/material.dart';
import 'package:miss_fit/screens/activityselectionpage/activity_selection_page.dart';
import 'package:miss_fit/screens/basicinformation/basic_info.dart';
import 'package:miss_fit/screens/fitnessgoalpage/fitness_goal_page.dart';
import 'package:miss_fit/screens/levelselectionpage/advancement_level_selection_page.dart';
import 'package:miss_fit/screens/measurementscreen/test.dart';
import 'package:miss_fit/screens/onboarding_screen/rough.dart';
import 'package:miss_fit/widgets/custom_page_indiacator.dart';

import 'package:async/async.dart'; // Import the async package for debouncing

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}
// class _RegistrationState extends State<Registration> {
//   late PageController _pageController;
//   int _currentPage = 0;
//   List<Color> _indicatorColors = List.filled(5, Colors.grey); // Default indicator colors, set to grey for previous dots
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//     _pageController.addListener(_pageListener);
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   void _pageListener() {
//     setState(() {
//       _currentPage = _pageController.page!.round();
//     });
//   }
//
//   void _navigateToNextPage() {
//     if (_currentPage < 4) {
//       if (_indicatorColors[_currentPage] != Colors.red) {
//         _indicatorColors[_currentPage] = Colors.green;
//       }
//       _currentPage++;
//       _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
//     }
//   }
//
//   void _navigateToPreviousPage() {
//     if (_currentPage > 0) {
//       _currentPage--;
//       _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
//     }
//   }
//
//   void _onSkipButtonPressed() {
//     setState(() {
//       _indicatorColors[_currentPage] = Colors.red;
//     });
//     _navigateToNextPage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color(0xFFF6F6F6),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 70,),
//             Padding(
//               padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       _navigateToPreviousPage();
//                     },
//                     child: Image.asset("assets/registration/icon_right_arrow.png", scale: 2.2,),
//                   ),
//                   CustomPageIndicator(
//                     currentIndex: _currentPage,
//                     itemCount: 5,
//                     indicatorColors: _indicatorColors, // Use specific indicator colors
//                   ),
//                   GestureDetector(
//                     onTap: _onSkipButtonPressed,
//                     child: Text(
//                       'Skip',
//                       style: TextStyle(
//                         color: Color(0xFF334155),
//                         fontSize: 16,
//                         fontFamily: 'Archivo',
//                         fontWeight: FontWeight.w400,
//                         height: 1.09,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 physics: NeverScrollableScrollPhysics(), // Disable swipe gesture
//                 children: [
//                   BasicInfo(
//                     onNextPressed: () {
//                       _navigateToNextPage();
//                     },
//                   ),
//                   ActivitySelectionPage(
//                     onNextPressed: () {
//                       _navigateToNextPage();
//                     },
//                   ),
//                   AdvanceLevelSelectionPage(),
//                   FitnessGoal(),
//                   TestScroll(),
//                   ActivitySelectionPage(
//                     onNextPressed: () {
//                       _navigateToNextPage();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _RegistrationState extends State<Registration> {
  late PageController _pageController;
  int _currentPage = 0;
  List<Color> _indicatorColors = List.filled(5, Color(0xFFD1D5DB)); // Default indicator colors, set to grey for previous dots

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _currentPage = _pageController.page!.round();
    });
  }


  // void _navigateToPreviousPage() {
  //   if (_currentPage > 0) {
  //     _currentPage--;
  //     _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  //   }
  // }

  // Define a variable to track whether a color change debounce is pending
  bool _isColorChangePending = false;

// Define a function to update indicator color with debouncing
  void _updateIndicatorColorWithDebounce(int index, Color color) {
    // if (!_isColorChangePending) {
    //   setState(() {
    //   });
    //   _isColorChangePending = true;
    //   Future.delayed(Duration(milliseconds: 500), () {
    //     setState(() {
    //       _isColorChangePending = false;
    //     });
    //   });
    // }
    setState(() {
    });
    _indicatorColors[index] = color;

  }

// Usage example:
  void _navigateToPreviousPage() {
    if (_currentPage > 0) {
      _indicatorColors[_currentPage] = Color(0xFFD1D5DB);

      _currentPage--;
      _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      // _indicatorColors[_currentPage] = Color(0xFF22C55E);


    }
  }

  void _navigateToNextPage() {
    if (_currentPage < 4) {
      _indicatorColors[_currentPage] = Color(0xFF22C55E);
      _currentPage++;
      _indicatorColors[_currentPage] = Color(0xFFD1D5DB);
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
  void _onSkipButtonPressed() {


    _indicatorColors[_currentPage] = Color(0xFF9CA3AF);
    if (_currentPage < 4) {
      _currentPage++;
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

      // Set the next dot to green only if it has not been interacted with
      // if (_indicatorColors[_currentPage] == Colors.grey) {
      //   _indicatorColors[_currentPage] = Colors.grey;
      // }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _navigateToPreviousPage();
                    },
                    child: Image.asset("assets/registration/icon_right_arrow.png", scale: 2.2,),
                  ),
                  CustomPageIndicator(
                    currentIndex: _currentPage,
                    itemCount: 5,
                    indicatorColors: _indicatorColors, // Use specific indicator colors
                  ),
                  GestureDetector(
                    onTap: _onSkipButtonPressed,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 16,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400,
                        height: 1.09,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(), // Disable swipe gesture
                children: [
                  BasicInfo(
                    onNextPressed: () {
                      _navigateToNextPage();
                    },
                  ),
                  ActivitySelectionPage(
                    onNextPressed: () {
                      _navigateToNextPage();
                    },
                  ),

                  AdvanceLevelSelectionPage(),
                  FitnessGoal(),
                  TestScroll(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}