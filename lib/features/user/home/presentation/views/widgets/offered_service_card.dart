import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/widgets/buttons/small_primary_button.dart';

import '../../../domain/entities/all_services_entity.dart';

class OfferedServiceCard extends StatelessWidget {
  const OfferedServiceCard({super.key, required this.service});

  final AllServicesEntity service;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.network(service.providerImg,
                        width: context.responsiveWidth(50),
                        height: context.responsiveWidth(50),
                        fit: BoxFit.cover),
                  ),
                  const Gap(10),
                  Text(
                    service.providerName,
                    style: TextStyleManager.style14BoldSec,
                  ),
                ],
              ),
              Text(service.time)
            ],
          ),
          const Gap(10),
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(service.img,
                  width: context.responsiveWidth(350),
                  height: context.responsiveWidth(150),
                  fit: BoxFit.cover),
            ),
          ]),
          const Gap(10),
          Text(
            service.name,
            style: TextStyleManager.style12BoldBlue,
          ),
          const Gap(10),
          Text(service.desc),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallPrimaryButton(
                text: "عرض التفاصيل",
                onTap: () {
                  GoRouter.of(context).push('/viewService', extra: service);
                },
              ),
              Text(
                "${service.price} ج.م",
                style: TextStyleManager.style12BoldPrimary,
              ),
            ],
          )
        ],
      ),
    );
  }
}
