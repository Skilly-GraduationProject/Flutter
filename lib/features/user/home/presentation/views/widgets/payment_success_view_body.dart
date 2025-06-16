import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/managers/text_style_manager.dart';
import '../../../../../../core/navigation/router_path.dart';
import '../../../../../../core/widgets/buttons/small_primary_button.dart';

class PaymentSuccessViewBody extends StatelessWidget {
  const PaymentSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 150,
              color: Colors.green,
            ),
            const SizedBox(height: 32),
            Text('تم الدفع بنجاح!', style: TextStyleManager.style20BoldBlack),
            const SizedBox(height: 16),
            Text(
              'لأي استفسارات أو لمشاركة تفاصيل إضافية، تقدر تتواصل معانا دلوقتي من خلال الشات.',
              style: TextStyleManager.style14BoldBlack,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Icon(
              (FontAwesomeIcons.commentDots),
              size: 40,
              color: Colors.grey[400],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallPrimaryButton(
                  text: 'العودة الى الرئيسية',
                  color: Colors.green,
                  onTap: () {
                    GoRouter.of(context).go(RouterPath.userHome);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
