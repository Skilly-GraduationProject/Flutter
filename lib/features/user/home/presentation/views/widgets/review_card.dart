import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/service_reviews_entity.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});
  final ServiceReviewsEntity review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.network(review.img,
                          width: context.responsiveWidth(50),
                          height: context.responsiveWidth(50),
                          fit: BoxFit.cover),
                    ),
                    const Gap(10),
                    Text(
                      review.name,
                      style: TextStyleManager.style14BoldSec,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(10),
            Text(review.feedback),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RatingBarIndicator(
                  rating: 4,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
