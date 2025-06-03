import 'package:flutter/material.dart';

import '../../../../../../core/managers/color_manager.dart';
import '../../../domain/entities/all_services_entity.dart';
import 'buy_service_sheet.dart';
import 'price_offer_sheet.dart';

class BuyOrOfferRow extends StatelessWidget {
  const BuyOrOfferRow({super.key, required this.service});

  final AllServicesEntity service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.secondary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (_) => BuyServiceSheet(
                    service: service,
                  ),
                );
              },
              child: const Text('شراء', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (_) => PriceOfferSheet(service: service),
                );
              },
              child:
                  const Text('عرض سعر', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
