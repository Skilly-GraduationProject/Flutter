import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/secure_storage_helper.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: Center(
              child: Text(
                "Smart & Instant Service",
                style: TextStyleManager.style20BoldSec,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Text(
              "Quickly connect with the nearest service providers based on location, ratings, and price – all in one click.",
              style: TextStyleManager.style16RegSec,
              textAlign: TextAlign.center,
            ),
            image: Center(
              child: CustomImage(
                image: ImageManager.onBoarding1,
                height: context.responsiveHeight(254),
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Center(
              child: Text(
                "Seamless & Secure Experience",
                style: TextStyleManager.style20BoldSec,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Text(
              "Instant chat for easy negotiation on service details and pricing, with secure payments via cards and digital wallets.",
              style: TextStyleManager.style16RegSec,
              textAlign: TextAlign.center,
            ),
            image: Center(
              child: CustomImage(
                image: ImageManager.onBoarding2,
                height: context.responsiveHeight(254),
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Center(
              child: Text(
                "Transparency & Trust",
                style: TextStyleManager.style20BoldSec,
                textAlign: TextAlign.center,
              ),
            ),
            bodyWidget: Text(
              "Real customer reviews, detailed profiles, and work portfolios to ensure quality and credibility.",
              style: TextStyleManager.style16RegSec,
              textAlign: TextAlign.center,
            ),
            image: Center(
              child: CustomImage(
                image: ImageManager.onBoarding1,
                height: context.responsiveHeight(254),
              ),
            ),
          ),
        ],
        skip: Text(
          "Skip",
          style: TextStyleManager.style12BoldSec,
        ),
        onSkip: () {
          GoRouter.of(context).pushReplacement("/signin");
          getIt<SecureStorageHelper>().write(key: "first_open", value: "true");
        },
        showSkipButton: true,
        showNextButton: false,
        done: PrimaryButton(
          text: "Done",
          onTap: () {
             GoRouter.of(context).pushReplacement("/signin");
          getIt<SecureStorageHelper>().write(key: "first_open", value: "true");
          },
        ),
        next: Text(
          "Skip",
          style: TextStyleManager.style12BoldSec,
        ),
        onDone: () {
          GoRouter.of(context).pushReplacement("/signin");
          getIt<SecureStorageHelper>().write(key: "first_open", value: "true");
        },
        dotsDecorator: const DotsDecorator(
          activeColor: ColorManager.primary,
          color: ColorManager.secondary,
        ),
        bodyPadding:
            EdgeInsets.symmetric(vertical: context.height / 7, horizontal: 20),
        allowImplicitScrolling: true,

      ),
    );
  }
}
