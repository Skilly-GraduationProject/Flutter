import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class RecieverMessageWidget extends StatelessWidget {
  const RecieverMessageWidget({
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "احمد ايمن",
                style: TextStyleManager.style12BoldSec,
              ),
              Container(
                constraints:
                    BoxConstraints(maxWidth: context.responsiveWidth(300)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorManager.whiteShade,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    topLeft: Radius.circular(0),
                  ),
                ),
                child: Text(
                  'رساله رساله رساله رساله رساله رساله رساله رساله رساله رساله ',
                  style: TextStyleManager.style12BoldSec,
                ),
              ),
            ],
          ),
          const Gap(10),
          const CircleAvatar(
            backgroundImage: AssetImage(ImageManager.avatar),
          ),
        ],
      ),
    );
  }
}
