
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/custom_toast.dart';
import 'package:grad_project/core/widgets/show_custom_loading.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/repos/provider_data_repo.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_cubit.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_state.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/edit_profile_view_body.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.providerProfileModel});
  final ProviderProfileModel providerProfileModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderDataCubit(repo: getIt<ProviderDataRepo>()),
      child: BlocListener<ProviderDataCubit, ProviderDataState>(
        listener: (context, state) {
          if (state.editProfileState == CubitState.loading) {
            showCustomLoading(context);
          } else if (state.editProfileState == CubitState.success) {
            context.pop();
            context.pop();
            context.pop();
            showCustomToast(
                context: context,
                message: "تم تعديل البيانات بنجاح",
                type: ToastType.success);
          } else if (state.editProfileState == CubitState.failure) {
            context.pop();
            showCustomToast(
                context: context,
                message: "فشلت عمليه التحديث",
                type: ToastType.failure);
          }
        },
        child: Scaffold(
          appBar: AppBar(
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const BackIcon(),
             
              title: Text(
                "تعديل البيانات",
                style: TextStyleManager.style18BoldSec,
              ),
              centerTitle: true,
            ),
          
          body: EditProfileViewBody(providerProfileModel: providerProfileModel),
        ),
      ),
    );
  }
}
