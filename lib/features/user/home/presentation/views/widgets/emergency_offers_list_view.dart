import 'package:flutter/material.dart';
import 'emergency_offer_card.dart';

class EmergencyOffersListView extends StatelessWidget {
  final List<Map<String, dynamic>> offers;
  final void Function(int) onReject;
  final void Function(Map<String, dynamic>) onAccept;

  const EmergencyOffersListView({
    super.key,
    required this.offers,
    required this.onReject,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return EmergencyOfferCard(
            offer: offer,
            onReject: () => onReject(index),
            onAccept: () => onAccept(offer),
          );
        },
      ),
    );
  }
}
