import 'package:flutter/material.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';


class ServiceDataColumn extends StatelessWidget {
  const ServiceDataColumn({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(context.responsiveHeight(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorManager.whiteShade,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyleManager.style12BoldSec,
          ),
          Text(
            value,
            style: TextStyleManager.style12RegSec,
          ),
        ],
      ),
    );
  }
}
