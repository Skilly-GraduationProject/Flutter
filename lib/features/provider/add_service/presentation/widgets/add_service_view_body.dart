import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class AddServiceViewBody extends StatelessWidget {
  const AddServiceViewBody({super.key});

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
          Container(
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
          const Gap(30),
          const PrimaryButton(text: "اضافه الخدمه"),
        ],
      ),
    );
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
