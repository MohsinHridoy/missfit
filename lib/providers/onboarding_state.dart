import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miss_fit/screens/login/login.dart';

class OnboardingState extends StateNotifier<int> {
  final PageController pageController = PageController();

  OnboardingState() : super(0);

  void setCurrentPage(int page) {
    state = page;
  }

  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void skipOnboarding(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}

final onboardingProvider = StateNotifierProvider<OnboardingState, int>((ref) {
  return OnboardingState();
});