import '../../data/models/auth_response.dart';

abstract class AuthRepo {
  Future<AuthResponse> login({required String password, required String phone,required bool remember});
  Future<void> register({required String firstName,required String secondName,required String email,required String password, required String phone,required int userType,});
  Future<void> forgetPass({required String email});
  Future<void> resetPass({required String pass,required String confirmPass,required String email});
Future<void> verify({required String code,required String email});
}