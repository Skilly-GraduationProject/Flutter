import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/buttons/primary_button.dart';
import 'package:grad_project/core/widgets/custom_toast.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/core/widgets/show_custom_loading.dart';
import 'package:grad_project/features/provider/requested_service/data/repo/service_repo.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_cubit.dart';
import 'package:grad_project/features/provider/requested_service/presentation/manager/cubit/service_state.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/custom_toast.dart';
import 'package:grad_project/features/shared/notifications/data/models/get_notifications_model/notification.dart';
import 'package:grad_project/features/shared/notifications/presentation/manager/cubit/notifications_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notificationModel,
  });
  final NotificationModel? notificationModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (notificationModel?.title == "طلب خدمة جديد") {
          context.push(RouterPath.getServiceView,
              extra: notificationModel?.serviceId);
        } else if (notificationModel?.title == "تم شراء الخدمة") {
          context.push(RouterPath.providerServiceView,
              extra: notificationModel?.serviceId);
        } else if (notificationModel?.title == "عرض سعر جديد") {
          showDialog(
            context: context,
            builder: (context) => BlocProvider(
              create: (BuildContext context) =>
                  ServiceCubit(serviceRepo: getIt<ServiceRepo>())
                    ..getOffer(offerId: notificationModel!.serviceId!),
              child: Builder(builder: (context) {
                return BlocListener<ServiceCubit, ServiceCubitState>(
                  listener: (context, state) {
                    if (state.acceptOfferState == CubitState.success) {
                      Navigator.of(context).pop();
                      showCustomToast(
                        context: context,
                        message: "تم قبول العرض بنجاح",
                        type: ToastType.success,
                      );
                    } else if (state.rejectOfferState == CubitState.success) {
                      Navigator.of(context).pop();
                      showCustomToast(
                        context: context,
                        message: "تم رفض العرض ",
                        type: ToastType.success,
                      );
                    }
                  },
                  child: BlocBuilder<ServiceCubit, ServiceCubitState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Skeletonizer(
                            enabled: state.getOfferState == CubitState.loading,
                            child: Dialog(
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: context.responsiveWidth(20),
                                vertical: context.responsiveHeight(20),
                              ),
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  color: Colors.white,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: context.width,
                                          padding: const EdgeInsets.all(16),
                                          decoration: const BoxDecoration(
                                            color: ColorManager.primary,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "تفاصيل العرض",
                                              style: TextStyleManager
                                                  .style16BoldWhite,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            children: [
                                              const Gap(20),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: ColorManager
                                                                .primary),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 12,
                                                          vertical: 8),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "السعر",
                                                            style: TextStyleManager
                                                                .style12BoldSec,
                                                          ),
                                                          const Gap(4),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: BlocBuilder<
                                                                    ServiceCubit,
                                                                    ServiceCubitState>(
                                                                  builder:
                                                                      (context,
                                                                          state) {
                                                                    return Text(
                                                                      state.offerModel
                                                                              ?.salary
                                                                              .toString() ??
                                                                          "0",
                                                                      style: TextStyleManager
                                                                          .style12RegSec,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: Text(
                                                                  "ج.م",
                                                                  style: TextStyle(
                                                                      color: ColorManager
                                                                          .primary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Gap(20),
                                                  Flexible(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: ColorManager
                                                                .primary),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 12,
                                                          vertical: 8),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "مده التسليم",
                                                            style: TextStyleManager
                                                                .style12BoldSec,
                                                          ),
                                                          const Gap(4),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: BlocBuilder<
                                                                    ServiceCubit,
                                                                    ServiceCubitState>(
                                                                  builder:
                                                                      (context,
                                                                          state) {
                                                                    return Text(
                                                                      state.offerModel
                                                                              ?.deliverytime
                                                                              .toString() ??
                                                                          "0",
                                                                      style: TextStyleManager
                                                                          .style12RegSec,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: Text(
                                                                  "يوم",
                                                                  style: TextStyle(
                                                                      color: ColorManager
                                                                          .primary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Gap(20),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ColorManager.primary),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ملاحظات',
                                                      style: TextStyleManager
                                                          .style12BoldSec,
                                                    ),
                                                    const Gap(4),
                                                    BlocBuilder<ServiceCubit,
                                                        ServiceCubitState>(
                                                      builder:
                                                          (context, state) {
                                                        return Text(
                                                          state.offerModel
                                                                  ?.notes ??
                                                              "لا توجد ملاحظات",
                                                          style: TextStyleManager
                                                              .style12RegSec,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Gap(20),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: PrimaryButton(
                                                      text: "قبول",
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                ServiceCubit>()
                                                            .acceptOffer(
                                                              offerId:
                                                                  notificationModel!
                                                                      .serviceId!,
                                                            );
                                                      },
                                                    ),
                                                  ),
                                                  const Gap(10),
                                                  Flexible(
                                                    child: PrimaryButton(
                                                      text: "رفض",
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                ServiceCubit>()
                                                            .rejectOffer(
                                                              offerId:
                                                                  notificationModel!
                                                                      .serviceId!,
                                                            );
                                                      },
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Gap(20),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (state.acceptOfferState == CubitState.loading ||
                              state.rejectOfferState == CubitState.loading)
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                );
              }),
            ),
          );
        }
      },
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          context
              .read<NotificationsCubit>()
              .deleteNotification(notificationId: notificationModel!.id!);
          // إذا كنت تستخدم setState أو Bloc داخلي لتحديث القائمة:
          // context.read<NnotificationsCubit>().removeNotificationFromList(index);
        },
        background: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Text("حذف", style: TextStyleManager.style14BoldWhite),
        ),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [ShadowManager.cardShadow]),
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(children: [
                notificationModel?.userImg == null
                    ? const Gap(0)
                    : Column(
                        children: [
                          ClipOval(
                              child: CustomImage(
                            image: notificationModel?.userImg ?? "",
                            fit: BoxFit.cover,
                            height: context.responsiveHeight(70),
                            width: context.responsiveHeight(70),
                          )),
                          const Gap(12),
                        ],
                      ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notificationModel?.title ?? "",
                        style: TextStyleManager.style14BoldSec,
                      ),
                      Text(
                        notificationModel?.body ?? "",
                        style: TextStyleManager.style12RegSec,
                      )
                    ],
                  ),
                )
              ])
            ])),
      ),
    );
  }
}
