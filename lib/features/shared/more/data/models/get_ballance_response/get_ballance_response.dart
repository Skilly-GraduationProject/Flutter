import 'result.dart';

class GetBallanceResponse {
  Result? result;

  GetBallanceResponse({this.result});

  factory GetBallanceResponse.fromJson(Map<String, dynamic> json) {
    return GetBallanceResponse(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result?.toJson(),
      };
}
