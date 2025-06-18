import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/color_manager.dart';

class ReadOnlyRating extends StatelessWidget {
  final double rating; // مثلاً 3.7

  const ReadOnlyRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star_rounded, color: Colors.amberAccent);
        } else if (index < rating && rating - index < 1) {
          return const Icon(Icons.star_half_rounded, color: Colors.amberAccent);
        } else {
          return const Icon(Icons.star_border_rounded,
              color: ColorManager.secondary);
        }
      }),
    );
  }
}
