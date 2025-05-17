import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'الشروط والاحكام',
          style: TextStyleManager.style18BoldSec,
        ),
        centerTitle: true,
        leading: const BackIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              """مرحبًا بك في الابلكيشن الخاص بنا! من خلال استخدامك لهذا الابلكيشن، فإنك توافق على الالتزام بالشروط والأحكام التالية. يُرجى قراءتها بعناية قبل استخدام الابلكيشن.""",
              style: TextStyleManager.style16RegSec,
              textAlign: TextAlign.start,
            ),
            const Gap(20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. قبول الشروط",
                        style: TextStyleManager.style16BoldPrimary,
                      ),
                      const Gap(5),
                      Text(
                        """باستخدام هذا الابلكيشن، فإنك توافق على الالتزام بهذه الشروط والأحكام، وإذا لم توافق على أي جزء منها، نرجو عدم استخدام الابلكيشن.""",
                        style: TextStyleManager.style16RegSec,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
