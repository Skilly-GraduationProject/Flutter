import 'package:bloc/bloc.dart';
import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/usecases/start_payment_usecase.dart';
import 'start_payment_states.dart';


class StartPaymentCubit extends Cubit<StartPaymentStates> {
 StartPaymentCubit(this.startPaymentUseCase)
      : super(StartPaymentInitial());
  final StartPaymentUseCase startPaymentUseCase;

  Future<String?> startPayment(
    
    String serviceId,
  ) async {
    final token = await loadToken();
    var result = await startPaymentUseCase.call(
    token: token!,
      serviceId: serviceId,
    );
    return result.fold((failure) {
      emit(StartPaymentFailure(failure.errMessage));
      return null;
    }, (paymentUrl) {
      emit(StartPaymentSuccess(paymentUrl));
      return paymentUrl;
    });
  }
}
