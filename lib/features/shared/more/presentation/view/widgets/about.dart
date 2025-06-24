import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_AboutFeature> features = [
      _AboutFeature(
        title: 'مقدمو خدمات محترفون:',
        description:
            'يمكنك استعراض ملفات مقدمي الخدمات، مشاهدة معرض أعمالهم السابقة، والاطلاع على تقييماتهم لتحديد الأنسب لك.',
      ),
      _AboutFeature(
        title: 'سهولة طلب الخدمة:',
        description:
            'المستخدمون يمكنهم طلب الخدمة التي يحتاجونها بسهولة، مع إمكانية تخصيص الطلب وتحديد تفاصيله واستلام عرض سعر من مقدم الخدمة قبل التنفيذ.',
      ),
      _AboutFeature(
        title: 'نظام محادثة داخلي:',
        description:
            'تواصل مباشر وسلس بين المستخدم ومقدم الخدمة لتوضيح كافة التفاصيل قبل التنفيذ.',
      ),
      _AboutFeature(
        title: 'إشعارات فورية:',
        description: 'يتم إشعارك بكل جديد على طلباتك ومراسلاتك بشكل لحظي.',
      ),
      _AboutFeature(
        title: 'نظام النقاط والمكافآت:',
        description:
            'احصل على نقاط مقابل استخدامك للمنصة وفعالياتك مثل التقييم والتفاعل، واستخدمها في خصومات أو خدمات مستقبلية.',
      ),
      _AboutFeature(
        title: 'الدفع الإلكتروني الآمن:',
        description: 'نوفر طرق دفع مرنة وآمنة لتسهيل عمليات الدفع بين الطرفين.',
      ),
      _AboutFeature(
        title: 'نظام الطوارئ:',
        description:
            'في حال وجود حالة طارئة، يتيح للمستخدم تفعيل خيار "الطوارئ" ليحصل على الخدمة بأولوية فورية.',
      ),
      _AboutFeature(
        title: 'تقييم ومراجعة الخدمات:',
        description:
            'بعد إتمام أي خدمة، يمكن لكل مستخدم تقييم الخدمة وإبداء رأيه لتحسين الجودة وتعزيز المصداقية.',
      ),
      _AboutFeature(
        title: 'الاعتماد على الموقع الجغرافي:',
        description:
            'نساعدك في ربطك بأقرب مقدم خدمات في منطقتك لتحقيق الاستجابة الأسرع.',
      ),
      _AboutFeature(
        title: 'فلترة الخدمات:',
        description:
            'استعرض الخدمات بشكل مصنف حسب التخصص، التقييم، السعر، والمسافة، لتحصل على ما يناسبك بدقة.',
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
          'نبذة عن التطبيق',
          style: TextStyleManager.style18BoldSec,
        ),
        centerTitle: true,
        leading: const BackIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'نحن فريق من الخبراء المتخصصين نربط بين المستخدمين ومقدمي الخدمات في تجربة سلسة وآمنة، تُمكّنك من الوصول إلى كافة احتياجاتك اليومية في مكان واحد. سواء كنت تبحث عن مبرمج لحل مشكلة تقنية أو تحتاج إلى فني لصيانة منزلك، أو ترغب في استكشاف أفضل العروض والخدمات المتاحة بالقرب منك، منصتنا توفر لك كل ذلك وأكثر، من خلال نظام ذكي ومرنٍ يضمن تلبية احتياجاتك بكفاءة واحترافية.',
              style: TextStyleManager.style16RegSec,
              textAlign: TextAlign.start,
            ),
            const Gap(20),
            Text(
              'ما يميز منصتنا:',
              style: TextStyleManager.style16BoldPrimary,
              textAlign: TextAlign.start,
            ),
            const Gap(10),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyleManager.style16BoldPrimary,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: feature.title,
                                style: TextStyleManager.style16BoldPrimary,
                              ),
                              TextSpan(
                                text: feature.description,
                                style: TextStyleManager.style16RegSec,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                )),
            const Gap(20),
            Text(
              'هدفنا هو تمكين الأفراد من الوصول إلى حلول فعالة وسريعة لمشاكلهم اليومية، مع تعزيز ثقة المستخدمين في تجربة رقمية تعتمد على الجودة، الشفافية، والراحة.',
              style: TextStyleManager.style16BoldSec,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutFeature {
  final String title;
  final String description;
  _AboutFeature({required this.title, required this.description});
}
