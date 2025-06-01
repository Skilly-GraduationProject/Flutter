import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/features/user/home/presentation/manager/ApplyDiscount/apply_discount_cubit.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/buy_service_sheet.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/all_services_entity.dart';

class DiscountServiceCard extends StatelessWidget {
  const DiscountServiceCard({super.key, required this.service});

  final AllServicesEntity service;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push('/viewService', extra: service);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(service.img,
                      width: context.responsiveWidth(200),
                      height: context.responsiveWidth(100),
                      fit: BoxFit.fill),
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(children: [
                      Expanded(
                        child: Text(
                          service.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ])),
                const Gap(5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${service.price} ج.م',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12)),
                          Text(
                            '${service.discountPrice} ج.م',
                            style: TextStyleManager.style12BoldPrimary,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
        const Gap(10),
        OutlinedButton(
          onPressed: () {
            BlocProvider.of<ApplyDiscountCubit>(context).applyDiscount(
              service.id,  
            );
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
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: ColorManager.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
          child:
              Text('استخدم الخصم', style: TextStyleManager.style12BoldPrimary),
        )
      ],
    );
  }
}
