import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/buttons/secondary_button.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/service/presentation/widgets/add_service_view_body.dart';
import 'package:grad_project/features/provider/service/presentation/widgets/image_slider.dart';

class SendOfferDialog extends StatelessWidget {
  const SendOfferDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: context.width,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: ColorManager.primary,
                ),
                child: Center(
                  child: Text(
                    "العرض",
                    style: TextStyleManager.style16BoldWhite,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Gap(20),
                    const Row(
                      children: [
                        Flexible(
                          child: FieldWithTitle(
                            title: "السعر",
                            keyboardType: TextInputType.number,
                            suffix: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "ج.م",
                                  style: TextStyle(
                                      color: ColorManager.primary,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap(20),
                        Flexible(
                          child: FieldWithTitle(
                            title: "مده التسليم",
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
                      maxLines: 3,
                    ),
                    const Gap(20),
                    PrimaryButton(
                      text: "ارسال",
                      onTap: () {},
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
