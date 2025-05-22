import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_button.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/drop_down_list.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_text_field.dart';
import '../request_service_view.dart';
import 'custom_app_bar.dart';
import 'emergency_offers_list_view.dart';

class EmergencyViewBody extends StatefulWidget {
  const EmergencyViewBody({super.key});

  @override
  State<EmergencyViewBody> createState() => _EmergencyViewBodyState();
}

class _EmergencyViewBodyState extends State<EmergencyViewBody> {
  String? category, desc;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> offers = [];
  bool isLoading = false;

  void sendRequest() {
    setState(() => isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        offers = [
          {
            'name': 'اسم المستخدم',
            'rating': 4.5,
            'time': 'خلال 20 دقيقة',
            'price': '300 د.م',
            'image': 'https://i.pravatar.cc/100',
          },
          {
            'name': 'مزود الخدمة',
            'rating': 4.5,
            'time': 'خلال 15 دقيقة',
            'price': '280 د.م',
            'image': 'https://i.pravatar.cc/101',
          },
          {
            'name': 'اسم المستخدم',
            'rating': 4.5,
            'time': 'خلال 20 دقيقة',
            'price': '300 د.م',
            'image': 'https://i.pravatar.cc/100',
          },
      
        ];
        isLoading = false;
      });
    });
  }

  void rejectOffer(int index) {
    setState(() {
      offers.removeAt(index);
    });
  }

  void acceptOffer(Map<String, dynamic> offer) {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(title: 'Emergency'),
                    Center(
                      child: Image.asset(
                        'assets/images/emergency.jpg',
                        width: context.responsiveWidth(200),
                        height: context.responsiveHeight(200),
                      ),
                    ),
                    const Gap(5),
                    Center(
                      child: Text(
                        'طلب مساعدة طارئة',
                        style: TextStyleManager.style20BoldBlack,
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      'هل تواجه مشكلة عاجلة؟ احصل على الدعم السريع من أقرب مقدم خدمة متاح الآن',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    const TitleWidget(title: 'نوع الطوارئ'),
                    DropDownList(
                      onCategorySelected: (id) {
                        setState(() {
                          category = id;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    const TitleWidget(title: 'وصف المشكلة'),
                    CustomTextField(
                      title: '',
                      onSaved: (val) => desc = val,
                      maxLines: 4,
                    ),
                    const Gap(20),
                    CustomButton(
                      text: isLoading ? '... جار الإرسال' : 'ارسال',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          sendRequest();
                        }
                      },
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        if (offers.isNotEmpty)
          Positioned(
            child: Expanded(
              child: EmergencyOffersListView(
                offers: offers,
                onReject: rejectOffer,
                onAccept: acceptOffer,
              ),
            ),
          ),
      ],
    );
  }
}
