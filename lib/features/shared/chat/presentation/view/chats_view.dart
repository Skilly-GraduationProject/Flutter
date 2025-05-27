import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/shared/chat/data/repo/chats_repo.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_cubit.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/chats_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsCubit(chatsRepo: getIt<ChatsRepo>())..getChats(),
      child: Scaffold(
        appBar: AppBar(
          primary: true,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'المحادثات',
            style: TextStyleManager.style18BoldSec,
          ),
          centerTitle: true,
          // leading: const BackIcon(),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ChatsViewBody(),
        ),
      ),
    );
  }
}
