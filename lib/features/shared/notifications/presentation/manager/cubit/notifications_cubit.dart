import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/shared/notifications/data/repo/notifications_repo.dart';
import 'package:grad_project/features/shared/notifications/presentation/manager/cubit/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsCubitStates> {
  NotificationsCubit({required this.notificationsRepo})
      : super(const NotificationsCubitStates());
  final NotificationsRepo notificationsRepo;
  Future<void> getNotifications() async {
    emit(state.editState(getNotificationsState: CubitState.loading));
    var response = await notificationsRepo.getNotifications();
    response.fold((l) {
      emit(state.editState(getNotificationsState: CubitState.failure));
    }, (r) {
      emit(state.editState(
          getNotificationsState: CubitState.success, getNotificationsModel: r));
    });
  }

  Future<void> deleteNotification({required String notificationId}) async {
    var response = await notificationsRepo.deleteNotification(
        notificationId: notificationId);
    response.fold((l) {}, (r) {});
  }
}
