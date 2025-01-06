import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'custom_drop_down.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'verify_option.dart';

class UserDataForm extends StatefulWidget {
  const UserDataForm({super.key});

  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  final Map<String, List<String>> cities = {
    'القاهرة': ['مدينة نصر', 'المعادي', 'حلوان', 'شبرا'],
    'الإسكندرية': ['سموحة', 'العصافرة', 'محرم بك', 'المنتزه'],
    'الجيزة': ['الهرم', 'الدقي', 'الشيخ زايد', '6 أكتوبر'],
    'أسوان': ['أسوان الجديدة', 'كوم أمبو', 'دراو', 'إدفو'],
    'الأقصر': ['الكرنك', 'الأقصر الجديدة', 'إسنا', 'أرمنت'],
    'بورسعيد': ['الزهور', 'بورفؤاد', 'العرب', 'المناخ'],
  };
  List<String> governs = [
    'القاهرة',
    'الإسكندرية',
    'الجيزة',
    'أسوان',
    'الأقصر',
    'بورسعيد',
  ];
  String selectedGender = 'ذكر';
  String? selectedCity, selectedGovern, age, streetName;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            CustomDropDown(
              selectedValue: selectedGovern,
              hint: 'المحافظة',
              items: governs,
              onChanged: (value) {
                setState(() {
                  selectedGovern = value;
                  selectedCity = null;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomDropDown(
              selectedValue: (selectedGovern != null &&
                      (cities[selectedGovern]?.contains(selectedCity) ?? false))
                  ? selectedCity
                  : null,
              hint: 'المدينة',
              items: selectedGovern != null ? cities[selectedGovern] ?? [] : [],
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              title: 'اسم الشارع',
              onSaved: (val) {
                streetName = val;
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              title: 'السن',
              onSaved: (val) {
                age = val;
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: VerifyOption(
                  title: 'انثي',
                  selected: selectedGender == 'انثي',
                  onTap: () {
                    setState(() {
                      selectedGender = 'انثي';
                    });
                  },
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: VerifyOption(
                  title: 'ذكر',
                  selected: selectedGender == 'ذكر',
                  onTap: () {
                    setState(() {
                      selectedGender = 'ذكر';
                    });
                  },
                )),
              ],
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'حفظ',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  GoRouter.of(context).push('/provider');
                }
              },
            )
          ],
        ));
  }
}
