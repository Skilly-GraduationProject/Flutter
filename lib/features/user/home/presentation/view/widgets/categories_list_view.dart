import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

// class CategoriesListView extends StatelessWidget {
//   const CategoriesListView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: context.responsiveHeight(80),
//         child:
//             // ListView.separated(
//             //   itemCount: 10,
//             //   scrollDirection: Axis.horizontal,
//             //   separatorBuilder: (context, index) => const Gap(10),
//             //   itemBuilder: (context, index) {
//             SingleChildScrollView(
//                 // Wrap in SingleChildScrollView
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                     children: List.generate(
//                         10,
//                         (index) => Padding(
//                             padding:
//                                 const EdgeInsets.only(right: 10), // Spacing
//                             child: Container(
//                               width: context.responsiveWidth(120),
//                               padding: const EdgeInsets.all(7),
//                               decoration:

//                               padding: const EdgeInsets.all(7),
//                               decoration: BoxDecoration(
//                                 color: ColorManager.whiteShade,
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               child: Row(
//                                 children: [
//                                   ClipRRect(
//                                       borderRadius: BorderRadius.circular(15),
//                                       child: Image.asset(
//                                         fit: BoxFit.fill,
//                                         ImageManager.avatar,
//                                         width: context.responsiveWidth(50),
//                                         height: context.responsiveWidth(50),
//                                       )),
//                                   const Gap(8),
//                                   Text(
//                                     "البرمجه",
//                                     style: TextStyleManager.style12BoldSec,
//                                   )
//                                 ],
//                               ),
//                             ))))));
//   }
// }

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsiveHeight(80),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const Gap(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/category');
            },
            child: Container(
              constraints: BoxConstraints(
                minWidth: context
                    .responsiveWidth(90), // Minimum width to show text properly
                maxWidth: context
                    .responsiveWidth(120), // Maximum width to prevent overflow
              ),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: ColorManager.whiteShade,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize
                    .min, // Ensures the row only takes necessary space
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      fit: BoxFit.fill,
                      ImageManager.avatar,
                      width: context.responsiveWidth(50),
                      height: context.responsiveWidth(50),
                    ),
                  ),
                  const Gap(8),
                  Flexible(
                    // Allows text to take up remaining space but never wrap
                    child: Text(
                      "البرمجه",
                      style: TextStyleManager.style12BoldSec,
                      overflow: TextOverflow.ellipsis, // Trims text if too long
                      maxLines: 1, // Ensures text does not wrap
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
