import 'package:flutter/material.dart';
import 'package:grad_project/core/extensions/context_extension.dart';

import '../../../../../../core/managers/image_manager.dart';

class VerifiedName extends StatelessWidget {
  const VerifiedName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Image.asset(
          ImageManager.verifyIcon,
          height: context.responsiveHeight(24),
        ),
      ],
    );
  }
}
