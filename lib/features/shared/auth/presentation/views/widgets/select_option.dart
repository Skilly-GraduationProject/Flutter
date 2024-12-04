import 'package:flutter/material.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/verify_option.dart';
import 'custom_text_field.dart';

class SelectOption extends StatefulWidget {
  const SelectOption({super.key, required this.first, required this.second});
  final String first, second;

  @override
  State<SelectOption> createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectOption> {
  String selectedOption = 'phone';
  String? email;
  int? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: VerifyOption(
                  title: widget.second,
                  selected: selectedOption == 'phone',
                  onTap: () {
                    setState(() {
                      selectedOption = 'phone';
                    });
                  }),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: VerifyOption(
                  title: widget.first,
                  selected: selectedOption == 'email',
                  onTap: () {
                    setState(() {
                      selectedOption = 'email';
                    });
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        if (selectedOption == 'email')
          CustomTextField(
            title: 'البريد الالكتروني',
            onSaved: (val) {
              email = val;
            },
          ),
        if (selectedOption == 'phone')
          CustomTextField(
            title: 'رقم الهاتف',
            icon: Image.asset('assets/images/EG.png'),
            onSaved: (val) {
              phoneNumber = int.tryParse(val!)??0;
            },
          ),
      ],
    );
  }
}
