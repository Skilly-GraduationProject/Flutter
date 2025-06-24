import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_PolicySection> sections = [
      _PolicySection(
        title: '١. المعلومات التي نجمعها',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          'قد نقوم بجمع أنواع مختلفة من البيانات، ومنها:',
          '• الاسم والبريد الإلكتروني في حال قمت بالتسجيل أو التواصل معنا.',
          '• أي معلومات تقوم بإدخالها طواعية عبر النماذج أو أثناء التسجيل.',
        ],
      ),
      _PolicySection(
        title: '٢. كيف نستخدم المعلومات؟',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          'نستخدم البيانات التي نجمعها من أجل:',
          '• تحسين تجربتك على الابلكيشن.',
          '• الرد على استفساراتك وتقديم الدعم.',
          '• إرسال تحديثات أو أخبار إذا اخترت الاشتراك في القائمة البريدية.',
          '• تحليل استخدام الابلكيشن بهدف تحسين الخدمات والمحتوى.',
        ],
      ),
      _PolicySection(
        title: '٣. حماية المعلومات',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          'نلتزم باتخاذ الإجراءات الأمنية المناسبة لحماية بياناتك من الوصول أو التعديل أو الكشف غير المصرح به. ومع ذلك، فإن نقل البيانات عبر الإنترنت لا يمكن أن يكون آمنًا بنسبة 100٪.',
        ],
      ),
      _PolicySection(
        title: '٤. مشاركة المعلومات',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          'نحن لا نبيع أو نؤجر أو نشارك معلوماتك الشخصية مع أي طرف ثالث، باستثناء الحالات الضرورية لتقديم الخدمة (مثل شركات الدفع أو الشحن)، ومع التزامهم بحماية خصوصيتك.',
        ],
      ),
    ];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'في الابلكيشن الخاص بنا ، نحترم خصوصيتك وملتزمون بحماية البيانات الشخصية التي تشاركها معنا. تهدف هذه السياسة إلى توضيح كيفية جمع واستخدام وحماية معلوماتك عند تصفحك .',
              style: TextStyleManager.style16RegSec,
              textAlign: TextAlign.start,
            ),
            const Gap(20),
            Expanded(
              child: ListView.separated(
                itemCount: sections.length,
                separatorBuilder: (context, index) => const Gap(20),
                itemBuilder: (context, index) {
                  final section = sections[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.title,
                        style: section.titleStyle,
                        textAlign: TextAlign.start,
                      ),
                      const Gap(8),
                      ...section.content.map((line) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              line,
                              style: TextStyleManager.style16RegSec,
                              textAlign: TextAlign.start,
                            ),
                          )),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PolicySection {
  final String title;
  final TextStyle titleStyle;
  final List<String> content;
  _PolicySection({
    required this.title,
    required this.titleStyle,
    required this.content,
  });
}
