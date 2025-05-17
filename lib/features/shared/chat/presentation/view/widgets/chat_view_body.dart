import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/chats_list_view.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/reciever_message_eidget.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/send_chat_bottom_bar.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/sender_message_widget.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: ChatsListView(),
        ),
        SendChatBottomBar()
      ],
    );
  }
}
