import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_service_offers_usecase.dart';
import 'get_offers_states.dart';

class GetServiceOffersCubit extends Cubit<GetServiceOffersStates> {
  GetServiceOffersCubit(this.getServiceOffersUseCase)
      : super(GetServiceOffersInitial());
  final GetServiceOffersUseCase getServiceOffersUseCase;

  Future<void> getServiceOffers(String serviceId) async {
    emit(GetServiceOffersLoading());
    var result = await getServiceOffersUseCase.call(serviceId: serviceId);
    result.fold((failure) {
      emit(GetServiceOffersFailure(failure.errMessage));
    }, (offers) {
      if (offers.isEmpty) {
        emit(GetServiceOffersEmpty());
      } else {
        emit(GetServiceOffersSuccess(offers));
      }
    });
  }
}
