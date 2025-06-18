import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      this.onSaved,
      this.validator,
      this.icon,
      this.controller,
      this.obsecure,
      this.onChanged,
      this.maxLines,
      this.validate,
      this.keyboardType,
        this.suffix
      });

  final String title;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? icon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? obsecure;
  final int? maxLines;
  final bool? validate;
  final TextInputType? keyboardType;
  final Widget? suffix;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: widget.controller,
        onTapOutside: (event) => focusNode.unfocus(),
        textDirection: TextDirection.rtl,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: widget.maxLines ?? 1,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,

        validator: (val) {
          if (val!.isEmpty && widget.validate != false) {
            return "This Field is required";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          suffixIcon: widget.suffix,
          prefixIcon: widget.icon,
          hintTextDirection: TextDirection.rtl,
          hintText: widget.title,
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
