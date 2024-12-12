import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/verfication_email_view_body.dart';

class VerficationEmailView extends StatelessWidget {
  const VerficationEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:VerficationEmailViewBody(),
    );
  }
}