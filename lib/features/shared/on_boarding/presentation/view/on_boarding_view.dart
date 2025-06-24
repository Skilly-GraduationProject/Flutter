import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Smart & Instant Service",
          body:
              "Quickly connect with the nearest service providers based on location, ratings, and price – all in one click.",
          image: const Center(
            child: Icon(Icons.waving_hand, size: 50.0),
          ),
        ),
        PageViewModel(
          title: "Smart & Instant Service",
          body:
              "Quickly connect with the nearest service providers based on location, ratings, and price – all in one click.",
          image: const Center(
            child: Icon(Icons.waving_hand, size: 50.0),
          ),
        )
      ],
      skip: const Text("Skip"),
      onSkip: () {},
      showSkipButton: true,
      showNextButton: false,
      done: const Text("Done"),
      next: Text(
        "Skip",
        style: TextStyleManager.style12BoldSec,
      ),
      onDone: () {
        // On button pressed
      },
    );
  }
}
