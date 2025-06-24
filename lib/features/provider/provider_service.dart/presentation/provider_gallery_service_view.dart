import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/provider_service.dart/data/repos/provider_service.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/manager/cubit/provider_service_cubit.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/widgets/provider_gallery_service_view_body.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/widgets/provider_service_view_body.dart';

class ProviderGalleryServiceView extends StatelessWidget {
  const ProviderGalleryServiceView({super.key, required this.serviceId});
  final String serviceId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderServiceCubit(
          providerServiceRepo: getIt<ProviderServiceRepo>())
        ..getGalleryService(serviceId),
      child: Scaffold(
        appBar: AppBar(
          primary: true,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "تفاصيل الخدمه",
            style: TextStyleManager.style18BoldSec,
          ),
          centerTitle: true,
          leading: const BackIcon(),
        ),
        body: ProviderGalleryServiceViewBody(serviceId: serviceId),
      ),
    );
  }
}
