import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/keys.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chat_model/chat_message.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_cubit.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_state.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/reciever_message_eidget.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/send_chat_bottom_bar.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/sender_message_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/get_chats_info_model/chat_info_model.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({
    super.key, required this.chatInfoModel,
  });
  final ChatInfoModel chatInfoModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        bool isLoading = state.getChatState == CubitState.loading;
        List<ChatMessage> messages = state.messages?.reversed.toList() ??
            List.generate(
              10,
              (index) => ChatMessage.fakeLoading(
                  senderId: index % 2 == 0 ? Keys.userId : null),
            );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Skeletonizer(
            enabled: isLoading,
            ignorePointers: isLoading,
            child: ListView.builder(
              reverse: true,
              itemCount: isLoading ? 10 : messages.length,
              itemBuilder: (context, index) {
                ChatMessage message = messages[index];
                bool isMe = message.senderId == Keys.userId;
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: isMe
                      ? SenderMessageWidget(
                          message: message, chatInfoModel: chatInfoModel,
                        )
                      : RecieverMessageWidget(
                          message: message, chatInfoModel: chatInfoModel,
                        ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
