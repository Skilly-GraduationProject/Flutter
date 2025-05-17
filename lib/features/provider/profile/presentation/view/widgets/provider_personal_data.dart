import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/inherted_profile_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/personal_detail_row.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class ProviderPersonalData extends StatelessWidget {
  const ProviderPersonalData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProviderProfileModel providerProfileModel =
        InhertedProviderProfile.of(context)!.providerProfileModel;
    return ExpandedTile(
      trailing: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.white,
        size: context.responsiveHeight(20),
      ),
      trailingRotation: 180,
      title: Text(
        "البيانات الشخصيه",
        style: TextStyleManager.style14BoldWhite,
      ),
      theme: const ExpandedTileThemeData(
          headerSplashColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          contentBackgroundColor: Colors.transparent,
          contentSeparatorColor: Colors.transparent,
          headerBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          headerColor: ColorManager.primary),
      controller: ExpandedTileController(),
      content: Column(
        children: [
          const Gap(10),
          PersonalDetailRow(
            title: "رقم الهاتف",
            value: providerProfileModel.provider?.phoneNumber ?? "",
          ),
          const Gap(10),
          PersonalDetailRow(
            title: "البريد",
            value: providerProfileModel.provider?.email ?? "",
          ),
          const Gap(10),
          PersonalDetailRow(
            title: "المهنه",
            value: providerProfileModel.provider?.profession ?? "",
          ),
          const Gap(10),
          PersonalDetailRow(
            title: "سنوات الخبره",
            value: providerProfileModel.provider?.numberOfYearExperience ?? "",
          ),
        ],
      ),
    );
  }
}
