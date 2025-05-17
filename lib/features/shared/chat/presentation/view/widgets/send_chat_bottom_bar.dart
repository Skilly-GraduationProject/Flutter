import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/reciever_message_eidget.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/sender_message_widget.dart';

class SendChatBottomBar extends StatelessWidget {
  const SendChatBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 8),
      child: Row(
        children: [
          // مربع الكتابة
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.whiteShade,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "اكتب رسالتك",
                ),
              ),
            ),
          ),
          const Gap(10),
          // زر الإرسال
          Container(
            decoration: BoxDecoration(
              color: ColorManager.whiteShade,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.send,
              color: ColorManager.primary,
            ),
          )
        ],
      ),
    );
  }
}
