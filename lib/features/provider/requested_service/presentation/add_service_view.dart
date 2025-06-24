import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/add_service_view_body.dart';
import 'package:grad_project/features/user/home/presentation/manager/GetAllCategories/get_all_categories_cubit.dart';

import '../data/repo/service_repo.dart';
import 'manager/cubit/service_cubit.dart';

class AddServiceView extends StatelessWidget {
  const AddServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ServiceCubit(serviceRepo: getIt<ServiceRepo>()),
      child: BlocProvider(
        create: (BuildContext context) => getIt<GetAllCategoriesCubit>(),
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
            child: SafeArea(child: AddServiceViewBody()),
          ),
        ),
      ),
    );
  }
}
