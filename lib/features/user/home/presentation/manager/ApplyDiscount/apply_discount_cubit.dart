import 'package:bloc/bloc.dart';
import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/usecases/apply_discount_usecase.dart';
import 'apply_discount_states.dart';

class ApplyDiscountCubit extends Cubit<ApplyDiscountStates> {
  ApplyDiscountCubit(this.applyDiscountUseCase) : super(ApplyDiscountInitial());
  final ApplyDiscountUseCase applyDiscountUseCase;

  Future<void> applyDiscount(
        String serviceId,

  ) async {
     final token = await loadToken();
    try {
      var result = await applyDiscountUseCase.call(
        token: token!,
        serviceId: serviceId,);
      print('ApplyDiscount cubit success $result');
      emit(ApplyDiscountSuccess());
    } catch (error) {
      print('ApplyDiscount cubit fails');
      emit(ApplyDiscountFailure(error.toString()));
    }
  }
}
