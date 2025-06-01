import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.message,
  });
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "حدث خطأ",
        style: TextStyleManager.style16BoldSec,
      ),
    );
  }
}
