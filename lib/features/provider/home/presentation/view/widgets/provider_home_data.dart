import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_cubit.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProviderHomeData extends StatelessWidget {
  const ProviderHomeData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderHomeCubit, ProviderHomeCubitState>(
      bloc: context.read<ProviderHomeCubit>()..getProviderProfile(),
      builder: (context, state) {
        if (state.getProviderProfileState == CubitState.failure) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Skeletonizer(
            enabled: state.getProviderProfileState == CubitState.loading,
            child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(RouterPath.providerProfile, extra: state.providerProfile);
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(RouterPath.providerProfile);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: CustomImage(
                            image: state.providerProfile?.provider?.img ??
                                ImageManager.avatar,
                            width: context.responsiveWidth(50),
                            height: context.responsiveWidth(50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Text(
                          "اهلا, ${state.providerProfile?.provider!.firstName ?? "اسم المستخدم"}",
                          style: TextStyleManager.style18BoldSec,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 5),
                        child: Image.asset(
                          ImageManager.verifyIcon,
                          height: context.responsiveHeight(24),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    state.providerProfile?.provider!.profession ?? "",
                    style: TextStyleManager.style16RegSec,
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
