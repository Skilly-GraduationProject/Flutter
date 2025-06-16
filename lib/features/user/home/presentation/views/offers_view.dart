import 'package:flutter/material.dart';

import 'widgets/offers_view_body.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OffersViewBody(
      orderId: orderId,
    ));
  }
}
