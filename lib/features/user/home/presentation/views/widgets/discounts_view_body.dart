import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../../../../../core/navigation/router_path.dart';
import '../../manager/ApplyDiscount/apply_discount_cubit.dart';
import '../../manager/ApplyDiscount/apply_discount_states.dart';
import '../../manager/GetUserProfileData/get_user_profile_data_cubit.dart';
import '../../manager/GetUserProfileData/get_user_profile_data_states.dart';
import 'buy_service_sheet.dart';
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
    return BlocListener<ApplyDiscountCubit, ApplyDiscountStates>(
        listener: (context, state) {
      if (state is ApplyDiscountSuccess) {
        final service = state.service;
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          isScrollControlled: true,
          builder: (_) => BuyServiceSheet(
            service: service,
            useDiscount: true,
          ),
        );
      } else if (state is ApplyDiscountFailure) {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 10,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red.shade700,
                    size: 60,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'عذرا',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'ليس لديك نقاط كافية لاستخدام الخصم.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                      child: const Text(
                        'حسناً',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }, child: BlocBuilder<GetUserProfileDataCubit, GetUserProfileDataStates>(
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
    }));
  }
}
