import 'package:flutter/material.dart';
import 'package:grad_project/core/extensions/context_extension.dart';

import '../../../../../../core/managers/image_manager.dart';

class ProvidersListView extends StatelessWidget {
  const ProvidersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF6F7F9),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                ImageManager.avatar,
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "احمد خالد",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      ImageManager.verifyIcon,
                      height: context.responsiveHeight(24),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 3),
                    Text(
                      "5.0",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
