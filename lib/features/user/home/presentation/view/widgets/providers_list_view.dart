import 'package:flutter/material.dart';
import '../../../../../../core/managers/image_manager.dart';
import 'rate_widget.dart';
import 'verified_name.dart';

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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerifiedName(),
                RateWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
