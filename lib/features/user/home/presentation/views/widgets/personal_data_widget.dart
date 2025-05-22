import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import 'info_box.dart';

class MyPersonalDataWidget extends StatelessWidget {
  const MyPersonalDataWidget({
    super.key, required this.email, required this.phone, required this.streetName, required this.city,
  });
  final String email, phone, streetName, city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('رقم الهاتف', style: TextStyleManager.style14BoldPrimary),
                Text(phone, style: TextStyleManager.style14RegSec),
              ],
            ),
          ),
          const Gap(5),
          InfoBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('البريد', style: TextStyleManager.style14BoldPrimary),
                Text(email, style: TextStyleManager.style14RegSec),
              ],
            ),
          ),
          const Gap(5),
          InfoBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('اسم الشارع', style: TextStyleManager.style14BoldPrimary),
                Text(streetName, style: TextStyleManager.style14RegSec),
              ],
            ),
          ),
          const Gap(5),
          InfoBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('المدينة', style: TextStyleManager.style14BoldPrimary),
                Text(city, style: TextStyleManager.style14RegSec),
              ],
            ),
          ),
          const Gap(5),
        ],
      ),
    );
  }
}
