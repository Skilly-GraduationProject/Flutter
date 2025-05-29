import 'package:flutter/material.dart';

class GoogleSign extends StatelessWidget {
  const GoogleSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Image.asset(
              'assets/images/google.png',
              height: 30,
              width: 30,
            ),
          ),
        ),
      ],
    );
  }
}
