import 'package:flutter/material.dart';
import 'package:gdsc/onboarding_screens/Page1.dart';
import 'package:gdsc/onboarding_screens/Page2.dart';
import 'package:gdsc/onboarding_screens/Part3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  PageController controller = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView(children: [Page1(), Page2(), Page3()]),
        bottomSheet: Container(
            height: MediaQuery.of(context).size.height * 0.43,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(48),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, top: 24.0, bottom: 8.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const WormEffect(
                          dotHeight: 15,
                          dotWidth: 15,
                          dotColor: Color(0xff1E0368),
                          activeDotColor: Color(0xff3600D0),
                          spacing: 15.0,
                        ),
                        onDotClicked: (index) {
                          controller.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ],
                  )
                ]))));
  }
}
