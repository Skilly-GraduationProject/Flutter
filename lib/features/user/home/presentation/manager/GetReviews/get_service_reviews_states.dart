
import '../../../domain/entities/service_reviews_entity.dart';


sealed class GetServiceReviewsStates {}

final class GetServiceReviewsInitial extends GetServiceReviewsStates {}

final class GetServiceReviewsLoading extends GetServiceReviewsStates {}

final class GetServiceReviewsEmpty extends GetServiceReviewsStates {}

final class GetServiceReviewsSuccess extends GetServiceReviewsStates {

    final List<ServiceReviewsEntity> reviews;

  GetServiceReviewsSuccess(this.reviews);
}

final class GetServiceReviewsFailure extends GetServiceReviewsStates {
  final String error;
  GetServiceReviewsFailure(this.error);
}
