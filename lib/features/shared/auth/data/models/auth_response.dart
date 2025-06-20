class AuthResponse {
  final String token;
  final String? userType;

  AuthResponse({required this.token, this.userType});
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token']['result'],
      userType: json["userType"]
    );
  }
}
