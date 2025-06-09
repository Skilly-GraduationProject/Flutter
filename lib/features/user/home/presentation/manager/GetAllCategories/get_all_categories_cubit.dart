import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_all_categories_usecase.dart';
import 'get_all_categories_states.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesStates> {
  GetAllCategoriesCubit(this.getAllCategoriesUseCase)
      : super(GetAllCategoriesInitial());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoading());
    var result = await getAllCategoriesUseCase.call();
    result.fold((failure) {
      print('cubit fail ${failure.errMessage}');
      emit(GetAllCategoriesFailure(failure.errMessage));
    }, (categories) {
      print('category $categories');
      emit(GetAllCategoriesSuccess(categories));
    });
  }
}
