import 'package:flutter/material.dart';
import 'widgets/verfication_code_view_body copy.dart';

class VerficationCodeView extends StatelessWidget {
  const VerficationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:VerficationCodeViewBody(),
    );
  }
}