import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [PageViewModel(
        title: "Title of introduction page",
        body: "Welcome to the app! This is a description of how it works.",
        image: const Center(
          child: Icon(Icons.waving_hand, size: 50.0),
        ),
      )],
      showNextButton: false,
      done: const Text("Done"),
      onDone: () {
        // On button pressed
      },
    );
  }
}
