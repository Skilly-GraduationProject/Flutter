import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/core/widgets/buttons/small_primary_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
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
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(ImageManager.avatar),
            ),
            const Gap(10),
            Text(
              "اسم المستخدم",
              style: TextStyleManager.style20BoldSec,
            ),
            const Gap(10),
            Image.asset(
              ImageManager.verifyIcon,
              height: context.responsiveHeight(24),
            ),
          ],
        ),
        Text("نجار", style: TextStyleManager.style16RegSec,)
      ],
    );
  }
}
