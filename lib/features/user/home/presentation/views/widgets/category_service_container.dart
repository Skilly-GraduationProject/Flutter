import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';
import '../../../domain/entities/all_services_entity.dart';

class CategoryServiceContainer extends StatelessWidget {
  final AllServicesEntity offeredServicesEntity;
  const CategoryServiceContainer(
      {super.key,
      required this.name,
      required this.desc,
      required this.price,
      required this.providerImg,
      required this.providerName,
      required this.date,
      required this.img,
      required this.offeredServicesEntity});
  final String name, desc, price, providerImg, providerName, date, img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffF6F7F9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 1),
          ),
        ],
      ),
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
                    child: Image.network(providerImg,
                        width: context.responsiveWidth(50),
                        height: context.responsiveWidth(50),
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'اسم المستخدم',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Text(
                '13/10/2024',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120,
            ),
          ),
          const SizedBox(height: 10),
          Text(name, style: TextStyleManager.style12BoldBlue),
          const SizedBox(height: 5),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallPrimaryButton(
                text: 'عرض التفاصيل',
                color: ColorManager.primary,
                onTap: () {
                  GoRouter.of(context)
                      .push('/viewService', extra: offeredServicesEntity);
                },
              ),
              Text('$price ج.م', style: TextStyleManager.style12BoldPrimary),
            ],
          ),
        ],
      ),
    );
  }
}
