
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';
import 'verify_option.dart';

class UserDataForm extends StatefulWidget {
  const UserDataForm({super.key});

  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
    String selectedGender = 'ذكر';
  @override
  Widget build(BuildContext context) {
    return  Form(
              child: Column(
            children: [
              CustomTextField(
                title: 'المحافظة',
                icon: const Icon(Icons.keyboard_arrow_down),
                 onSaved: (val){},
              ),
              const SizedBox(height: 10),
            CustomTextField(
                title: 'المدينة',
                icon:const Icon(Icons.keyboard_arrow_down),
                 onSaved: (val){},
              ),
              const SizedBox(height: 10),
             CustomTextField(title: 'اسم الشارع', onSaved: (val){},),
              const SizedBox(height: 10),
              CustomTextField(
                title: 'السن',
                icon: const Icon(Icons.keyboard_arrow_down),
                 onSaved: (val){},
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
                  GoRouter.of(context).push('/provider');
                },
              )
            ],
          ));
  }
}