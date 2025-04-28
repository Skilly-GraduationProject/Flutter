import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
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
          color: Colors.white,
          border: Border.all(color: const Color(0xffEA4335)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              IconManager.deleteAccount,
              color: const Color(0xffEA4335),
            ),
            const Gap(15),
            Text("حذف الحساب",
                style: TextStyleManager.style14RegSec
                    .copyWith(color: const Color(0xffEA4335))),
          ],
        ),
      ),
    );
  }
}
