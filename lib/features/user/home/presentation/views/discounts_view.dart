import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/discounts_view_body.dart';


class DiscountsView extends StatelessWidget {
  const DiscountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DiscountsViewBody(),
    );
  }
}