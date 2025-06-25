import 'tran.dart';

class GetTransactionsModel {
  List<Tran>? trans;

  GetTransactionsModel({this.trans});

  factory GetTransactionsModel.fromJson(Map<String, dynamic> json) {
    return GetTransactionsModel(
      trans: (json['trans'] as List<dynamic>?)
          ?.map((e) => Tran.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'trans': trans?.map((e) => e.toJson()).toList(),
      };
}
