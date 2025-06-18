import '../../../domain/entities/service_providers_entity.dart';

sealed class GetCategoryServiceProvidersStates {}

final class GetCategoryServiceProvidersInitial
    extends GetCategoryServiceProvidersStates {}

final class GetCategoryServiceProvidersLoading
    extends GetCategoryServiceProvidersStates {}

final class GetCategoryServiceProvidersSuccess
    extends GetCategoryServiceProvidersStates {
  final List<ServiceProvidersEntity> providers;

  GetCategoryServiceProvidersSuccess(this.providers);
}

final class GetCategoryServiceProvidersFailure
    extends GetCategoryServiceProvidersStates {
  final String error;
  GetCategoryServiceProvidersFailure(this.error);
}
