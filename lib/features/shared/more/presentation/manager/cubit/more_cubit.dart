import 'package:bloc/bloc.dart';
import 'package:grad_project/features/shared/more/presentation/manager/cubit/more_cubit_state.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/more_repo.dart';

class MoreCubitCubit extends Cubit<MoreCubitState> {
  final MoreRepo moreRepo;
  MoreCubitCubit(this.moreRepo) : super(MoreCubitState());

  Future<void> getTransactions() async {
    emit(TransactionsLoading());
    try {
      final result = await moreRepo.getTransactions();
      emit(TransactionsSuccess(result.trans ?? []));
    } catch (e) {
      emit(TransactionsError(e.toString()));
    }
  }

  Future<void> getBallance() async {
    emit(BallanceLoading());
    try {
      final result = await moreRepo.getBallance();
      emit(BallanceSuccess(result.result?.balance ?? 0));
    } catch (e) {
      emit(BallanceError(e.toString()));
    }
  }
}
