import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/helper/empty_widget.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/GetReviews/get_service_reviews_cubit.dart';
import '../../manager/GetReviews/get_service_reviews_states.dart';
import 'review_card.dart';

class ReviewsListView extends StatefulWidget {
  const ReviewsListView({super.key, required this.serviceId});
  final String serviceId;

  @override
  State<ReviewsListView> createState() => _ReviewsListViewState();
}

class _ReviewsListViewState extends State<ReviewsListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetServiceReviewsCubit>(context)
        .getServiceReviews(widget.serviceId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetServiceReviewsCubit, GetServiceReviewsStates>(
      builder: (context, state) {
        if (state is GetServiceReviewsLoading) {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        } else if (state is GetServiceReviewsSuccess) {
          final reviews = state.reviews;

          return SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${reviews.length} تقييمات',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Gap(5),
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
                ),
              ),
              const Gap(15),
              ...reviews.map((review) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ReviewCard(review: review),
                  )),
            ]),
          );
        } else if (state is GetServiceReviewsFailure) {
          return SliverToBoxAdapter(child: Text(state.error));
        } else if (state is GetServiceReviewsEmpty) {
          return const SliverToBoxAdapter(child: EmptyWidget(text: 'Reviews',));
        } else {
          return const SliverToBoxAdapter(child: Text('unknown'));
        }
      },
    );
  }
}
