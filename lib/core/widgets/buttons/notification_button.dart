
import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/image_manager.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Image.asset(ImageManager.notificationIcon));
  }
}
