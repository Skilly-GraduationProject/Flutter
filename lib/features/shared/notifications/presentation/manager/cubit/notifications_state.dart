import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/shared/notifications/data/models/get_notifications_model/get_notifications_model.dart';

class NotificationsCubitStates {
  final CubitState getNotificationsState;
  final GetNotificationsModel? getNotificationsModel;
  const NotificationsCubitStates({
    this.getNotificationsState = CubitState.initial,
    this.getNotificationsModel,
  });
  NotificationsCubitStates editState({
    CubitState? getNotificationsState,
    GetNotificationsModel? getNotificationsModel,
  }) {
    return NotificationsCubitStates(
      getNotificationsState:
          getNotificationsState ?? this.getNotificationsState,
      getNotificationsModel:
          getNotificationsModel ?? this.getNotificationsModel,
    );
  }
}
