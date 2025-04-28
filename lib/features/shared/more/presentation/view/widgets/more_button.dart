import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.title,
    this.icon,
    required this.onTap,
  });
  final String title;
  final String? icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.whiteShade,
        ),
        child: Row(
          children: [
            icon != null
                ? SvgPicture.asset(
                    icon!,
                    color: Colors.black,
                  )
                : const SizedBox.shrink(),
            const Gap(15),
            Text(title, style: TextStyleManager.style14RegSec),
          ],
        ),
      ),
    );
  }
}
