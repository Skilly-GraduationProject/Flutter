import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../../../user/home/presentation/views/widgets/drop_down_list.dart';
import '../../manager/AddProviderDataCubit/addProviderData_cubit.dart';
import 'custom_button.dart';
import 'custom_drop_down.dart';
import 'custom_text_field.dart';
import 'verify_option.dart';

class ProviderDataForm extends StatefulWidget {
  const ProviderDataForm({super.key});

  @override
  State<ProviderDataForm> createState() => _ProviderDataFormState();
}

class _ProviderDataFormState extends State<ProviderDataForm> {
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

  File? pdfFile;

  Future<void> pickPDF() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        pdfFile = File(result.files.single.path!);
      });
    }
  }

  File? profileImage;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        profileImage = File(imagePath);
      });
    }
  }

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.single.path != null) {
      final pickedFile = File(result.files.single.path!);
      setState(() {
        profileImage = pickedFile;
      });
    }
  }

  int selectedGender = 0;
  String? selectedCity, selectedGovern, streetName, brief, categoryId;
  int? yearsOfExpert, age;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff1C274C),
                  width: 1,
                ),
              ),
              child: GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      profileImage != null ? FileImage(profileImage!) : null,
                  child: profileImage == null
                      ? const Icon(
                          Icons.upload_outlined,
                          size: 40,
                          color: Color(0xff1C274C),
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'يرجى اختيار صورة شخصية واضحة و مناسبة',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const Gap(20),
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
                age = int.tryParse(val!);
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
            const SizedBox(
              height: 20,
            ),
            DropDownList(
              hint: 'اختر القسم',
              onCategorySelected: (id) {
                setState(() {
                  categoryId = id;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: 'عدد سنوات الخبره',
              onSaved: (val) {
                yearsOfExpert = int.tryParse(val!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'برجاء تحميل صوره هويتك الشخصيه و ان تكون صوره واضحه',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff23255B)),
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: pickPDF,
                      child: Container(
                        height: 60,
                        width: 70,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xffF6F7F9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: pdfFile == null
                            ? const Icon(Icons.upload_outlined,
                                color: Color(0xff1C274C))
                            : const Icon(Icons.check_circle,
                                color: Colors.green),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'اكتب نبذه مختصره عنك',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: 'نبذه مختصره عنك',
              maxLines: 5,
              onSaved: (val) {
                brief = val;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              text: 'حفظ',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final token = await loadToken();

                  BlocProvider.of<AddProviderDataCubit>(context)
                      .addProviderData(
                          selectedGovern!,
                          selectedCity!,
                          streetName!,
                          profileImage!,
                          pdfFile!,
                          selectedGender,
                          age!,
                          brief!,
                          token!,
                          yearsOfExpert!,
                          categoryId!);
                  GoRouter.of(context).push('/signIn');
                }
              },
            ),
          ],
        ));
  }
}
