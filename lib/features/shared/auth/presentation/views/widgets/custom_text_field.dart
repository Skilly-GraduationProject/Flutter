import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.onSaved,
      this.validator,
      this.icon,
      this.controller,
      this.obsecure,
      this.onChanged,this.maxLines});

  final String title;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? icon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? obsecure;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines?? 1,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: (val) {
          if (val?.isEmpty ?? true) {
            return "This Field is required";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          
          prefixIcon: icon,
          hintTextDirection: TextDirection.rtl,
          hintText: title,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: const Color(0xffF6F7F9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
