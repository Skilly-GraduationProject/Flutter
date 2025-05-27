import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/custom_error_widget.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_model/chat_info_model.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_cubit.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_state.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/user_chat_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChatsViewBody extends StatefulWidget {
  const ChatsViewBody({super.key});

  @override
  State<ChatsViewBody> createState() => _ChatsViewBodyState();
}

class _ChatsViewBodyState extends State<ChatsViewBody> {
  List<ChatInfoModel> searchChats = [];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManager.primary,
      onRefresh: () async {
        context.read<ChatsCubit>().getChats();
      },
      child: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          if (state.getChatsState == CubitState.failure) {
            return const Center(
              child: CustomErrorWidget(),
            );
          } else {
            bool isSuccess = state.getChatsState == CubitState.success;
            List<ChatInfoModel>? chats = state.chatsModel?.chats ?? [];
            List<ChatInfoModel> returnedChats =
                searchChats.isNotEmpty ? searchChats : chats;

            return Skeletonizer(
              enabled: state.getChatsState == CubitState.loading,
              ignorePointers: state.getChatsState == CubitState.loading,
              child: Column(
                children: [
                  CustomTextField(
                    title: "بحث",
                    validate: false,
                    onChanged: (value) {
                      print(value);

                      setState(() {
                        if (value.isEmpty) {
                          searchChats.clear();
                        } else {
                          searchChats = chats
                              .where((chat) {
                                final name =
                                    chat.secondUserName?.toLowerCase() ?? '';
                                final searchQuery = value.toLowerCase();
                                return name.contains(searchQuery);
                              })
                              .toSet()
                              .toList();
                        }
                      });
                    },
                  ).animate().scaleXY(),
                  const Gap(15),
                  Expanded(
                      child: ListView.separated(
                    itemCount: isSuccess ? returnedChats.length : 10,
                    separatorBuilder: (context, index) => const Gap(15),
                    itemBuilder: (context, index) => UserChatCard(
                      chat: isSuccess ? returnedChats[index] : null,
                    ).animate().slideX(delay: (index * 100).ms),
                  ))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
