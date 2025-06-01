import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_info_model/chat_info_model.dart';
import 'package:grad_project/features/shared/chat/data/repo/chats_repo.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_cubit.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/chat_view_body.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.chat});
  final ChatInfoModel chat;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsCubit(chatsRepo: getIt<ChatsRepo>())..getChat(chatId: widget.chat.id!)..setupSocketListener(),
      child: Scaffold(
        appBar: AppBar(
          primary: true,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            widget.chat.secondUserName ?? "",
            style: TextStyleManager.style18BoldSec,
          ),
          centerTitle: true,
          leading: const BackIcon(),
        ),
        body:  ChatViewBody(chat: widget.chat,),
      ),
    );
  }
}
