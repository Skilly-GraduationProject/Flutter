import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }
}
