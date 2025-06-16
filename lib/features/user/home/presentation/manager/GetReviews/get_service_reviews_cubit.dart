import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_service_reviews_usecase.dart';
import 'get_service_reviews_states.dart';

class GetServiceReviewsCubit extends Cubit<GetServiceReviewsStates> {
  GetServiceReviewsCubit(this.getServiceReviewsUseCase)
      : super(GetServiceReviewsInitial());
  final GetServiceReviewsUseCase getServiceReviewsUseCase;

  Future<void> getServiceReviews(String serviceId) async {
    emit(GetServiceReviewsLoading());
    var result = await getServiceReviewsUseCase.call(serviceId: serviceId);
    result.fold((failure) {
      emit(GetServiceReviewsFailure(failure.errMessage));
    }, (reviews) {
      if (reviews.isEmpty) {
        emit(GetServiceReviewsEmpty());
      } else {
        emit(GetServiceReviewsSuccess(reviews));
      }
    });
  }
}
