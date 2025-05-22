import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'reviews_list_view.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key, required this.serviceId});
  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: CustomAppBar(
          title: 'التقييمات',
        ),
      ),
      ReviewsListView(
        serviceId: serviceId,
      ),
    ]);
  }
}
