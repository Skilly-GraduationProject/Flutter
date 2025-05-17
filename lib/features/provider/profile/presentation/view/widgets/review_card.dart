import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_secure_storage/test/test_flutter_secure_storage_platform.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/review.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_info_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_personal_data.dart';

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
          const Gap(18),
          Text(
            review.feedback!,
            style: TextStyleManager.style12RegSec,
          ),
          const Gap(18),
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

class ReadOnlyRating extends StatelessWidget {
  final double rating; // مثلاً 3.7

  const ReadOnlyRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star_rounded, color: Colors.amberAccent);
        } else if (index < rating && rating - index < 1) {
          return const Icon(Icons.star_half_rounded, color: Colors.amberAccent);
        } else {
          return const Icon(Icons.star_border_rounded,
              color: ColorManager.secondary);
        }
      }),
    );
  }
}
