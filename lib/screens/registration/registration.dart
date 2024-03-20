import 'package:flutter/material.dart';
import 'package:miss_fit/screens/activityselectionpage/activity_selection_page.dart';
import 'package:miss_fit/screens/basicinformation/basic_info.dart';
import 'package:miss_fit/screens/fitnessgoalpage/fitness_goal_page.dart';
import 'package:miss_fit/screens/levelselectionpage/advancement_level_selection_page.dart';
import 'package:miss_fit/screens/measurementscreen/test.dart';
import 'package:miss_fit/screens/onboarding_screen/rough.dart';
import 'package:miss_fit/widgets/custom_page_indiacator.dart';


class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late PageController _pageController;
  int _currentPage = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF18181B),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Image.asset("assets/registration/icon_right_arrow.png",scale: 2.2,),
                  CustomPageIndicator(
                    currentIndex: _currentPage,
                    itemCount: 5,
                  ),
                  skip_text("Skip")
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  BasicInfo(),
                  AdvanceLevelSelectionPage(),
                  FitnessGoal(),
                  TestScroll(),

                  ActivitySelectionPage(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

