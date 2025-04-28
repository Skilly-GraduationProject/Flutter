import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/features/shared/notifications/presentation/view/widgets/notification_card.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        itemCount: 10,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) =>
            const NotificationCard().animate().slideX(delay: (index * 100).ms),
        separatorBuilder: (context, index) => const Gap(15),
      ),
    );
  }
}
