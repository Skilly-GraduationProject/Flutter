import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/widgets/custom_network_image.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_info_model/chat_info_model.dart';

class UserChatCard extends StatelessWidget {
  const UserChatCard({
    super.key,
    this.chat,
  });
  final ChatInfoModel? chat;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouterPath.chatView, extra: chat);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.whiteShade,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            chat?.secondUserName ?? "",
            style: TextStyleManager.style12BoldSec,
          ),
          subtitle: Text(
            chat?.lastMessage ?? "",
            style: TextStyleManager.style12RegSec,
          ),
          leading: ClipOval(
            child: CustomImage(
              image: chat?.secondUserImg ?? ImageManager.avatar,
              height: context.responsiveHeight(50),
              width: context.responsiveHeight(50),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
