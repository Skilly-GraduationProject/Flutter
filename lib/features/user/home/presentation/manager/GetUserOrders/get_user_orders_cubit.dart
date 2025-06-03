import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_user_orders_usecase.dart';
import 'get_user_orders_states.dart';

class GetUserOrdersCubit extends Cubit<GetUserOrdersStates> {
  GetUserOrdersCubit(this.getUserOrdersUseCase) : super(GetUserOrdersInitial());
  final GetUserOrdersUseCase getUserOrdersUseCase;

  Future<void> getUserOrders() async {
    emit(GetUserOrdersLoading());
    var result = await getUserOrdersUseCase.call();
    result.fold((failure) {
      emit(GetUserOrdersFailure(failure.errMessage));
    }, (orders) {
      if (orders.isEmpty) {
        emit(GetUserOrdersEmpty());
      } else {
        emit(GetUserOrdersSuccess(orders));
      }
    });
  }
}
