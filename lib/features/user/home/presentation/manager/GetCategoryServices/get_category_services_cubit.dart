import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_category_services.dart';
import 'get_category_services_states.dart';

class GetCategoryServicesCubit extends Cubit<GetCategoryServicesStates> {
  GetCategoryServicesCubit(this.getCategoryServiceProvidersUseCase)
      : super(GetCategoryServicesInitial());
  final GetCategoryServicesUseCase getCategoryServiceProvidersUseCase;

  Future<void> getCategoryServices(
      {required String categoryId, String? sort}) async {
    emit(GetCategoryServicesLoading());
    final params = GetCategoryServicesParams(
      categoryId: categoryId,
      sort: sort,
    );

    var result = await getCategoryServiceProvidersUseCase.call(params);
    result.fold((failure) {
      emit(GetCategoryServicesFailure(failure.errMessage));
    }, (services) {
      emit(GetCategoryServicesSuccess(services));
    });
  }
}
