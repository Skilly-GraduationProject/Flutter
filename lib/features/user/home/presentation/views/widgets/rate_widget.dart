import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, required this.rate});
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        const SizedBox(width: 3),
        Text(
          rate,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
