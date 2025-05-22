import '../../data/models/auth_response.dart';

abstract class AuthRepo {
  Future<AuthResponse> login({required String password, required String phone,required bool remember});
  Future<void> register({required String firstName,required String secondName,required String email,required String password, required String phone,required int userType,});
  Future<void> forgetPass({required String email});
  Future<void> updatePass({required String pass,required String confirmPass,required String email});
Future<void> verifyEmail({required String code,required String email});
Future<void> verifyCode({required String code,required String email});
Future<void> addUserData(
  {required String govern,required String city,required String streetName,required int gender,required String image,});
Future<void> addProviderData({required String govern,required String city,required String streetName,required String age,required String yearsOfExp,required int gender,required String image,required String briefSummary,required String profession,});
}