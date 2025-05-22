import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'verify_option.dart';

class VerficationBottomSheet extends StatefulWidget {
  const VerficationBottomSheet({super.key});

  @override
  State<VerficationBottomSheet> createState() => _VerficationBottomSheetState();
}

class _VerficationBottomSheetState extends State<VerficationBottomSheet> {
  String selectedOption = 'phone';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 50,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "التحقق من ملكية الحساب",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              "سوف يتم ارسال رمز التحقق الى الطريقة التي ستختارها",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ": ارسال الى",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          VerifyOption(
              title: 'البريد الالكتروني',
              selected: selectedOption == 'email',
              onTap: () {
                setState(() {
                  selectedOption = 'email';
                });
              }),
          const SizedBox(height: 20),
          VerifyOption(
              title: 'رقم الهاتف',
              selected: selectedOption == 'phone',
              onTap: () {
                setState(() {
                  selectedOption = 'phone';
                });
              }),
          const SizedBox(height: 40),
          CustomButton(
            text: 'ارسال',
            onTap: () {
              Navigator.pop(context);

            },
          ),
        ],
      ),
    );
  }
}
