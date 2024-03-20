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
          'Lorem ipsum dolor sit amet consectetur. Sed magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/img_onboarding_1.png',
    ),
    OnboardingPage(
      title: 'Challenge with Friends',
      description:
          'Lorem ipsum dolor sit amet consectetur. Sed magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/img_onboarding_2.png',
    ),
    OnboardingPage(
      title: 'Achieve Your Goals',
      description:
          'TLorem ipsum dolor sit amet consectetur. Sed magnis tortor metus morbi ante e.',
      image: 'assets/onboarding/img_onboarding_3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF18181B),
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


          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              height: 100,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_currentPage != 2)
                    GestureDetector(
                      onTap: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 52,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 14),
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4343),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w600,
                              height: 0.09,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (_currentPage != 1 && _currentPage != 2)
                    GestureDetector(
                      onTap: (){
                        print("cliekd");
                        // navigateToPage(context,LoginPage());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                            height: 25,
                            width: 50,
                            color: Colors.transparent,
                            child: skip_text("Skip"))
                      ),
                    )
                ],
              ),
            ),
          ),

          if (_currentPage != 0 && _currentPage != 1)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
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
                        child: Center(child: Image.asset("assets/onboarding/icon_left_arrow.png",width: 30,height: 30,)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if (_currentPage != 0 && _currentPage != 2)
            Positioned(
              top: 80,
              right: 30,
              child: GestureDetector(
                onTap: (){
                  navigateToPage(context,LoginPage());
                },
                child: Container(
                  height: 30,
                  width: 50,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.70, // Adjusted top position based on screen height
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
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
      width: _currentPage == index ? 30.0 : 10.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        // shape:  _currentPage == index ?BoxShape.rectangle:BoxShape.circle,
        color: _currentPage == index ? Color(0xFFFFA142) : Color(0xFF333333),
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
          // color: Colors.red,
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.68, // Adjusted height based on screen height
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 60.0),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.w600,
            height: 0.05,
          ),
        ),
        SizedBox(height: 25.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF1F5F9),
                fontSize: 16,
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



Widget skip_text(String text){
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'Archivo',
      fontWeight: FontWeight.w600,
      height: 0.09,
    ),
  );
}
























































