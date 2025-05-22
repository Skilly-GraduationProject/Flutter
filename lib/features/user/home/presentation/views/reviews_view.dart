import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/reviews_view_body.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key, required this.serviceId});
  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ReviewsViewBody(serviceId: serviceId,),
    );
  }
}
