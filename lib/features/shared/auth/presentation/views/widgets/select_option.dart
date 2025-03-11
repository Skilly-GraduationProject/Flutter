// import 'package:flutter/material.dart';
// import 'package:grad_project/features/shared/auth/presentation/views/widgets/verify_option.dart';
// import 'custom_button.dart';
// import 'custom_text_field.dart';

// class SelectOption extends StatefulWidget {
//   const SelectOption(
//       {super.key,
//       required this.first,
//       required this.second,
//       required this.onSaved});
//   final String first, second;
//   final Function(String selectedOption, String input) onSaved;

//   @override
//   State<SelectOption> createState() => _SelectOptionState();
// }

// class _SelectOptionState extends State<SelectOption> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   String selectedOption = 'email';
//   String? input;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: VerifyOption(
//                   title: widget.second,
//                   selected: selectedOption == 'phone',
//                   onTap: () {
//                     setState(() {
//                       selectedOption = 'phone';
//                     });
//                   }),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: VerifyOption(
//                   title: widget.first,
//                   selected: selectedOption == 'email',
//                   onTap: () {
//                     setState(() {
//                       selectedOption = 'email';
//                     });
//                   }),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         Form(
//           key: formKey,
//           child: Column(
//             children: [
//               if (selectedOption == 'email')
//                 CustomTextField(
//                   title: 'البريد الالكتروني',
//                   onSaved: (val) => input = val,
//                 ),
//               if (selectedOption == 'phone')
//                 CustomTextField(
//                   title: 'رقم الهاتف',
//                   icon: Image.asset('assets/images/EG.png'),
//                   onSaved: (val) => input = val,
//                 ),
//               const SizedBox(
//                 height: 40,
//               ),
//               CustomButton(
//                 text: 'التالي',
//                 onTap: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                     widget.onSaved(selectedOption, input!);

//                   }
//                 },
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'verify_option.dart';

class SelectOption extends StatefulWidget {
  const SelectOption({
    super.key,
    required this.options,
    required this.optionWidgets,
    required this.onSaved,
  });

  final List<String> options;
  final Map<String, Widget> optionWidgets;
  final Function(String selectedOption, dynamic input) onSaved;

  @override
  State<SelectOption> createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectOption> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedOption;
  dynamic input;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: widget.options.map((option) {
            return Expanded(
              child: VerifyOption(
                title: option,
                selected: selectedOption == option,
                onTap: () {
                  setState(() {
                    selectedOption = option;
                  });
                },
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                widget.optionWidgets[selectedOption] ?? const SizedBox(),
                const SizedBox(height: 40),
                CustomButton(
                  text: 'التالي',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      setState(() {});
                      widget.onSaved(selectedOption!, input);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
