
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_category_service_providers_usecase.dart';
import 'get_category_service_providers_states.dart';

class GetCategoryServiceProvidersCubit extends Cubit<GetCategoryServiceProvidersStates> {
  GetCategoryServiceProvidersCubit(this.getCategoryServiceProvidersUseCase)
      : super(GetCategoryServiceProvidersInitial());
  final GetCategoryServiceProvidersUseCase getCategoryServiceProvidersUseCase;

   Future<void> getCategoryServiceProviders({required String categoryId}) async {
    emit(GetCategoryServiceProvidersLoading());
    var result = await getCategoryServiceProvidersUseCase.call(categoryId);
    result.fold((failure) {
      emit(GetCategoryServiceProvidersFailure(failure.errMessage));
    }, (providers) {
        emit(GetCategoryServiceProvidersSuccess(providers));
    });
  }
}
