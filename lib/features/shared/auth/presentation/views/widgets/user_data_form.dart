import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/helper/save_token.dart';
import '../../manager/AddUserDataCubit/addUserData_cubit.dart';
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
    'القاهرة': [
      'مدينة نصر',
      'المعادي',
      'حلوان',
      'شبرا',
      'مصر الجديدة',
      'الزيتون',
      'المرج',
      'عين شمس',
      'السيدة زينب',
      'الزمالك',
      'العباسية',
      'التجمع الخامس',
      'المطرية',
      'البساتين',
      'دار السلام',
      'الخليفة',
      'الوايلي'
    ],
    'الجيزة': [
      'الهرم',
      'الدقي',
      'الشيخ زايد',
      '6 أكتوبر',
      'العجوزة',
      'الوراق',
      'البدرشين',
      'العياط',
      'أوسيم',
      'الصف',
      'أبو النمرس'
    ],
    'الإسكندرية': [
      'سموحة',
      'العصافرة',
      'محرم بك',
      'المنتزه',
      'سيدي بشر',
      'العجمي',
      'المعمورة',
      'ميامي',
      'اللبان',
      'كرموز',
      'المنشية'
    ],
    'القليوبية': [
      'بنها',
      'شبرا الخيمة',
      'طوخ',
      'قليوب',
      'الخانكة',
      'كفر شكر',
      'شبين القناطر',
      'الخصوص'
    ],
    'الدقهلية': [
      'المنصورة',
      'طلخا',
      'ميت غمر',
      'دكرنس',
      'الجمالية',
      'شربين',
      'المنزلة',
      'بني عبيد',
      'السنبلاوين',
      'تمى الأمديد'
    ],
    'الشرقية': [
      'الزقازيق',
      'العاشر من رمضان',
      'بلبيس',
      'أبو كبير',
      'ههيا',
      'فاقوس',
      'منيا القمح',
      'الإبراهيمية',
      'ديرب نجم'
    ],
    'الغربية': [
      'طنطا',
      'كفر الزيات',
      'المحلة الكبرى',
      'زفتى',
      'السنطة',
      'بسيون',
      'سمنود'
    ],
    'المنوفية': [
      'شبين الكوم',
      'منوف',
      'السادات',
      'تلا',
      'أشمون',
      'الباجور',
      'سرس الليان',
      'بركة السبع'
    ],
    'كفر الشيخ': [
      'كفر الشيخ',
      'بلطيم',
      'سيدي سالم',
      'دسوق',
      'الحامول',
      'الرياض',
      'فوه',
      'قلين'
    ],
    'البحيرة': [
      'دمنهور',
      'كفر الدوار',
      'إيتاي البارود',
      'رشيد',
      'أبو حمص',
      'المحمودية',
      'النوبارية',
      'حوش عيسى'
    ],
    'دمياط': [
      'دمياط',
      'رأس البر',
      'فارسكور',
      'الزرقا',
      'كفر سعد',
      'السرو',
      'عزبة البرج',
      'دمياط الجديدة'
    ],
    'بورسعيد': ['بورسعيد', 'بورفؤاد', 'الزهور', 'العرب', 'المناخ', 'الضواحي'],
    'الإسماعيلية': [
      'الإسماعيلية',
      'فايد',
      'القنطرة شرق',
      'القنطرة غرب',
      'أبو صوير',
      'التل الكبير'
    ],
    'السويس': ['حي السويس', 'حي الجناين', 'عتاقة', 'الأربعين'],
    'بني سويف': [
      'بني سويف',
      'بني سويف الجديدة',
      'الواسطى',
      'إهناسيا',
      'ناصر',
      'ببا',
      'الفشن'
    ],
    'الفيوم': [
      'الفيوم',
      'الفيوم الجديدة',
      'سنورس',
      'طامية',
      'إطسا',
      'يوسف الصديق'
    ],
    'المنيا': [
      'المنيا',
      'المنيا الجديدة',
      'أبوقرقاص',
      'ملوي',
      'مطاي',
      'بني مزار',
      'سمالوط'
    ],
    'أسيوط': [
      'أسيوط',
      'أسيوط الجديدة',
      'ديروط',
      'منفلوط',
      'البداري',
      'أبو تيج',
      'ساحل سليم',
      'الفتح'
    ],
    'سوهاج': [
      'سوهاج',
      'سوهاج الجديدة',
      'طهطا',
      'جرجا',
      'أخميم',
      'المراغة',
      'البلينا',
      'دار السلام'
    ],
    'قنا': ['قنا', 'نجع حمادي', 'قوص', 'دشنا', 'أبوتشت', 'نقادة', 'قفط'],
    'الأقصر': [
      'الأقصر',
      'الأقصر الجديدة',
      'الكرنك',
      'إسنا',
      'أرمنت',
      'الزينية'
    ],
    'أسوان': [
      'أسوان',
      'أسوان الجديدة',
      'كوم أمبو',
      'إدفو',
      'دراو',
      'نصر النوبة'
    ],
    'البحر الأحمر': [
      'الغردقة',
      'رأس غارب',
      'القصير',
      'سفاجا',
      'مرسى علم',
      'الشلاتين',
      'حلايب'
    ],
    'الوادي الجديد': ['الخارجة', 'الداخلة', 'الفرافرة', 'باريس', 'بلاط'],
    'مطروح': [
      'مرسى مطروح',
      'الضبعة',
      'سيدي براني',
      'السلوم',
      'الحمام',
      'النجيلة',
      'سيوة'
    ],
    'جنوب سيناء': [
      'شرم الشيخ',
      'دهب',
      'نويبع',
      'سانت كاترين',
      'أبو زنيمة',
      'أبو رديس',
      'طور سيناء'
    ],
    'شمال سيناء': ['العريش', 'الشيخ زويد', 'رفح', 'بئر العبد', 'الحسنة', 'نخل'],
  };
  List<String> get governs => cities.keys.toList();

  int selectedGender = 0;
  String? selectedCity,
      selectedGovern,
      age,
      streetName,
      firstName,
      secondName,
      img;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  title: 'الاسم الاخير',
                  onSaved: (val) {
                    secondName = val;
                  },
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: CustomTextField(
                  title: 'الاسم الاول',
                  onSaved: (val) {
                    firstName = val;
                  },
                )),
              ],
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: VerifyOption(
                  title: 'انثي',
                  selected: selectedGender == 1,
                  onTap: () {
                    setState(() {
                      selectedGender = 1;
                    });
                  },
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: VerifyOption(
                  title: 'ذكر',
                  selected: selectedGender == 0,
                  onTap: () {
                    setState(() {
                      selectedGender = 0;
                    });
                  },
                )),
              ],
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'حفظ',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final token = await loadToken();
                  print('token $token');
                  BlocProvider.of<AddUserDataCubit>(context).addUserData(
                    selectedGovern!,
                    selectedCity!,
                    streetName!,
                    img!,
                    selectedGender,
                    token!,
                  );
                  GoRouter.of(context).push('/signIn');
                }
              },
            )
          ],
        ));
  }
}
