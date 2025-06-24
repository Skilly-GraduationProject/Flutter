import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/profile/data/models/get_services_in_progress/request_service.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/in_progress_service_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/my_services_card.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class InProgressServicesView extends StatelessWidget {
  const InProgressServicesView({super.key, required this.services});
  final List<RequestService> services;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            primary: true,
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: const BackIcon(),
            title: Text(
              "قيد التنفيذ",
              style: TextStyleManager.style20BoldSec,
            ),
            centerTitle: true,
          ),
          const SliverGap(20),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return InProgressServiceCard(
                  requestService: services[index],
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
