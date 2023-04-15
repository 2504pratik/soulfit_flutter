import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soulfit/onboarding_screens/intro_page1.dart';
import 'package:soulfit/onboarding_screens/intro_page2.dart';
import 'package:soulfit/onboarding_screens/intro_page3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              intro_page1(),
              intro_page2(),
              intro_page3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(controller: _controller, count: 3))
        ],
      ),
    );
  }
}
