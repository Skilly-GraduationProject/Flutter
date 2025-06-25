import '../../../data/models/get_transactions_model/tran.dart';

class MoreCubitState {}

class TransactionsLoading extends MoreCubitState {}

class TransactionsSuccess extends MoreCubitState {
  final List<Tran> transactions;
  TransactionsSuccess(this.transactions);
}

class TransactionsError extends MoreCubitState {
  final String message;
  TransactionsError(this.message);
}

class BallanceLoading extends MoreCubitState {}

class BallanceSuccess extends MoreCubitState {
  final double balance;
  BallanceSuccess(this.balance);
}

class BallanceError extends MoreCubitState {
  final String message;
  BallanceError(this.message);
}
