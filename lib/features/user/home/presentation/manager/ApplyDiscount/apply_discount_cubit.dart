import 'package:bloc/bloc.dart';
import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/entities/all_services_entity.dart';
import '../../../domain/usecases/apply_discount_usecase.dart';
import 'apply_discount_states.dart';

class ApplyDiscountCubit extends Cubit<ApplyDiscountStates> {
  ApplyDiscountCubit(this.applyDiscountUseCase) : super(ApplyDiscountInitial());
  final ApplyDiscountUseCase applyDiscountUseCase;

  Future<void> applyDiscount(
    String serviceId,
  AllServicesEntity service,
  ) async {
    final token = await loadToken();
  
  emit(ApplyDiscountLoading());

    var result = await applyDiscountUseCase.call(
      token: token!,
      serviceId: serviceId,
    );
    result.fold(
      (failure) {
        print('ApplyDiscount cubit fails: ${failure.errMessage}');
        emit(ApplyDiscountFailure(failure.errMessage));
      },
      (_) {
        print('ApplyDiscount cubit success');
        emit(ApplyDiscountSuccess(service));
      },
    );
  }
}
