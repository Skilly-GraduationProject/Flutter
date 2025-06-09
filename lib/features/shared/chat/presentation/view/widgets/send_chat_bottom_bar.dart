import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/helper/picker_helper.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chat_model/chat_message.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_cubit.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/reciever_message_eidget.dart';
import 'package:grad_project/features/shared/chat/presentation/view/widgets/sender_message_widget.dart';
import 'package:image_picker/image_picker.dart';

class SendChatBottomBar extends StatefulWidget {
  const SendChatBottomBar({
    super.key,
    required this.recieverId,
  });
  final String recieverId;
  @override
  State<SendChatBottomBar> createState() => _SendChatBottomBarState();
}

class _SendChatBottomBarState extends State<SendChatBottomBar> {
  XFile? image;
  late TextEditingController _messageController;
  @override
  void initState() {
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

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
                controller: _messageController,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "اكتب رسالتك",
                  suffix: image == null
                      ? GestureDetector(
                          onTap: () async {
                            await PickerHelper()
                                .showPickerBottomSheet(
                                    context: context,
                                    type: ImagePickerType.single)
                                .then((value) {
                              setState(() {
                                image = value;
                              });
                            });
                          },
                          child: const Icon(Icons.image))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: Stack(
                            alignment: Alignment.center,
                            fit: StackFit.loose,
                            children: [
                              Image.file(
                                File(image!.path),
                                height: context.responsiveHeight(25),
                                width: context.responsiveHeight(25),
                                fit: BoxFit.cover,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    image = null;
                                  });
                                },
                                child: Container(
                                  height: context.responsiveHeight(25),
                                  width: context.responsiveHeight(25),
                                  color: Colors.black.withValues(alpha: 0.5),
                                  child: Center(
                                      child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: context.responsiveHeight(25),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),
          const Gap(10),
          // زر الإرسال
          GestureDetector(
            onTap: () {
              if (_messageController.text.isNotEmpty || image != null) {
                context.read<ChatsCubit>().sendMessage(
                    receiverId: widget.recieverId,
                    message: _messageController.text.isEmpty
                        ? null
                        : _messageController.text,
                    image: image?.path);
                setState(() {
                  _messageController.clear();
                  image = null;
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.whiteShade,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.send,
                color: ColorManager.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
