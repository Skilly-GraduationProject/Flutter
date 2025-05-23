import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';

import '../../../../../shared/auth/presentation/views/widgets/custom_button.dart';

class PointsEntryViewBody extends StatelessWidget {
  const PointsEntryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'اكسب نقاط اضافية\nووفر في مشرياتك القادمة !',
            textAlign: TextAlign.center,
            style: TextStyleManager.style18BoldPrimary,
          ),
          Image.asset(ImageManager.points),
          CustomButton(
            text: 'ابدأ الان ',
            onTap: () {
              GoRouter.of(context).push(RouterPath.discountsView);
            },
          ),
        ],
      ),
    );
  }
}
