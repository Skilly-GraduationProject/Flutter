
import '../../../domain/entities/get_banners_entitiy.dart';



sealed class GetBannersStates {}

final class GetBannersInitial extends GetBannersStates {}

final class GetBannersLoading extends GetBannersStates {}

final class GetBannersSuccess extends GetBannersStates {

    final List<GetBannersEntity> banners;

  GetBannersSuccess(this.banners);
}

final class GetBannersFailure extends GetBannersStates {
  final String error;
  GetBannersFailure(this.error);
}
