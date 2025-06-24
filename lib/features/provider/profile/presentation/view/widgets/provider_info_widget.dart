import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/inherted_profile_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class ProviderInfoWidget extends StatelessWidget {
  const ProviderInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProviderProfileModel providerProfileModel =
        InhertedProviderProfile.of(context)!.providerProfileModel;
    return Center(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(800),
            child: CustomImage(
              image: providerProfileModel.provider?.img ?? ImageManager.avatar,
              fit: BoxFit.cover,
              height: context.responsiveHeight(170),
              width: context.responsiveHeight(170),
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${providerProfileModel.provider?.firstName} ${providerProfileModel.provider?.lastName}",
                style: TextStyleManager.style20BoldSec,
              ),
              const Gap(10),
              Image.asset(
                ImageManager.verifyIcon,
                height: context.responsiveHeight(24),
              ),
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconManager.rate,
                height: context.responsiveHeight(20),
              ),
              const Gap(3),
              Text(providerProfileModel.provider?.review.toString() ?? "5.0",
                  style: TextStyleManager.style14RegSec)
            ],
          ),
        ],
      ),
    );
  }
}
