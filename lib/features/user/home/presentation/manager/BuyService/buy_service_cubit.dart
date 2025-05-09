import 'package:bloc/bloc.dart';
import '../../../domain/usecases/buy_service_usecase.dart';
import 'but_service_states.dart';

class BuyServiceCubit extends Cubit<BuyServiceStates> {
  BuyServiceCubit(this.buyServiceUseCase) : super(BuyServiceInitial());
  final BuyServiceUseCase buyServiceUseCase;

  Future<void> buyService(
    String serviceId,
    String token,
    String startDate,
  ) async {
    emit(BuyServiceInitial());
    try {
      var result = await buyServiceUseCase.call(
          token: token, serviceId: serviceId, startDate: startDate);
      print('BuyService cubit success $result');
      emit(BuyServiceSuccess());
    } catch (error) {
      print('BuyServicecubit fails');
      emit(BuyServiceFailure(error.toString()));
    }
  }
}
