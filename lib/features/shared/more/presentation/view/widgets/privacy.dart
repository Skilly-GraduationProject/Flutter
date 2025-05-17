import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

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
          'سياسة الخصوصية',
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
              """في الابلكيشن الخاص بنا ، نحترم خصوصيتك وملتزمون بحماية البيانات الشخصية التي تشاركها معنا. تهدف هذه السياسة إلى توضيح كيفية جمع واستخدام وحماية معلوماتك عند تصفحك .""",
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
                        "${index + 1}. المعلومات التي نجمعها",
                        style: TextStyleManager.style16BoldPrimary,
                      ),
                      const Gap(5),
                      Text(
                        """قد نقوم بجمع أنواع مختلفة من البيانات، ومنها:\nالاسم والبريد الإلكتروني في حال قمت بالتسجيل أو التواصل معنا.\nأي معلومات تقوم بإدخالها طواعية عبر النماذج أو أثناء التسجيل.""",
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
