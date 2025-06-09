import 'package:bloc/bloc.dart';

import '../../../domain/usecases/get_category_services.dart';
import 'get_category_services_states.dart';

class GetCategoryServicesCubit extends Cubit<GetCategoryServicesStates> {
  GetCategoryServicesCubit(this.getCategoryServiceProvidersUseCase)
      : super(GetCategoryServicesInitial());
  final GetCategoryServicesUseCase getCategoryServiceProvidersUseCase;

  Future<void> getCategoryServices({required String categoryId}) async {
    emit(GetCategoryServicesLoading());
    var result = await getCategoryServiceProvidersUseCase.call(categoryId);
    result.fold((failure) {
      emit(GetCategoryServicesFailure(failure.errMessage));
    }, (providers) {
      emit(GetCategoryServicesSuccess(providers));
    });
  }
}
