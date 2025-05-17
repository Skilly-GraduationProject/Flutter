import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/get_my_gallery_model.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/get_my_services_model.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/get_reviews_model.dart';

class ProviderDataState {
  final CubitState? getMyServicesState;
  final GetMyServicesModel? getMyServicesModel;

  final CubitState? getMyGalleryState;
  final GetMyGalleryModel? getMyGalleryModel;

  final CubitState? getMyReviewsState;
  final GetReviewsModel? getMyReviewsModel;
  ProviderDataState({
    this.getMyServicesState,
    this.getMyServicesModel,
    this.getMyGalleryModel,
    this.getMyGalleryState,
    this.getMyReviewsModel,
    this.getMyReviewsState,
  });
  ProviderDataState editState({
    CubitState? getMyServicesState = CubitState.initial,
    GetMyServicesModel? getMyServicesModel,
    CubitState? getMyGalleryState = CubitState.initial,
    GetMyGalleryModel? getMyGalleryModel,
    CubitState? getMyReviewsState = CubitState.initial,
    GetReviewsModel? getMyReviewsModel,
  }) {
    return ProviderDataState(
      getMyServicesState: getMyServicesState ?? this.getMyServicesState,
      getMyServicesModel: getMyServicesModel ?? this.getMyServicesModel,
      getMyGalleryState: getMyGalleryState ?? this.getMyGalleryState,
      getMyGalleryModel: getMyGalleryModel ?? this.getMyGalleryModel,
      getMyReviewsState: getMyReviewsState ?? this.getMyReviewsState,
      getMyReviewsModel: getMyReviewsModel ?? this.getMyReviewsModel,
    );
  }
}
