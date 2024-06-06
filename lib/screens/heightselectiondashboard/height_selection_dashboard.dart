import 'package:flutter/material.dart';
import 'package:miss_fit/screens/activityselectionpage/activity_selection_page.dart';
import 'package:miss_fit/screens/fitnessgoalpage/fitness_goal_page.dart';
import 'package:miss_fit/screens/heightmeasurementscreen/height_selection_page.dart';
import 'package:miss_fit/widgets/custom_page_indiacator.dart';

import '../levelselectionpage/AdvanceLevelSelectionPage001.dart';
import '../measurementscreen/test3.dart';


class HeightSelectionDashBoard extends StatefulWidget {
  @override
  _HeightSelectionDashBoardState createState() => _HeightSelectionDashBoardState();
}


class _HeightSelectionDashBoardState extends State<HeightSelectionDashBoard> {
  late PageController _pageController;
  int _currentPage = 0;
  List<Color> _indicatorColors = List.filled(6, Color(0xFFD1D5DB)); // Default indicator colors, set to grey for previous dots
  bool _isVisible = false; // Define isVisible here
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

  void _updateIndicatorColorWithDebounce(int index, Color color) {
    setState(() {
      _indicatorColors[index] = color;
    });
  }

  void _navigateToPreviousPage() {
    if (_currentPage > 0) {
      _indicatorColors[_currentPage] = Color(0xFFD1D5DB);
      _currentPage--;
      _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      Navigator.pop(context);
    }
  }
  void _navigateToNextPage() {
    if (_currentPage < 5) {
      _indicatorColors[_currentPage] = Color(0xFF22C55E);
      _currentPage++;
      _indicatorColors[_currentPage] = Color(0xFFD1D5DB);
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
  void _onSkipButtonPressed() {


    _indicatorColors[_currentPage] =  Color(0xFFEF4444);
    if (_currentPage < 5) {
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
            Container(
              color: Color(0xFFF6F6F6),
              height: 100,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0,top: 65),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _navigateToPreviousPage();
                          },
                          child: Image.asset("assets/registration/icon_right_arrow.png", scale: 1.8,),
                        ),

                        CustomPageIndicator(
                          currentIndex: _currentPage,
                          itemCount: 2,
                          indicatorColors: _indicatorColors, // Use specific indicator colors
                          status:'heightweight' ,
                        ),

                        GestureDetector(
                          // onTap: _onSkipButtonPressed,
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.transparent,
                              fontSize: 16,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 1.09,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible:_isVisible?true:false ,
                    child: Opacity(
                      opacity: 0.80,

                      child: Container(
                        color:Color(0xFF111827) ,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(), // Disable swipe gesture
                children: [

                  TestScroll(
                    onNextPressed: () {
                      _navigateToNextPage();
                    },
                    status: 'profile',
                  ),
                  HeightMeasurementsScreen(
                    onNextPressed: () {
                      _navigateToNextPage();
                    },
                    status: 'profile',

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


