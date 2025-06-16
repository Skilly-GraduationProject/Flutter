import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../domain/entities/user_orders_entity.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final UserOrdersEntity order;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RouterPath.orderDetailedView, extra: order);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            order.img != null && order.img!.trim().isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(order.img!,
                        width: context.responsiveWidth(200),
                        height: context.responsiveWidth(100),
                        fit: BoxFit.fill),
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.name,
                    style: TextStyleManager.style14BoldBlack,
                  ),
                  const Gap(5),
                  Text(
                    order.notes ?? '',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .push(RouterPath.offersView, extra: order.id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: ColorManager.secondary),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              'العروض',
                              style: TextStyleManager.style12BoldWhite,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.responsiveWidth(5),
                      ),
                      Text(
                        '"${order.offersCount}"',
                        style: TextStyleManager.style12BoldSec,
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        '${order.price} ج.م',
                        style: TextStyleManager.style14BoldPrimary,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
