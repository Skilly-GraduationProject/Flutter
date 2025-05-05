import 'package:flutter/material.dart';

import '../../../../../../core/managers/color_manager.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: GestureDetector(
          onTap: () async {
            DateTime? selected = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2101),
            );

            if (selected != null && selected != DateTime.now()) {
              setState(() {
                selectedDate =
                    "${selected.year}-${selected.month}-${selected.day}";
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate ?? 'اختر تاريخ البدء',
                  style: TextStyle(
                      color: selectedDate == null ? Colors.grey : Colors.black),
                ),
                const Icon(
                  Icons.calendar_today,
                  color: ColorManager.primary,
                ),
              ],
            ),
          ),
        ));
  }
}
