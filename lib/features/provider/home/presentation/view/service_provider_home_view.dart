import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/service_provider_view_body.dart';

class ServiceProviderHomeView extends StatelessWidget {
  const ServiceProviderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                RouterPath.notificationView,
              );
            },
            child: Image.asset(ImageManager.notificationIcon)),
      ),
      body: const SafeArea(child: ServiceProviderViewBody()),
    );
  }
}
