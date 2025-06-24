import 'package:bloc/bloc.dart';
import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/usecases/accept_e_offer_usecase.dart';
import 'accept_e_offer_states.dart';

class AcceptEOfferCubit extends Cubit<AcceptEOfferStates> {
  AcceptEOfferCubit(this.acceptEOfferUseCase) : super(AcceptEOfferInitial());
  final AcceptEOfferUseCase acceptEOfferUseCase;

  Future<void> acceptEOffer(
    String requestId,
    String providerId,
  ) async {
    final token = await loadToken();
    try {
      var result = await acceptEOfferUseCase.call(
        token: token!,
        requestId: requestId,
        providerId: providerId,
      );

      print('AcceptEOffer cubit success $result');
      emit(AcceptEOfferSuccess());
    } catch (error) {
      print('AcceptEOffer cubit fails');
      emit(AcceptEOfferFailure(error.toString()));
    }
  }
}
