import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String? selectedValue;
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropDown({
    super.key,
    required this.selectedValue,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: selectedValue == null ? hint : null,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        filled: true,
        fillColor: const Color(0xffF6F7F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(Icons.keyboard_arrow_down),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      value: selectedValue,
      iconSize: 0,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      dropdownColor: Colors.white,
    );
  }
}
