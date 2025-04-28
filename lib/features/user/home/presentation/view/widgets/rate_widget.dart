import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 16),
        SizedBox(width: 3),
        Text(
          "5.0",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
