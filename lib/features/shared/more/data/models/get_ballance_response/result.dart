class Result {
  String? id;
  String? providerId;
  String? providerName;
  double? balance;

  Result({this.id, this.providerId, this.providerName, this.balance});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as String?,
        providerId: json['providerId'] as String?,
        providerName: json['providerName'] as String?,
        balance: json['balance'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'providerId': providerId,
        'providerName': providerName,
        'balance': balance,
      };
}
