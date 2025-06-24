import 'package:flutter/material.dart';

import '../../../domain/entities/all_services_entity.dart';
import 'buy_or_offer_row.dart';
import 'use_discount_button.dart';
import 'view_service_details_form.dart';

class ViewServiceViewBody extends StatelessWidget {
  const ViewServiceViewBody({
    super.key,
    required this.service,
    required this.showBuyOrOffer,
    required this.showDiscountButton,
  });

  final AllServicesEntity service;
  final bool showBuyOrOffer;
  final bool showDiscountButton;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        ViewServiceDetailsForm(service: service),
        if (showBuyOrOffer) BuyOrOfferRow(service: service),
        if (showDiscountButton) UseDiscountButton(service: service),
      ],
    ));
  }
}
