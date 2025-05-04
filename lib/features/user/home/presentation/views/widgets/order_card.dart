import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/text_style_manager.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key,
      required this.name,
      required this.desc,
      required this.price,
      required this.img});

  final String name, desc, img;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(img,
                width: context.responsiveWidth(200),
                height: context.responsiveWidth(200),
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyleManager.style14BoldBlack,
                ),
                const Gap(10),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 12, color: Colors.black38),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('العروض'),
                    SizedBox(
                      width: context.responsiveWidth(5),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: ColorManager.secondary),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: Text(
                          '5',
                          style: TextStyleManager.style12BoldWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '$price ج.م',
                      style: TextStyleManager.style14RegSec,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
