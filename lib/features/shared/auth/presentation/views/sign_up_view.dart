import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.userType});
  final int userType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SignUpViewBody(userType: userType,)),
    );
  }
}
