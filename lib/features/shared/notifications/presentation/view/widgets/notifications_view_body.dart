import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/core/widgets/image/custom_image.dart';
import 'package:grad_project/features/shared/notifications/data/models/get_notifications_model/notification.dart';
import 'package:grad_project/features/shared/notifications/presentation/manager/cubit/notifications_cubit.dart';
import 'package:grad_project/features/shared/notifications/presentation/manager/cubit/notifications_state.dart';
import 'package:grad_project/features/shared/notifications/presentation/view/widgets/notification_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManager.primary,
      onRefresh: () async {
        context.read<NotificationsCubit>().getNotifications();
      },
      child: BlocBuilder<NotificationsCubit, NotificationsCubitStates>(
        buildWhen: (p, c) => p.getNotificationsState != c.getNotificationsState,
        bloc: context.read<NotificationsCubit>()..getNotifications(),
        builder: (context, state) {
          bool isLoading = state.getNotificationsState == CubitState.loading;
          List<NotificationModel>? notifications =
              state.getNotificationsModel?.notifications ?? [];
          return Skeletonizer(
            enabled: isLoading,
            ignorePointers: isLoading,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: isLoading == false && notifications.isEmpty
                  ? const Center(
                      child: CustomImage(image: ImageManager.emptyNotification),
                    )
                  : ListView.separated(
                      itemCount: isLoading ? 10 : notifications.length,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) => NotificationCard(
                              notificationModel:
                                  isLoading ? null : notifications[index])
                          .animate()
                          .slideX(delay: (index * 100).ms),
                      separatorBuilder: (context, index) => const Gap(15),
                    ),
            ),
          );
        },
      ),
    );
  }
}
