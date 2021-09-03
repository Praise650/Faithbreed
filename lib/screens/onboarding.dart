import 'package:faith_breed/onboarding_screens/screen1.dart';
import 'package:faith_breed/onboarding_screens/screen2.dart';
import 'package:faith_breed/onboarding_screens/screen3.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int seletedIndex = 0;
  List<Widget> screensList = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (i) => setState(() => seletedIndex = i),
                itemCount: screensList.length,
                itemBuilder: (BuildContext context, int index) {
                  return screensList[seletedIndex];
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  screensList.length,
                  (index) => redDot(
                    index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget redDot(int i) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.bounceOut,
        height: 5,
        width: seletedIndex == i ? 18.0 : 8.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              7.0,
            ),
          ),
          color: seletedIndex == i
              ? Colors.red[600]
              : Colors.grey.withOpacity(0.8),
        ),
      ),
    );
  }
}
