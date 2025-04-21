import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_all_categories_usecase.dart';
import 'get_all_categories_states.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesStates> {
  GetAllCategoriesCubit(this.getAllCategoriesUseCase)
      : super(GetAllCategoriesInitial());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  // Future<void> getAllCategories() async {
  //   emit(GetAllCategoriesLoading());
  //   try {
  //     await getAllCategoriesUseCase.call();
  //      print('get all categories cubit success');
  //     emit(GetAllCategoriesSuccess());
  //   } catch (e) {
  //      print('get all categories cubit fails $e');
  //     emit(GetAllCategoriesFailure(
  //       'Failed to get all categories:${e.toString()}'));
  //   }
  // }
 // List<CategoryEntity> categories = [];

  // Future<void> getAllCategories() async {
  //   emit(GetAllCategoriesLoading());
  //   final result = await getAllCategoriesUseCase.call();
  //   result.fold((failure) {
  //     emit(GetAllCategoriesFailure(failure.errMessage));
  //     print('get all categories cubit fails');
  //   }, (wishList) {
  //    // categories = wishList;
  //     emit(GetAllCategoriesSuccess(wishList));
  //      print('get all categories cubit success');
  //   });
  // }

   Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoading());
    var result = await getAllCategoriesUseCase.call();
    print('API response: $result');
    result.fold((failure) {
      print('cubit fail ${failure.errMessage}');
      emit(GetAllCategoriesFailure(failure.errMessage));
    }, (categories) {
      print('category $categories');
        emit(GetAllCategoriesSuccess(categories));
    });
  }
}
