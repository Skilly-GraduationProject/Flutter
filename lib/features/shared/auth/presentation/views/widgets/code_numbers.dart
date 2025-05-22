import 'package:flutter/material.dart';

class CodeNumbers extends StatelessWidget {
  const CodeNumbers(
      {super.key,
      required this.controller1,
      required this.controller2,
      required this.controller3,
      required this.controller4});

  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildBoxNumber(controller1),
        buildBoxNumber(controller2),
        buildBoxNumber(controller3),
        buildBoxNumber(controller4),
      ],
    );
  }

  Widget buildBoxNumber(TextEditingController controller) {
    return Container(
      width: 70,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xffF6F7F9),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
