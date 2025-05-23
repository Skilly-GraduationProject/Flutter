import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';

import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';

class DiscountServiceCard extends StatelessWidget {
  const DiscountServiceCard(
      {super.key,
      required this.img,
      required this.name,
      required this.price,
      required this.discountPrice});
  final String img, name;
  final double price, discountPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(img,
                    width: context.responsiveWidth(200),
                    height: context.responsiveWidth(100),
                    fit: BoxFit.fill),
              ),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        name,
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
                        Text('$price ج.م',
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12)),
                        Text(
                          '$discountPrice ج.م',
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
        const Gap(10),
        OutlinedButton(
          onPressed: () {},
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
