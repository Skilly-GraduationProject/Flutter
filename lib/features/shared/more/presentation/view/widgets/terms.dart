import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_TermsSection> sections = [
      _TermsSection(
        title: '١. قبول الشروط',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          'باستخدام هذا الابلكيشن، فإنك توافق على الالتزام بهذه الشروط والأحكام، وإذا لم توافق على أي جزء منها، نرجو عدم استخدام الابلكيشن.',
        ],
      ),
      _TermsSection(
        title: '٢. التعديلات على الشروط',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          'نحتفظ بالحق في تعديل أو تحديث هذه الشروط في أي وقت دون إشعار مسبق. استمرارك في استخدام الابلكيشن بعد التعديلات يعتبر موافقة منك على الشروط المعدّلة.',
        ],
      ),
      _TermsSection(
        title: '٣. استخدام الابلكيشن',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          '• لا يجوز لك استخدام الموقع لأي غرض غير قانوني، أو ممنوع بموجب هذه الشروط.',
          '• يجب أن تلتزم بعدم التسبب بأي ضرر للموقع أو تعطيله أو تحميله بشكل مفرط.',
        ],
      ),
      _TermsSection(
        title: '٤. الملكية الفكرية',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          'جميع المحتويات المعروضة على الابلكيشن ، بما في ذلك النصوص، الصور، التصاميم، والشعارات، مملوكة لنا أو نستخدمها بموجب ترخيص. لا يجوز نسخها أو إعادة استخدامها دون إذن كتابي مسبق.',
        ],
      ),
      _TermsSection(
        title: '٥. المسؤولية',
        titleStyle: TextStyleManager.style16BoldPrimary,
        content: [
          'نحن لا نتحمل أي مسؤولية عن أي خسائر أو أضرار قد تنتج عن استخدامك للابلكيشن أو اعتمادك على أي من المعلومات المتاحة فيه.',
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
          'الشروط والاحكام',
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
              'مرحبًا بك في الابلكيشن الخاص بنا! من خلال استخدامك لهذا الابلكيشن، فإنك توافق على الالتزام بالشروط والأحكام التالية. يُرجى قراءتها بعناية قبل استخدام الابلكيشن.',
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

class _TermsSection {
  final String title;
  final TextStyle titleStyle;
  final List<String> content;
  _TermsSection({
    required this.title,
    required this.titleStyle,
    required this.content,
  });
}
