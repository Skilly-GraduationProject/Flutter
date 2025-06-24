import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/secure_storage_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }

  void navigateToSignIn() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () async {
      if (await getIt<SecureStorageHelper>().get(key: "first_open") != "true") {
        GoRouter.of(context).pushReplacement(RouterPath.onBoardingView);
      } else {
        GoRouter.of(context).pushReplacement("/signin");
      }
    });
  }
}
