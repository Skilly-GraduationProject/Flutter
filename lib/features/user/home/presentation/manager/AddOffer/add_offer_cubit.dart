import 'package:bloc/bloc.dart';
import '../../../domain/usecases/add_offer_usecase.dart';
import 'add_offer_states.dart';

class AddOfferCubit extends Cubit<AddOfferStates> {
  AddOfferCubit(this.addOfferUseCase) : super(AddOfferInitial());
  final AddOfferUseCase addOfferUseCase;

  Future<void> addOffer(
        String serviceId,
    String token,
        double price,

    String duration,
        String notes,

  ) async {
    emit(AddOfferInitial());
    try {
      var result = await addOfferUseCase.call(
        token:token ,
          duration: duration, serviceId: serviceId, notes: notes, price: price,);
      print('AddOffer cubit success $result');
      emit(AddOfferSuccess());
    } catch (error) {
      print('AddOffer cubit fails');
      emit(AddOfferFailure(error.toString()));
    }
  }
}
