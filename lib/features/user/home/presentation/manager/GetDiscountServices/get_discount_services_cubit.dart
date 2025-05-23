
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_discount_services_usecase.dart';
import 'get_discount_services_states.dart';

class GetDiscountServicesCubit extends Cubit<GetDiscountServicesStates> {
  GetDiscountServicesCubit(this.getDiscountServicesUseCase)
      : super(GetDiscountServicesInitial());
  final GetDiscountServicesUseCase getDiscountServicesUseCase;

   Future<void> getDiscountServices(String?sort) async {
    emit(GetDiscountServicesLoading());
    var result = await getDiscountServicesUseCase.call(sort);
    result.fold((failure) {
      emit(GetDiscountServicesFailure(failure.errMessage));
    }, (providers) {
        emit(GetDiscountServicesSuccess(providers));
    });
  }
}