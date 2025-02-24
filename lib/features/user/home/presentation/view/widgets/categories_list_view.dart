import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/home_banners.dart';
import 'package:grad_project/core/widgets/buttons/small_primary_button.dart';
class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsiveHeight(70),
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) {
          return Container(
            width: context.responsiveWidth(120),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: ColorManager.whiteShade,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      ImageManager.avatar,
                      width: context.responsiveWidth(55),
                      height: context.responsiveWidth(55),
                    )),
                const Gap(10),
                Text(
                  "البرمجه",
                  style: TextStyleManager.style12BoldSec,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}