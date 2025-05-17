import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_text_field.dart';

class UserChatCard extends StatelessWidget {
  const UserChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouterPath.chatView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.whiteShade,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            "احمد ايمن",
            style: TextStyleManager.style12BoldSec,
          ),
          subtitle: Text(
            "الرساله الرساله الرساله الرساله",
            style: TextStyleManager.style12RegSec,
          ),
          leading: const CircleAvatar(
            backgroundImage: AssetImage(ImageManager.avatar),
          ),
        ),
      ),
    );
  }
}
