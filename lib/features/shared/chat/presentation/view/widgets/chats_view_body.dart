import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/user_chat_card.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(title: "بحث", onSaved: (v) {}).animate().scaleXY(),
        const Gap(15),
        Expanded(
            child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Gap(15),
          itemBuilder: (context, index) =>
              const UserChatCard().animate().slideX(delay: (index * 100).ms),
        ))
      ],
    );
  }
}
