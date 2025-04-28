import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class SenderMessageWidget extends StatelessWidget {
  const SenderMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(ImageManager.avatar),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "محمد خالد",
                style: TextStyleManager.style12BoldSec,
              ),
              Container(
                constraints:
                    BoxConstraints(maxWidth: context.responsiveWidth(300)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  'رساله رساله رساله رساله رساله رساله رساله رساله رساله رساله ',
                  style: TextStyleManager.style12BoldWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
