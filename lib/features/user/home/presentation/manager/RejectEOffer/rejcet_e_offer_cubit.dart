import 'package:bloc/bloc.dart';
import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/usecases/reject_e_offer_usecase.dart';
import 'reject_e_offer_states.dart';


class RejectEOfferCubit extends Cubit<RejectEOfferStates> {
  RejectEOfferCubit(this.rejectEOfferUseCase) : super(RejectEOfferInitial());
  final RejectEOfferUseCase rejectEOfferUseCase;

  Future<void> rejectEOffer(
    String requestId,
        String providerId,

  ) async {
     final token = await loadToken();
    try {
      var result = await rejectEOfferUseCase.call(
        token: token!,
        requestId: requestId,
       providerId:providerId ,);

      print('RejectEOffer cubit success $result');
      emit(RejectEOfferSuccess());
    } catch (error) {
      print('RejectEOffer cubit fails');
      emit(RejectEOfferFailure(error.toString()));
    }
  }
}
