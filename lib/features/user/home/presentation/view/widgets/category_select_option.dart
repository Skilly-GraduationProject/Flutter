import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/color_manager.dart';

class CategorySelectOption extends StatefulWidget {
  final String firstTitle;
  final String secondTitle;
  final Widget firstWidget;
  final Widget secondWidget;

  const CategorySelectOption({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.firstWidget,
    required this.secondWidget,
  });

  @override
  State<CategorySelectOption> createState() => _CategorySelectOptionState();
}

class _CategorySelectOptionState extends State<CategorySelectOption> {
  late bool isFirstSelected;

  @override
  void initState() {
    super.initState();
    isFirstSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFirstSelected = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isFirstSelected
                        ? ColorManager.secondary
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      widget.firstTitle,
                      style: TextStyle(
                        color: isFirstSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFirstSelected = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: !isFirstSelected
                        ? ColorManager.secondary
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      widget.secondTitle,
                      style: TextStyle(
                        color: !isFirstSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        isFirstSelected ? widget.firstWidget : widget.secondWidget,
      ],
    );
  }
}
