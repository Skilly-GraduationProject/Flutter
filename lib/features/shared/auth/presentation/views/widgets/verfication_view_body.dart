import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants.dart';
import 'code_numbers.dart';
import 'custom_button.dart';

class VerficationViewBody extends StatefulWidget {
  const VerficationViewBody({super.key});

  @override
  State<VerficationViewBody> createState() => _VerficationViewBodyState();
}

class _VerficationViewBodyState extends State<VerficationViewBody> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'التحقق',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Text(
              'التحقق من ملكيه الحساب',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700]),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'قم بكتابة كود التحقق الذي تم إرساله الي',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '+201020301328',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor),
            ),
            const SizedBox(
              height: 40,
            ),
            CodeNumbers(
              controller1: controller1,
              controller2: controller2,
              controller3: controller3,
              controller4: controller4,
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'التالي',
              onTap: () {
                GoRouter.of(context).push('/reset');
                // final code = controller1.text +
                //     controller2.text +
                //     controller3.text +
                //     controller4.text;
              },
            )
          ]),
    );
  }
}
