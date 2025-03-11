import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class UserHomeAppBar extends StatelessWidget {
  const UserHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push('/userProfile');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(ImageManager.avatar),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10),
              child: Text(
                "اسم المستخدم",
                style: TextStyleManager.style18BoldSec,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 5),
              child: Image.asset(
                ImageManager.verifyIcon,
                height: context.responsiveHeight(24),
              ),
            ),
          ],
        ),
        Image.asset(ImageManager.notificationIcon),
      ],
    );
  }
}
