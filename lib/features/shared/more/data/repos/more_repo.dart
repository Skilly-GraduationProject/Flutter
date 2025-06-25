import '../models/get_transactions_model/get_transactions_model.dart';
import '../models/get_transactions_model/tran.dart';
import '../models/get_ballance_response/get_ballance_response.dart';
import '../models/get_ballance_response/result.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/helper/service_locator.dart';

class MoreRepo {
  final ApiService apiService;

  MoreRepo({required this.apiService});

  Future<GetTransactionsModel> getTransactions() async {
    try {
      final response = await apiService
          .get('https://skilly.runasp.net/api/Payment/GetAllTransactions');
      return GetTransactionsModel.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<GetBallanceResponse> getBallance() async {
    try {
      final response = await apiService
          .get('https://skilly.runasp.net/api/Wallet/get-Balance');
      return GetBallanceResponse.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
