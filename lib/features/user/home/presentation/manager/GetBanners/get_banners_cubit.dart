import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_banners_usecase.dart';
import 'get_banners_states.dart';

class GetBannersCubit extends Cubit<GetBannersStates> {
  GetBannersCubit(this.getBannersUseCase) : super(GetBannersInitial());
  final GetBannersUseCase getBannersUseCase;

  Future<void> getBanners() async {
    emit(GetBannersLoading());
    var result = await getBannersUseCase.call();
    result.fold((failure) {
      emit(GetBannersFailure(failure.errMessage));
    }, (providers) {
      emit(GetBannersSuccess(providers));
    });
  }
}
