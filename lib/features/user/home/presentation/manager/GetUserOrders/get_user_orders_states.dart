import '../../../domain/entities/user_orders_entity.dart';

sealed class GetUserOrdersStates {}

final class GetUserOrdersInitial extends GetUserOrdersStates {}

final class GetUserOrdersLoading extends GetUserOrdersStates {}

final class GetUserOrdersEmpty extends GetUserOrdersStates {}

final class GetUserOrdersSuccess extends GetUserOrdersStates {
  final List<UserOrdersEntity> orders;

  GetUserOrdersSuccess(this.orders);
}

final class GetUserOrdersFailure extends GetUserOrdersStates {
  final String error;
  GetUserOrdersFailure(this.error);
}
