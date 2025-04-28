import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffEA4335).withOpacity(0.11),
        ),
        child: Row(
          children: [
            SvgPicture.asset(IconManager.logout,
                color: const Color(0xffEA4335)),
            const Gap(15),
            Text("تسجيل الخروج",
                style: TextStyleManager.style14RegSec
                    .copyWith(color: const Color(0xffEA4335))),
          ],
        ),
      ),
    );
  }
}
