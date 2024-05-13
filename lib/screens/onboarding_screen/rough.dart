import 'package:flutter/material.dart';
import 'package:miss_fit/screens/activityselectionpage/activity_selection_page.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'package:miss_fit/screens/splash_screen/splashScreen.dart';

import '../levelselectionpage/advancement_level_selection_page.dart';







class OnboardingScreen1 extends StatefulWidget {
  @override
  _OnboardingScreen1State createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Widget> _pages = [
    OnboardingPage(
      title: 'Welcome to Missfit',
      description:
      'Lorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/img_onboarding_4.png',
    ),
    OnboardingPage(
      title: 'Challenge with Friends',
      description:
      'Lorem ipsum dolor sit amet consectetur. Sed    \n magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/img_onboarding_5.png',
    ),
    OnboardingPage(
      title: 'Achieve Your Goals',
      description:
      'TLorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/img_onboarding_6.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFF6F6F6),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          _buildBottomControls(),
          _buildPageIndicators(),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.1,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPage != 2)
            _buildSkipButton(),
          if (_currentPage != 0 && _currentPage != 1)
            _buildGetStartedButton(),
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return GestureDetector(
      onTap: () {
        print("clicked");
        navigateToPage(context, LoginPage());
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: skipText("Skip"),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return GestureDetector(
      onTap: () {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        decoration: BoxDecoration(
          color: Color(0xFFFF4343),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(
          "assets/onboarding/icon_left_arrow.png",
          width: 30,
          height: 30,
        ),
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.1,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _pages.length,
              (index) => buildIndicator(index),
        ),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: _currentPage == index ? 27.0 : 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: _currentPage == index ? Color(0xFFFFA142) : Color(0xFFD1D5DB),
        borderRadius: BorderRadius.circular(20.0),
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

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.68,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 55.0),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF334155).withOpacity(0.9),
            fontSize: 24,
            fontFamily: 'Kanit-SemiBold',
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        SizedBox(height: 11.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF334155).withOpacity(0.9),
              fontSize: 16,
              fontFamily: 'Archivo-Regular',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

Widget skipText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Color(0xFF334155).withOpacity(0.9),
      fontSize: 16,
      fontFamily: 'Archivo',
      fontWeight: FontWeight.w600,
      height: 0.09,
    ),
  );
}