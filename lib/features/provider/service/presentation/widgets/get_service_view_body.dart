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
import 'package:grad_project/features/provider/service/presentation/widgets/data_column.dart';
import 'package:grad_project/features/provider/service/presentation/widgets/image_slider.dart';
import 'package:grad_project/features/provider/service/presentation/widgets/send_offer_dialog.dart';
import "package:grad_project/features/provider/service/presentation/widgets/data_row.dart";

class GetServiceViewBody extends StatelessWidget {
  const GetServiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverGap(20),
      // service images slider
      const SliverToBoxAdapter(
        child: ImageSlider(),
      ),
      const SliverGap(20),
      // service data
      SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // service title
          Text(
            "عنوان الخدمه",
            style: TextStyleManager.style20BoldSec,
          ),
          const Gap(15),
          // service description
          Text(
            "عمل غرفه معيشه عمل غرفه معيشه عمل غرفه معيشهعمل غرفه معيشهعمل غرفه معيشهعمل غرفه معيشهعمل غرفه معيش هعمل غرفه معيشه  هعمل غرفه معيشه  هعمل غرفه معيشه  هعمل غرفه معيشه.",
            style: TextStyleManager.style12RegSec,
          ),
        ]),
      ),
      const SliverGap(30),
      // service data
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // service price
            const ServiceDataRow(
              title: "سعر الخدمه",
              value: "1000 ج.م",
            ),
            const Gap(20),
            // service delivery time
            const ServiceDataRow(
              title: "مده التسليم",
              value: "5 ايام",
            ),
            const Gap(20),
            // service details
            const ServiceDataColumn(
              title: 'ملاحظات',
              value: '''1- عمل غرفه معيشه
                      2 -عمل غرفه معيشه
                      3- عمل غرفه معيشه''',
            ),
            const Gap(20),
            // service video (if exists) (optional)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الفيديو",
                  style: TextStyleManager.style12BoldSec,
                ),
              ],
            ),
          ],
        ),
      ),
      const SliverGap(20),
      // service options buttons
      SliverToBoxAdapter(
        child: Row(
          children: [
            // chat button
            Expanded(child: SecondaryButton(text: "محادثه", onTap: () {})),
            const Gap(20),
            // send offer button
            Expanded(
                child: PrimaryButton(
                    text: "عرض سعر",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const SendOfferDialog();
                        },
                      );
                    })),
          ],
        ),
      )
    ]);
  }
}
