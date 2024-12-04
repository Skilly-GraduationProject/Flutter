import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/reset_pass_view_body.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
body: ResetPassViewBody(),    );
  }
}