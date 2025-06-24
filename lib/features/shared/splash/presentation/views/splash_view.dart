import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';

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
        ), () {
      GoRouter.of(context).push("/signin");
    });
  }
}
