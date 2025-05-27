import 'package:flutter/material.dart';

class NullWidgetReplacement extends StatelessWidget {
  const NullWidgetReplacement(
      {super.key, required this.value, required this.child});
  final bool? value;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return value == true ? child : const SizedBox.shrink();
  }
}
