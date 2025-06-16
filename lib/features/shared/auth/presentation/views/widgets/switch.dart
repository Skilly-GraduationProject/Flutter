import 'package:flutter/material.dart';

import '../../../../../../core/managers/color_manager.dart';

class RememberSwitch extends StatelessWidget {
  const RememberSwitch(
      {super.key,
      required this.title,
      required this.remember,
      required this.onChanged});
  final String title;
  final bool remember;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        Switch(
          activeColor: Colors.white,
          activeTrackColor: ColorManager.primary,
          value: remember,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
