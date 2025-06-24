import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/helper/picker_helper.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddServiceViewBody extends StatefulWidget {
  const AddServiceViewBody({super.key});

  @override
  State<AddServiceViewBody> createState() => _AddServiceViewBodyState();
}

class _AddServiceViewBodyState extends State<AddServiceViewBody> {
  VideoPlayerController? _videoController;
  XFile? _video;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            primary: true,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              "اضافه خدمه",
              style: TextStyleManager.style18BoldSec,
            ),
            centerTitle: true,
            leading: const BackIcon(),
          ),
          const Gap(20),
          const FieldWithTitle(
            title: 'عنوان الخدمه',
          ),
          const Gap(20),
          const FieldWithTitle(
            title: 'وصف الخدمه',
          ),
          const Gap(20),
          const Row(
            children: [
              Flexible(
                child: FieldWithTitle(
                  title: 'السعر',
                  keyboardType: TextInputType.number,
                ),
              ),
              Gap(10),
              Flexible(
                child: FieldWithTitle(
                  title: 'مده التسليم',
                  keyboardType: TextInputType.number,
                  suffix: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "يوم",
                        style: TextStyle(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          const FieldWithTitle(
            title: 'ملاحظات',
            maxLines: 5,
          ),
          const Gap(20),
          Text(
            'اضافه صوره',
            style: TextStyleManager.style14BoldSec,
          ),
          const Gap(20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.whiteShade,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              IconManager.addImage,
              height: context.responsiveHeight(20),
            ),
          ),
          const Gap(20),
          Text(
            'اضافه فيديو',
            style: TextStyleManager.style14BoldSec,
          ),
          const Gap(20),
          _video != null
              ? Container(
                  height: context.responsiveHeight(200),
                  decoration: BoxDecoration(
                    color: ColorManager.whiteShade,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        _videoController != null &&
                                _videoController!.value.isInitialized
                            ? AspectRatio(
                                aspectRatio:
                                    _videoController!.value.aspectRatio,
                                child: VideoPlayer(_videoController!),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primary,
                                ),
                              ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.close,
                                  color: Colors.white, size: 20),
                              onPressed: () {
                                setState(() {
                                  _videoController?.dispose();
                                  _videoController = null;
                                  _video = null;
                                });
                              },
                            ),
                          ),
                        ),
                        if (_videoController != null &&
                            _videoController!.value.isInitialized)
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  _videoController!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_videoController!.value.isPlaying) {
                                      _videoController!.pause();
                                    } else {
                                      _videoController!.play();
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        if (_videoController != null &&
                            _videoController!.value.isInitialized)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: VideoProgressIndicator(
                                      _videoController!,
                                      allowScrubbing: true,
                                      colors: const VideoProgressColors(
                                        playedColor: ColorManager.primary,
                                        bufferedColor: Colors.grey,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Gap(8),
                                  ValueListenableBuilder(
                                    valueListenable: _videoController!,
                                    builder: (context, VideoPlayerValue value,
                                        child) {
                                      return Text(
                                        '${_formatDuration(value.position)} / ${_formatDuration(value.duration)}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () async {
                    await PickerHelper()
                        .showVideoPickerBottomSheet(context: context)
                        .then((v) {
                      if (v != null) {
                        setState(() {
                          _video = v;
                          _initializeVideoController();
                        });
                      }
                    });
                  },
                  child: Container(
                    height: context.responsiveHeight(140),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorManager.whiteShade,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        IconManager.addImage,
                        height: context.responsiveHeight(40),
                      ),
                    ),
                  ),
                ),
          const Gap(30),
          const PrimaryButton(text: "اضافه الخدمه"),
        ],
      ),
    );
  }

  void _initializeVideoController() {
    if (_video != null) {
      _videoController = VideoPlayerController.file(File(_video!.path));
      _videoController!.initialize().then((_) {
        setState(() {});
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}

class FieldWithTitle extends StatelessWidget {
  const FieldWithTitle({
    super.key,
    required this.title,
    this.hint,
    this.maxLines,
    this.controller,
    this.suffix,
    this.keyboardType,
  });
  final String title;
  final String? hint;
  final int? maxLines;
  final TextEditingController? controller;
  final Widget? suffix;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyleManager.style14BoldSec,
        ),
        const Gap(10),
        TextField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              fillColor: ColorManager.whiteShade,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              hintText: hint,
              suffixIcon: suffix,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.7),
              )),
          controller: controller,
        ),
      ],
    );
  }
}
