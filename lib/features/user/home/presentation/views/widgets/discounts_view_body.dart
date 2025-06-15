import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../../../../../core/navigation/router_path.dart';
import '../../manager/GetUserProfileData/get_user_profile_data_cubit.dart';
import '../../manager/GetUserProfileData/get_user_profile_data_states.dart';
import 'discount_services_list_view.dart';
import 'points_info_container.dart';

class DiscountsViewBody extends StatefulWidget {
  const DiscountsViewBody({
    super.key,
  });

  @override
  State<DiscountsViewBody> createState() => _DiscountsViewBodyState();
}

class _DiscountsViewBodyState extends State<DiscountsViewBody> {
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

        return CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' اهلا ${data.name}',
                          style: TextStyleManager.style16BoldBlack,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const Gap(20),
                    PointsInfoContainer(
                      data: data,
                    ),
                    const Gap(20),
                  ]))),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اشتري الان',
                    style: TextStyleManager.style16BoldBlack,
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        RouterPath.discountServicesView,
                      );
                    },
                    child: const Row(
                      children: [
                        Text('عرض الكل'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const DiscountServicesListView()
        ]);
      } else if (state is GetUserProfileDataFailure) {
        return Text(state.error);
      } else {
        return const Text('unknown');
      }
    });
  }
}
