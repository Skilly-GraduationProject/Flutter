import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/service/presentation/widgets/add_service_view_body.dart';
import 'package:grad_project/features/provider/service/presentation/widgets/get_service_view_body.dart';

class GetServiceView extends StatelessWidget {
  const GetServiceView({super.key});

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
          "الخدمه",
          style: TextStyleManager.style18BoldSec,
        ),
        centerTitle: true,
        leading: const BackIcon(),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: GetServiceViewBody(),
        ),
      ),
    );
  }
}
