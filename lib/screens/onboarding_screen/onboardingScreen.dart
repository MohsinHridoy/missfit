import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'package:miss_fit/screens/splash_screen/splashScreen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Widget> _pages = [
    OnboardingPage(
      title: 'Welcome to Missfit',
      description:
      'Lorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/delete3.jpg',
    ),
    OnboardingPage(
      title: 'Challenge with Friends',
      description:
      'Lorem ipsum dolor sit amet consectetur. Sed    \n magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/delete2.jpg',
    ),
    OnboardingPage(
      title: 'Achieve Your Goals',
      description:
      'TLorem ipsum dolor sit amet consectetur. Sed   \n magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/delete1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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

          if (_currentPage != 2)
            Positioned(
              bottom: 35,
              left: 27,
              right: 27,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("cliekd");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                          height: 30,
                          width: 50,
                          color: Colors.transparent,
                          child: Center(child: skip_text("Skip"))),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Container(
                        width: 52,
                        height: 52,
                        // padding: const EdgeInsets.symmetric(
                        //     horizontal: 32, vertical: 14),
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4343),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Center(
                            child: Image.asset(
                              "assets/onboarding/icon_left_arrow.png",
                              width: 30,
                              height: 30,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if (_currentPage != 0 && _currentPage != 1)
            Positioned(
              bottom: 35,
              left: 27,
              right: 27,
              child: GestureDetector(
                onTap: () {
                  navigateToPage(context, LoginPage());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 112, vertical: 17),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF4343),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          Positioned(
            top: MediaQuery.of(context).size.height *
                0.71, // Adjusted top position based on screen height
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center the row horizontally
              children: List.generate(
                _pages.length,
                    (index) => buildIndicator(index),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget buildIndicator(int index) {
    return Container(
      width: _currentPage == index ? 27.0 : 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        // shape:  _currentPage == index ?BoxShape.rectangle:BoxShape.circle,
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
    return Stack(
      children: [
        Container(
          // color: Colors.red,
          height:MediaQuery.of(context).size.height ,
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height *
                0.68, // Adjusted height based on screen height
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 55.0),
        Positioned(
          bottom: 0,
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.blue.withOpacity(0.8), // Adjust the color and opacity as needed
                ],
              ),
            ),            child: Stack(
              children: [
                // Container(
                //   height: 300,
                //
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                //     child: Container(),
                //   ),
                // ),
                Column(
                  children: [
                    SizedBox(height: 100.0),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Kanit-SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 11.0),
                    Padding(
                      padding: EdgeInsets.only(left: 1,right: 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:  Colors.white.withOpacity(0.9),
                            fontSize: 16,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

Widget skip_text(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color:  Colors.white.withOpacity(0.95),
      fontSize: 16,
      fontFamily: 'Archivo-SemiBold',
      fontWeight: FontWeight.w600,
      height: 0.09,
    ),
  );
}