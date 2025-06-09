import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chat_model/chat_message.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_info_model/chat_info_model.dart';

class SenderMessageWidget extends StatelessWidget {
  const SenderMessageWidget({
    super.key,
    required this.message,
    required this.chatInfoModel,
  });
  final ChatMessage message;
  final ChatInfoModel chatInfoModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CustomImage(
              image: message.senderImg ?? chatInfoModel.firstUserImg!,
              height: context.responsiveHeight(35),
              width: context.responsiveWidth(35),
            ),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.senderName ?? chatInfoModel.firstUserName!,
                style: TextStyleManager.style12BoldSec,
              ),
              message.content != null
                  ? Container(
                      constraints: BoxConstraints(
                          maxWidth: context.responsiveWidth(300)),
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
                      child: message.content != null
                          ? Text(
                              message.content ?? "",
                              style: TextStyleManager.style12BoldWhite,
                            )
                          : const SizedBox.shrink(),
                    )
                  : const SizedBox.shrink(),
              message.img != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: CustomImage(
                          image: message.img!,
                          height: context.responsiveHeight(100),
                          width: context.responsiveHeight(100),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ],
      ),
    );
  }
}
