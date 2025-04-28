import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import '../../../../../../core/managers/text_style_manager.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.name, required this.image});
  final String name, image;
  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width / 3.2,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(image,
                width: context.responsiveWidth(50),
                height: context.responsiveWidth(50),
                fit: BoxFit.cover),
          ),
          const Gap(8),
          Flexible(
            child: Text(
              name,
              style: TextStyleManager.style12BoldSec,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
