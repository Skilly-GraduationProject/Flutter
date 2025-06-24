import 'package:bloc/bloc.dart';
import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/usecases/accept_offer_usecase.dart';
import 'accept_offer_states.dart';

class AcceptOfferCubit extends Cubit<AcceptOfferStates> {
  AcceptOfferCubit(this.acceptOfferUseCase) : super(AcceptOfferInitial());
  final AcceptOfferUseCase acceptOfferUseCase;

  Future<void> acceptOffer(
    String offerId,
  ) async {
    final token = await loadToken();
    try {
      var result = await acceptOfferUseCase.call(
        token: token!,
        offerId: offerId,
      );
      print('AcceptOffer cubit success $result');
      emit(AcceptOfferSuccess());
    } catch (error) {
      print('AcceptOffer cubit fails');
      emit(AcceptOfferFailure(error.toString()));
    }
  }
}
