import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
<<<<<<< HEAD
=======
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
>>>>>>> ccf576a11d3be5fc09907778e37fbc798702a4bf
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class MyServicesView extends StatelessWidget {
  const MyServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverAppBar(
                  pinned: true,
                  primary: true,
                  foregroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leading: const BackIcon(),
                  title: Text(
                    "خدماتي",
                    style: TextStyleManager.style20BoldSec,
                  ),
                  centerTitle: true,
                ),
              ),
              const SliverGap(20),
              SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.separated(
                  separatorBuilder: (context, index) => const Gap(10),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const MyServicesCard();
                  },
                ),
              ),
            ],
          )),
    );
  }
}
