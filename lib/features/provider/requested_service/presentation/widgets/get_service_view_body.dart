import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/buttons/secondary_button.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_state.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/add_service_view_body.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/data_column.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/image_slider.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/send_offer_dialog.dart';
import "package:grad_project/features/provider/requested_service/presentation/widgets/data_row.dart";
import 'package:skeletonizer/skeletonizer.dart';

import '../manager/cubit/service_cubit.dart';

class GetServiceViewBody extends StatelessWidget {
  const GetServiceViewBody({
    super.key,
    required this.serviceId,
  });
  final String serviceId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceCubit, ServiceCubitState>(
      listener: (context, state) {
        if (state.acceptServiceState == CubitState.success) {
          // Handle success case
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم قبول الخدمة بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate back after success
          Navigator.of(context).pop();
        } else if (state.acceptServiceState == CubitState.failure) {
          // Handle error case
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.acceptServiceError ?? 'حدث خطأ ما'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<ServiceCubit, ServiceCubitState>(
        builder: (context, state) {
          RequestedService? service = state.getRequestedServiceModel;
          print("service name : ${state.getRequestedServiceModel?.name}");
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Skeletonizer(
                  enabled: state.getRequestedServiceState == CubitState.loading,
                  child: CustomScrollView(slivers: [
                    const SliverGap(20),
                    // service images slider
                    SliverToBoxAdapter(
                      child: ImageSlider(
                        images: service?.images ?? [],
                      ),
                    ),
                    const SliverGap(20),
                    // service data
                    SliverToBoxAdapter(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // service title
                            Text(
                              service?.name ?? "",
                              style: TextStyleManager.style20BoldSec,
                            ),
                            const Gap(15),
                            // service description
                            Text(
                              service?.notes ?? "",
                              style: TextStyleManager.style12RegSec,
                            ),
                          ]),
                    ),
                    const SliverGap(30),
                    // service data
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // service price
                          ServiceDataRow(
                            title: "سعر الخدمه",
                            value: "${service?.price} ج.م",
                          ),
                          const Gap(20),
                          // service delivery time
                          ServiceDataRow(
                            title: "مده التسليم",
                            value: "${service?.deliverytime} ايام",
                          ),
                          const Gap(20),
                          // service details
                          ServiceDataColumn(
                            title: 'ملاحظات',
                            value: service?.notes ?? "",
                          ),
                          const Gap(20),
                          // service video (if exists) (optional)
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "الفيديو",
                          //       style: TextStyleManager.style12BoldSec,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    const SliverGap(20),
                    // service options buttons
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          // // chat button
                          Expanded(
                              child: SecondaryButton(
                                  text: "قبول الخدمه",
                                  onTap: () {
                                    context
                                        .read<ServiceCubit>()
                                        .acceptService(requestId: serviceId);
                                  })),
                          const Gap(20),
                          // send offer button
                          Expanded(
                              child: PrimaryButton(
                                  text: "عرض سعر",
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      useSafeArea: false,
                                      builder: (context) {
                                        return SendOfferDialog(
                                          serviceId: serviceId,
                                        );
                                      },
                                    );
                                  })),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
              // Loading overlay
              if (state.acceptServiceState == CubitState.loading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
