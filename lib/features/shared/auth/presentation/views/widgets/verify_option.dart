import 'package:flutter/material.dart';

class VerifyOption extends StatelessWidget {
  const VerifyOption({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });
  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 300,
        decoration: BoxDecoration(
          color: selected ? const Color(0xff1C274C) : const Color(0xffF6F7F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xff23255B),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
