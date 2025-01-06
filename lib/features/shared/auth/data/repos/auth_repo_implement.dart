import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../core/helper/api_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/auth_response.dart';

class AuthRepoImplement implements AuthRepo {
  final ApiService apiService;
  AuthRepoImplement({required this.apiService});

  @override
  Future<AuthResponse> login(
      {required String phone,
      required String password,
      required bool remember}) async {
    final response = await apiService.post(
      '$baseUrl/Auth/Login',
      {
        'phoneNumber': phone,
        'password': password,
        'rememberMe': remember,
      },
    );
    print(response);
    final token = response.data['token']['result'] ?? '';
    await storeToken(token);
    return AuthResponse(token: token);
  }

  @override
  Future<void> register({
    required String firstName,
    required String secondName,
    required String email,
    required String password,
    required String phone,
    required int userType,
  }) async {
    final response = await apiService.post(
      '$baseUrl/Auth/Register',
      {
        "firstName": firstName,
        "lastName": secondName,
        "phoneNumber": phone,
        "email": email,
        "password": password,
        "userType": 0
      },
    );
    print('response ${response.data}');
    return response.data;
  }

  @override
  Future<void> forgetPass({required String email}) async {
    final response = await apiService.post(
      '$baseUrl/Auth/reset-password',
      {
        'email': email,
      },
    );
    print('response:${response.data}');
    return response.data;
  }

  @override
  Future<void> verifyEmail({required String code, required String email}) async {
    final response = await apiService.post('$baseUrl/Auth/verify-email', {
      'email': email,
      'code': code,
    });
    print('response ${response.data}');
    return response.data;
  }
  @override
  Future<void> verifyCode({required String code, required String email}) async {
    final response = await apiService.post('$baseUrl/Auth/verify-code', {
      'email': email,
      'code': code,
    });
    print('response ${response.data}');
    return response.data;
  }

  @override
  Future<void> updatePass(
      {required String pass,
      required String confirmPass,
      required String email}) async {
    final response = await apiService.post('$baseUrl/Auth/update-password', {
      'newPassword': pass,
      'confirmPassword': confirmPass,
      'email': email,
    });
    print('response ${response.data}');
    return response.data;
  }
}

Future<void> storeToken(String token) async {
  SharedPreferences prefrence = await SharedPreferences.getInstance();
  await prefrence.setString('token', token);
  await prefrence.setBool('loggedIn', true);
}
