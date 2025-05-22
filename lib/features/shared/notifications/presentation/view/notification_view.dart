import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/shared/notifications/presentation/view/widgets/notifications_view_body.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'الاشعارات',
          style: TextStyleManager.style18BoldSec,
        ),
        centerTitle: true,
        leading: const BackIcon(),
      ),
      body: const SafeArea(
          child: NotificationsViewBody()),
    );
  }
}
