import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/forgot_pass_view_body.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const ForgotPassViewBody(),
    );
  }
}
