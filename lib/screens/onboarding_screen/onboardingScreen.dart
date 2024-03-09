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
            bottom: 40.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage != 0
                    ? ElevatedButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Text('Previous'),
                      )
                    : Container(),
                GestureDetector(
                  onTap: () {
                    if (_currentPage == _pages.length - 1) {
                      // Navigate to your home screen or next screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Container(
                    width: 52,
                    height: 52,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF4343),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _pages.length - 1) {
                      // Navigate to your home screen or next screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                      _currentPage == _pages.length - 1 ? 'Finish' : 'Next'),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            left: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                width: 320,
                height: 52,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
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
                      'Next',
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
            top: 630,
            left: 180,
            child: Row(
              mainAxisSize: MainAxisSize.min,
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
      height: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        // shape:  _currentPage == index ?BoxShape.rectangle:BoxShape.circle,
        color: _currentPage == index ? Color(0xFFFFA142) : Color(0xFF333333),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
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
            height: 600,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 80.0),
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
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: 320,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF1F5F9),
                fontSize: 16,
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w400,
                height: 1.09,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
