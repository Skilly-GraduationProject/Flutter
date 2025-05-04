import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../manager/GetUserProfileData/get_user_profile_data_cubit.dart';
import '../../manager/GetUserProfileData/get_user_profile_data_states.dart';

class HomeUserAppBar extends StatefulWidget {
  const HomeUserAppBar({
    super.key,
  });

  @override
  State<HomeUserAppBar> createState() => _HomeUserAppBarState();
}

class _HomeUserAppBarState extends State<HomeUserAppBar> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserProfileDataCubit>(context).getUserProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileDataCubit, GetUserProfileDataStates>(
        builder: (context, state) {
      if (state is GetUserProfileDataLoading) {
        return const CustomLoadingIndicator();
      } else if (state is GetUserProfileDataSuccess) {
        final data = state.data;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/userProfile', extra: data);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.network(
                      data.img,
                      width: context.responsiveWidth(100),
                      height: context.responsiveWidth(100),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 10),
                  child: Text(
                    data.name,
                    style: TextStyleManager.style18BoldSec,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 5),
                  child: Image.asset(
                    ImageManager.verifyIcon,
                    height: context.responsiveHeight(24),
                  ),
                ),
              ],
            ),
            Image.asset(
              ImageManager.notificationIcon,
              width: 30,
              height: 30,
            )
          ],
        );
      } else if (state is GetUserProfileDataFailure) {
        return Text(state.error);
      } else {
        return const Text('unknown');
      }
    });
  }
}
