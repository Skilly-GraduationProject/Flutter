import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../../manager/ApplyDiscount/apply_discount_cubit.dart';

class UseDiscountButton extends StatelessWidget {
  const UseDiscountButton({super.key, required this.service});

  final AllServicesEntity service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {
          BlocProvider.of<ApplyDiscountCubit>(context)
              .applyDiscount(service.id, service);
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: ColorManager.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        child: Text('استخدم الخصم', style: TextStyleManager.style12BoldPrimary),
      ),
    );
  }
}
