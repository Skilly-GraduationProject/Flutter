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

class RecieverMessageWidget extends StatelessWidget {
  const RecieverMessageWidget({
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.senderName ?? chatInfoModel.secondUserName!,
                style: TextStyleManager.style12BoldSec,
              ),
              message.content != null
                  ? Container(
                      constraints: BoxConstraints(
                          maxWidth: context.responsiveWidth(300)),
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
                        message.content ?? "",
                        style: TextStyleManager.style12BoldSec,
                      ),
                    )
                  : SizedBox.shrink(),
              message.img != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CustomImage(
                        image: message.img!,
                        height: context.responsiveHeight(100),
                        width: context.responsiveHeight(100),
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          const Gap(10),
          ClipOval(
            child: CustomImage(
              image: message.receiverImg ?? chatInfoModel.secondUserImg!,
              height: context.responsiveHeight(35),
              width: context.responsiveWidth(35),
            ),
          ),
        ],
      ),
    );
  }
}
