import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_cubit.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_state.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/delete_account_button.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/logout_button.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/more_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoreProviderData extends StatelessWidget {
  const MoreProviderData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderHomeCubit, ProviderHomeCubitState>(
      buildWhen: (previous, current) =>
          previous.getProviderProfileState != current.getProviderProfileState ||
          previous.getProviderProfileState != CubitState.success,
      bloc: context.read<ProviderHomeCubit>()..getProviderProfile(),
      builder: (context, state) {
        if (state.getProviderProfileState == CubitState.failure) {
          return const Center(
            child: Text("failure"),
          );
        } else {
          return Skeletonizer(
            enabled: state.getProviderProfileState == CubitState.loading ||
                state.providerProfile == null,
            child: GestureDetector(
              onTap: () {
                if (state.providerProfile != null) {
                  GoRouter.of(context).push(RouterPath.providerProfile,
                      extra: state.providerProfile);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        spreadRadius: 1,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: CustomImage(
                        image: state.providerProfile?.provider?.img ??
                            ImageManager.avatar,
                        height: context.responsiveHeight(60),
                        width: context.responsiveHeight(60),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              state.providerProfile?.provider?.firstName ?? "",
                              style: TextStyleManager.style16RegSec,
                            ),
                            const Gap(5),
                            Image.asset(
                              ImageManager.verifyIcon,
                              height: context.responsiveHeight(20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(IconManager.rate),
                            const Gap(5),
                            Text(
                              "",
                              style: TextStyleManager.style14RegSec,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
