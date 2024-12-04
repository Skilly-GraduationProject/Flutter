import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../../../core/helper/api_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/auth_response.dart';

class AuthRepoImplement implements AuthRepo {
  final ApiService apiService;
  AuthRepoImplement({required this.apiService});

  @override
  Future<AuthResponse> login(
      {required int phone,
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
    required int phone,
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
    print('${response.data}');
    return response.data;
  }

  @override
  Future<void> forgetPass({required String email}) async {
    final response = await apiService.post(
      '$baseUrl/Auth/reset-password',
      {
        'Email': email,
      },
    );
    print('response:${response.data}');
    return response.data;
  }

  @override
  Future<void> verify({required String code, required String email}) async {
    final response = await apiService.post('$baseUrl/Auth/verify-code', {
      'code': code,
      'email': email,
    });
    return response.data;
  }

  @override
  Future<void> resetPass(
      {required String pass,
      required String confirmPass,
      required String email}) async {
    final response = await apiService.post('$baseUrl/Auth/update-password', {
      'NewPassword': pass,
      'ConfirmPassword': confirmPass,
      'Email': email,
    });
    return response.data;
  }
}

Future<void> storeToken(String token) async {
  SharedPreferences prefrence = await SharedPreferences.getInstance();
  await prefrence.setString('token', token);
  await prefrence.setBool('loggedIn', true);
}
