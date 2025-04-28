import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';
import 'verify_option.dart';

class ProviderDataForm extends StatefulWidget {
  const ProviderDataForm({super.key});

  @override
  State<ProviderDataForm> createState() => _ProviderDataFormState();
}

class _ProviderDataFormState extends State<ProviderDataForm> {
  String selectedGender = 'ذكر';
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextField(
          title: 'المحافظة',
          icon: const Icon(Icons.keyboard_arrow_down),
          onSaved: (val) {},
        ),
        const SizedBox(height: 10),
        CustomTextField(
          title: 'المدينة',
          icon: const Icon(Icons.keyboard_arrow_down),
          onSaved: (val) {},
        ),
        const SizedBox(height: 10),
        CustomTextField(
          title: 'اسم الشارع',
          onSaved: (val) {},
        ),
        const SizedBox(height: 10),
        CustomTextField(
          title: 'السن',
          icon: const Icon(Icons.keyboard_arrow_down),
          onSaved: (val) {},
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
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          title: 'المهنه',
          icon: const Icon(Icons.keyboard_arrow_down),
          onSaved: (val) {},
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          title: 'عدد سنوات الخبره',
          icon: const Icon(Icons.keyboard_arrow_down),
          onSaved: (val) {},
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
            Container(
              height: 60,
              width: 70,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: const Color(0xffF6F7F9),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  const Icon(
                    Icons.upload_outlined,
                    color: Color(0xff1C274C),
                  ),
                  Image.asset('assets/images/Group.png'),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
          onSaved: (val) {},
        ),
        const SizedBox(
          height: 40,
        ),
        const CustomButton(text: 'حفظ'),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
