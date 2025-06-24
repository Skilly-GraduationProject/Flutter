import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/models/edit_profile_model.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/get_my_gallery_model.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/get_my_services_model.dart';
import 'package:grad_project/features/provider/profile/data/models/get_services_in_progress/get_services_in_progress.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/get_reviews_model.dart';

class ProviderDataState {
  CubitState? getProviderProfileState;
  ProviderProfileModel? providerProfile;
  final CubitState? getMyServicesState;
  final GetMyServicesModel? getMyServicesModel;

  final CubitState? getServicesInProgressState;
  final GetServicesInProgress? getServicesInProgressModel;

  final CubitState? getMyGalleryState;
  final GetMyGalleryModel? getMyGalleryModel;

  final CubitState? getMyReviewsState;
  final GetReviewsModel? getMyReviewsModel;

  final CubitState? editProfileState;
  final EditProfileModel? editProfileModel;
  ProviderDataState({
    this.getProviderProfileState = CubitState.initial,
    this.providerProfile,
    this.getMyServicesState,
    this.getMyServicesModel,
    this.getServicesInProgressState,
    this.getServicesInProgressModel,
    this.getMyGalleryModel,
    this.getMyGalleryState,
    this.getMyReviewsModel,
    this.getMyReviewsState,
    this.editProfileState,
    this.editProfileModel,
  });
  ProviderDataState editState({
    CubitState? getProviderProfileState,
    ProviderProfileModel? providerProfile,
    CubitState? getMyServicesState = CubitState.initial,
    GetMyServicesModel? getMyServicesModel,
    CubitState? getServicesInProgressState = CubitState.initial,
    GetServicesInProgress? getServicesInProgressModel,
    CubitState? getMyGalleryState = CubitState.initial,
    GetMyGalleryModel? getMyGalleryModel,
    CubitState? getMyReviewsState = CubitState.initial,
    GetReviewsModel? getMyReviewsModel,
    CubitState? editProfileState = CubitState.initial,
    EditProfileModel? editProfileModel,
  }) {
    return ProviderDataState(
      getProviderProfileState:
          getProviderProfileState ?? this.getProviderProfileState,
      providerProfile: providerProfile ?? this.providerProfile,
      getMyServicesState: getMyServicesState ?? this.getMyServicesState,
      getMyServicesModel: getMyServicesModel ?? this.getMyServicesModel,
      getServicesInProgressState:
          getServicesInProgressState ?? this.getServicesInProgressState,
      getServicesInProgressModel:
          getServicesInProgressModel ?? this.getServicesInProgressModel,
      getMyGalleryState: getMyGalleryState ?? this.getMyGalleryState,
      getMyGalleryModel: getMyGalleryModel ?? this.getMyGalleryModel,
      getMyReviewsState: getMyReviewsState ?? this.getMyReviewsState,
      getMyReviewsModel: getMyReviewsModel ?? this.getMyReviewsModel,
      editProfileState: editProfileState ?? this.editProfileState,
      editProfileModel: editProfileModel ?? this.editProfileModel,
    );
  }
}
