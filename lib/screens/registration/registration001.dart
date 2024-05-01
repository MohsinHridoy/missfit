
import 'package:flutter/material.dart';
import 'package:miss_fit/widgets/custom_page_indiacator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../activityselectionpage/activity_selection_page.dart';
import '../basicinformation/basic_info.dart';
import '../fitnessgoalpage/fitness_goal_page.dart';
import '../levelselectionpage/advancement_level_selection_page.dart';
import '../measurementscreen/test.dart';

class RegistrationModel extends ChangeNotifier {
  late PageController pageController;
  int currentPage = 0;
  List<Color> indicatorColors = List.filled(5, Colors.grey);

  RegistrationModel() {
    pageController = PageController();
    pageController.addListener(_pageListener);
  }

  void _pageListener() {
    currentPage = pageController.page!.round();
    notifyListeners();
  }

  void navigateToNextPage() {
    if (currentPage < 4) {
      indicatorColors[currentPage] = Colors.green;
      currentPage++;
      pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      if (currentPage < 5 && indicatorColors[currentPage] == Colors.grey) {
        indicatorColors[currentPage] = Colors.grey;
      }
      notifyListeners();
    }
  }

  void navigateToPreviousPage() {
    if (currentPage > 0) {
      if (indicatorColors[currentPage] != Colors.grey) {
        indicatorColors[currentPage] = Colors.grey;
      }
      currentPage--;
      if (indicatorColors[currentPage] == Colors.green || indicatorColors[currentPage] == Colors.red) {
        indicatorColors[currentPage] = indicatorColors[currentPage];
      } else {
        indicatorColors[currentPage] = Colors.grey;
      }
      pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      notifyListeners();
    }
  }

  void onSkipButtonPressed() {
    indicatorColors[currentPage] = Colors.red;
    if (currentPage < 4) {
      currentPage++;
      pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      if (indicatorColors[currentPage] == Colors.grey) {
        indicatorColors[currentPage] = Colors.green;
      }
      notifyListeners();
    }
  }
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RegistrationModel>(context);

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
                    onTap: model.navigateToPreviousPage,
                    child: Image.asset("assets/registration/icon_right_arrow.png", scale: 2.2,),
                  ),
                  CustomPageIndicator(
                    currentIndex: model.currentPage,
                    itemCount: 5,
                    indicatorColors: model.indicatorColors,
                  ),
                  GestureDetector(
                    onTap: model.onSkipButtonPressed,
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
                controller: model.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BasicInfo(
                    onNextPressed: model.navigateToNextPage,
                  ),
                  // ActivitySelectionPage(
                  //   onNextPressed: model.navigateToNextPage,
                  // ),
                  AdvanceLevelSelectionPage(),
                  // FitnessGoal(),
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