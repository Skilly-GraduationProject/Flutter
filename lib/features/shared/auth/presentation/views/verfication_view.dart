import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/verfication_view_body.dart';

class VerficationView extends StatelessWidget {
  const VerficationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:const VerficationViewBody(),
    );
  }
}