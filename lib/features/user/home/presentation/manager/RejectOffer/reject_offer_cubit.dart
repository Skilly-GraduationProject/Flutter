import 'package:bloc/bloc.dart';
import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/usecases/reject_offer_usecase.dart';
import 'reject_offer_states.dart';

class RejectOfferCubit extends Cubit<RejectOfferStates> {
  RejectOfferCubit(this.rejectOfferUseCase) : super(RejectOfferInitial());
  final RejectOfferUseCase rejectOfferUseCase;

  Future<void> rejectOffer(
    String offerId,
  ) async {
    final token = await loadToken();
    try {
      var result = await rejectOfferUseCase.call(
        token: token!,
        offerId: offerId,
      );
      print('Reject Offer cubit success $result');
      emit(RejectOfferSuccess());
    } catch (error) {
      print('Reject Offer cubit fails');
      emit(RejectOfferFailure(error.toString()));
    }
  }
}
