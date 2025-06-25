class Tran {
  String? id;
  double? amount;
  String? paymentStatus;
  String? paymentMethod;
  DateTime? createdAt;
  String? providerServiceId;
  String? providerId;
  String? providerName;
  dynamic requestServiceId;
  dynamic emergencyRequestId;
  String? paymobOrderId;
  dynamic transactionId;
  String? userId;
  String? userName;
  bool? isProcessed;
  String? providerserviceName;
  dynamic withdrawMethod;
  dynamic phoneNumber;
  dynamic instapayEmail;

  Tran({
    this.id,
    this.amount,
    this.paymentStatus,
    this.paymentMethod,
    this.createdAt,
    this.providerServiceId,
    this.providerId,
    this.providerName,
    this.requestServiceId,
    this.emergencyRequestId,
    this.paymobOrderId,
    this.transactionId,
    this.userId,
    this.userName,
    this.isProcessed,
    this.providerserviceName,
    this.withdrawMethod,
    this.phoneNumber,
    this.instapayEmail,
  });

  factory Tran.fromJson(Map<String, dynamic> json) => Tran(
        id: json['id'] as String?,
        amount: json['amount'] as double?,
        paymentStatus: json['paymentStatus'] as String?,
        paymentMethod: json['paymentMethod'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        providerServiceId: json['providerServiceId'] as String?,
        providerId: json['providerId'] as String?,
        providerName: json['providerName'] as String?,
        requestServiceId: json['requestServiceId'] as dynamic,
        emergencyRequestId: json['emergencyRequestId'] as dynamic,
        paymobOrderId: json['paymobOrderId'] as String?,
        transactionId: json['transactionId'] as dynamic,
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        isProcessed: json['isProcessed'] as bool?,
        providerserviceName: json['providerserviceName'] as String?,
        withdrawMethod: json['withdrawMethod'] as dynamic,
        phoneNumber: json['phoneNumber'] as dynamic,
        instapayEmail: json['instapayEmail'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'paymentStatus': paymentStatus,
        'paymentMethod': paymentMethod,
        'createdAt': createdAt?.toIso8601String(),
        'providerServiceId': providerServiceId,
        'providerId': providerId,
        'providerName': providerName,
        'requestServiceId': requestServiceId,
        'emergencyRequestId': emergencyRequestId,
        'paymobOrderId': paymobOrderId,
        'transactionId': transactionId,
        'userId': userId,
        'userName': userName,
        'isProcessed': isProcessed,
        'providerserviceName': providerserviceName,
        'withdrawMethod': withdrawMethod,
        'phoneNumber': phoneNumber,
        'instapayEmail': instapayEmail,
      };
}
