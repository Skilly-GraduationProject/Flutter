import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class PersonalDetailRow extends StatelessWidget {
  const PersonalDetailRow({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorManager.whiteShade),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyleManager.style14BoldPrimary,
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyleManager.style14BoldSec,
          ),
        ],
      ),
    );
  }
}
