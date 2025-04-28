import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/reciever_message_eidget.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/send_chat_bottom_bar.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/sender_message_widget.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Align(
            alignment:
                index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: index % 2 == 0
                ? const SenderMessageWidget()
                : const RecieverMessageWidget(),
          );
        },
      ),
    );
  }
}
