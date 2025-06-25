import 'package:flutter/material.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.width,
  });

  final String text;
  final void Function()? onTap;
  final Color? color;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? ColorManager.primary,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyleManager.style16BoldWhite,
          ),
        ),
      ),
    );
  }
}
