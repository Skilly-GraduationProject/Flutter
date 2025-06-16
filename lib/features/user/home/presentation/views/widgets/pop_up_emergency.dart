import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';

import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';

class PopUpEmergency extends StatelessWidget {
  const PopUpEmergency({super.key});

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
                  child: Image.asset('assets/images/emergency.jpg',
                      width: context.responsiveWidth(130),
                      height: context.responsiveWidth(120),
                      fit: BoxFit.fill),
                ),


                Text(
                  'تم ارسال طلبك بنجاح برجاء الانتظار وسيتم ارسال موفر خدمة للمشكه في اقرب وقت',
                  style: TextStyleManager.style14BoldBlack,
                  textAlign: TextAlign.center,
                ),
                const Gap(15),

                SmallPrimaryButton(
                  text: 'اغلاق',
                  color: Colors.red,
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
