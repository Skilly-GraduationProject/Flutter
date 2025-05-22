import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';

class CollectPoints extends StatelessWidget {
  const CollectPoints({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/images/stars.png',
                      width: context.responsiveWidth(100),
                      height: context.responsiveWidth(70),
                      fit: BoxFit.fill),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+20 نقطة',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                const Gap(20),
                Text(
                  'لقد حصلت علي نقاط مقابل طلبك !',
                  style: TextStyleManager.style16BoldBlack,
                  textAlign: TextAlign.center,
                ),
                const Gap(10),
                const Text(
                  ' استخدم نقاطك التي حصلت عليها لشراء المزيد من الخدمات',
                  textAlign: TextAlign.center,
                ),
                const Gap(20),
                SmallPrimaryButton(
                  text: 'جمع النقاط',
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
                const Gap(10),
              ],
            ),
          ),
        ));
  }
}
