import 'package:flutter/material.dart';

class SortIcon extends StatelessWidget {
  const SortIcon({super.key, required this.onSelected});
  final void Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'nearest', child: Text('الاقرب لموقعك')),
        const PopupMenuItem(value: 'price-asc', child: Text('السعر من الأقل')),
        const PopupMenuItem(value: 'latest', child: Text('من الاحدث الي الاقدم')),
      ],
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12)),
        child: const Row(
          children: [
            Text('ترتيب حسب'),
            Icon(Icons.sort),
          ],
        ),
      ),
    );
  }
}
