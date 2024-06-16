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
      image: 'assets/onboarding/img_onbaording_6.png',
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
                  navigateToPage(context, LoginPage(status: 'onboarding',));
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
    return Column(
      children: [
        Container(
          // color: Colors.red,
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height *
                0.68, // Adjusted height based on screen height
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
          padding: EdgeInsets.only(left: 1,right: 1),
          child: Container(
            width: MediaQuery.of(context).size.width,
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
      color: Color(0xFF334155).withOpacity(0.9),
      fontSize: 16,
      fontFamily: 'Archivo',
      fontWeight: FontWeight.w600,
      height: 0.09,
    ),
  );
}