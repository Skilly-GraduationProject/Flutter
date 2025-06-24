import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/picker_helper.dart';
import 'package:grad_project/core/widgets/custom_toast.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/models/edit_profile_model.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_cubit.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_drop_down.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:gap/gap.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:grad_project/features/user/home/presentation/manager/GetAllCategories/get_all_categories_cubit.dart';
import 'package:grad_project/features/user/home/presentation/manager/GetAllCategories/get_all_categories_states.dart';
import 'package:grad_project/features/user/home/domain/entities/category_item_entity.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key, required this.providerProfileModel});
  final ProviderProfileModel providerProfileModel;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final _formKey = GlobalKey<FormState>();
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

  final List<String> governs = [
    'القاهرة',
    'الإسكندرية',
    'الجيزة',
    'أسوان',
    'الأقصر',
    'بورسعيد',
    'دمياط',
    'البحيرة',
    'الغربية',
    'المنوفية',
    'الشرقية',
    'الدقهلية',
    'كفر الشيخ',
    'المنيا',
    'أسيوط',
    'سوهاج',
    'قنا',
    'البحر الأحمر',
    'الوادي الجديد',
    'مطروح',
    'شمال سيناء',
    'جنوب سيناء',
    'بني سويف',
    'الفيوم',
    'الإسماعيلية',
    'السويس',
    'شرم الشيخ'
  ];
  List<String> professions = [];

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController streetNameController;
  late TextEditingController ageController;
  late TextEditingController yearsOfExpController;
  late TextEditingController briefSummaryController;

  String? selectedGovern, selectedCity, selectedProfession;
  int? gender;
  XFile? imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Fetch categories when the widget is created
    context.read<GetAllCategoriesCubit>().getAllCategories();

    final provider = widget.providerProfileModel.provider;
    firstNameController = TextEditingController(text: provider?.firstName);
    lastNameController = TextEditingController(text: provider?.lastName);
    streetNameController = TextEditingController(text: provider?.streetName);
    ageController = TextEditingController(text: provider?.age);
    yearsOfExpController =
        TextEditingController(text: provider?.numberOfYearExperience);
    briefSummaryController =
        TextEditingController(text: provider?.briefSummary);

    // Check if the initial governorate is in the list before setting
    if (governs.contains(provider?.governorate)) {
      selectedGovern = provider?.governorate;
    } else {
      selectedGovern = null;
    }
    // Check if the initial city is in the list for the selected governorate before setting
    if (selectedGovern != null &&
        cities[selectedGovern]?.contains(provider?.city) == true) {
      selectedCity = provider?.city;
    } else {
      selectedCity = null;
    }
    gender = provider?.gender;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    streetNameController.dispose();
    ageController.dispose();
    yearsOfExpController.dispose();
    briefSummaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesStates>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        if (state is GetAllCategoriesSuccess) {
          professions = state.category.categories
              .map((item) => item.professionName!)
              .toList();
          if (selectedProfession == null) {
            if (professions
                .contains(widget.providerProfileModel.provider?.profession)) {
              selectedProfession =
                  widget.providerProfileModel.provider?.profession;
            } else {
              selectedProfession = null;
            }
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(24),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        PickerHelper()
                            .showPickerBottomSheet(
                                context: context, type: ImagePickerType.single)
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              imageFile = value;
                            });
                          }
                        });
                      },
                      child: CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.transparent,
                        child: imageFile != null
                            ? ClipOval(
                                child: Image.file(File(imageFile!.path),
                                    width: 96, height: 96, fit: BoxFit.cover))
                            : CustomImage(
                                image:
                                    widget.providerProfileModel.provider?.img ??
                                        '',
                                height: 96,
                                width: 96,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Center(
                    child: Text(
                      'يرجى اختيار صورة شخصية واضحة و مناسبة',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ),
                  const Gap(24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          title: 'الاسم الاول',
                          controller: firstNameController,
                          validate: false,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(
                          title: 'الاسم الاخير',
                          controller: lastNameController,
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
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
                  const Gap(16),
                  CustomDropDown(
                    selectedValue: (selectedGovern != null &&
                            (cities[selectedGovern]?.contains(selectedCity) ??
                                false))
                        ? selectedCity
                        : null,
                    hint: 'المدينة',
                    items: selectedGovern != null
                        ? cities[selectedGovern] ?? []
                        : [],
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                  const Gap(16),
                  CustomTextField(
                    title: 'اسم الشارع',
                    controller: streetNameController,
                  ),
                  const Gap(16),
                  CustomTextField(
                    title: 'السن',
                    controller: ageController,
                    keyboardType: TextInputType.number,
                  ),
                  const Gap(16),
                  CustomDropDown(
                    selectedValue: selectedProfession,
                    hint: 'المهنة',
                    items: professions,
                    onChanged: (value) {
                      setState(() {
                        selectedProfession = value;
                      });
                    },
                  ),
                  const Gap(16),
                  CustomTextField(
                    title: 'عدد سنوات الخبرة',
                    controller: yearsOfExpController,
                    keyboardType: TextInputType.number,
                  ),
                  // const Gap(16),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () => setState(() => gender = 0),
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(vertical: 12),
                  //           decoration: BoxDecoration(
                  //             color: gender == 0
                  //                 ? Colors.blue[900]
                  //                 : Colors.grey[200],
                  //             borderRadius: BorderRadius.circular(10),
                  //           ),
                  //           child: Center(
                  //             child: Text('أنثى',
                  //                 style: TextStyle(
                  //                     color: gender == 0
                  //                         ? Colors.white
                  //                         : Colors.black)),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 12),
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () => setState(() => gender = 1),
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(vertical: 12),
                  //           decoration: BoxDecoration(
                  //             color: gender == 1
                  //                 ? Colors.blue[900]
                  //                 : Colors.grey[200],
                  //             borderRadius: BorderRadius.circular(10),
                  //           ),
                  //           child: Center(
                  //             child: Text('ذكر',
                  //                 style: TextStyle(
                  //                     color: gender == 1
                  //                         ? Colors.white
                  //                         : Colors.black)),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Gap(16),
                  // Row(
                  //   children: [
                  //     Icon(Icons.credit_card, color: Colors.blue[900]),
                  //     const SizedBox(width: 8),
                  //     Expanded(
                  //       child: Text(
                  //         'يرجى تحميل صورة هويتك الشخصية و ان تكون صورة واضحة.',
                  //         style:
                  //             TextStyle(fontSize: 12, color: Colors.grey[700]),
                  //       ),
                  //     ),
                  //     Icon(Icons.upload_file, color: Colors.blue[900]),
                  //   ],
                  // ),
                  const Gap(16),
                  const Text('اكتب نبذة مختصرة عنك',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Gap(8),
                  CustomTextField(
                    title: 'نبذة مختصرة عنك',
                    controller: briefSummaryController,
                    maxLines: 4,
                  ),
                  const Gap(24),
                  PrimaryButton(
                    text: 'حفظ',
                    onTap: () {
                      EditProfileModel model = EditProfileModel(
                        governorate: selectedGovern ?? '',
                        city: selectedCity ?? '',
                        streetName: streetNameController.text,
                        age: int.parse(ageController.text),
                        gender: gender ?? 0,
                        numberOfYearExperience:
                            int.parse(yearsOfExpController.text),
                        categoryId: selectedProfession == null
                            ? null
                            : state.category.categories
                                .firstWhere((item) =>
                                    item.professionName == selectedProfession)
                                .id,
                        briefSummary: briefSummaryController.text,
                        img: imageFile?.path,
                      );
                      print(selectedProfession);
                      if (selectedCity == null || selectedGovern == null) {
                        showCustomToast(
                            context: context,
                            type: ToastType.failure,
                            message: "حقل المدينه مطلوب");
                      } else {
                        context.read<ProviderDataCubit>().editProfile(model);
                      }
                    },
                  ),
                  const Gap(24),
                ],
              ),
            ),
          );
        } else if (state is GetAllCategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllCategoriesFailure) {
          return Center(
              child: Text('Failed to load professions: ${state.error}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
