import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../managers/text_style_manager.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          child: Image.asset(
            'assets/images/empty-shopping-cart.png',
            fit: BoxFit.contain,
          ),
        ),
        const Gap(20),
        Text(
          ' ! No $text Found ',
          style: TextStyleManager.style16BoldBlack,
        ),
      ],
    );
  }
}
