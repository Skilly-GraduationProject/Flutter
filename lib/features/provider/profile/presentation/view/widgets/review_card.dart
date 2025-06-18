import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/core/widgets/read_only_rating.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/review.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
  });
  final Review review;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [ShadowManager.cardShadow]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: CustomImage(
                  image: review.userImage!,
                  height: context.responsiveHeight(46),
                  width: context.responsiveHeight(46),
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              // user name
              Text(
                review.userName!,
                style: TextStyleManager.style14BoldSec,
              ),
            ],
          ),
          const Gap(10),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(RouterPath.providerServiceView,extra: review.serviceId);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(review.serviceName ?? "",
                    style: TextStyleManager.style12BoldPrimary),
                const Icon(
                  Icons.navigate_next_sharp,
                  color: ColorManager.primary,
                )
              ],
            ),
          ),
          const Gap(10),
          Text(
            review.feedback!,
            style: TextStyleManager.style12RegSec,
          ),
          const Gap(10),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: ReadOnlyRating(
              rating: review.rating!,
            ),
          )
        ],
      ),
    );
  }
}
