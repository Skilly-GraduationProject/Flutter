import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/provider_service.dart/data/repos/provider_service.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_cubit.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/widgets/add_gallery_service_view_body.dart';


class AddGalleryServiceView extends StatelessWidget {
  const AddGalleryServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProviderServiceCubit(
          providerServiceRepo: getIt<ProviderServiceRepo>()),
      child: Scaffold(
        appBar: AppBar(
          primary: true,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "اضافه خدمه",
            style: TextStyleManager.style18BoldSec,
          ),
          centerTitle: true,
          leading: const BackIcon(),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: SafeArea(child: AddGalleryServiceViewBody()),
        ),
      ),
    );
  }
}
