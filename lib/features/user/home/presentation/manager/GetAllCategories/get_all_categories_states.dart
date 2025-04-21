import '../../../domain/entities/category_entitiy.dart';

sealed class GetAllCategoriesStates {}

final class GetAllCategoriesInitial extends GetAllCategoriesStates {}

final class GetAllCategoriesLoading extends GetAllCategoriesStates {}

final class GetAllCategoriesSuccess extends GetAllCategoriesStates {

    final CategoryEntity category;

  GetAllCategoriesSuccess(this.category);
}

final class GetAllCategoriesFailure extends GetAllCategoriesStates {
  final String error;
  GetAllCategoriesFailure(this.error);
}
