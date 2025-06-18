import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../constants.dart';
import '../../../../../core/errors/failure.dart';
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
    final token = response.data['token'] ?? '';
    await storeToken(token);
    return AuthResponse(token: token);
  }
    @override
  Future<void> loginWithGoogle({required String idToken})async {
     
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
        "userType": userType,
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
  Future<AuthResponse> verifyEmail(
      {required String code, required String email}) async {
    final response = await apiService.post('$baseUrl/Auth/verify-email', {
      'email': email,
      'code': code,
    });
    print(response);
    final token = response.data["token"] ?? '';
    await storeToken(token);
    return AuthResponse(token: token);
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

  @override
  Future<Either<Failure, void>> addProviderData({
    required String token,
    required String govern,
    required String city,
    required String categoryId,
    required String streetName,
    required int age,
    required int yearsOfExp,
    required int gender,
    required File image,
    required File pdf,
    required String briefSummary,
  }) async {
    final formData = FormData.fromMap({
      'Governorate': govern,
      'City': city,
      'StreetName': streetName,
      'Gender': gender,
      'Age': age,
      'categoryId': categoryId,
      'BriefSummary': briefSummary,
      'NumberOfYearExperience': yearsOfExp,
    });
    final mimeType = lookupMimeType(image.path)?.split('/') ?? ['image', 'png'];
    formData.files.add(
      MapEntry(
        'Img',
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType(mimeType[0], mimeType[1]),
        ),
      ),
    );
    final pdfMimeType =
        lookupMimeType(pdf.path)?.split('/') ?? ['application', 'pdf'];
    formData.files.add(
      MapEntry(
        'NationalNumberPDF',
        await MultipartFile.fromFile(
          pdf.path,
          filename: pdf.path.split('/').last,
          contentType: MediaType(pdfMimeType[0], pdfMimeType[1]),
        ),
      ),
    );
    final response = await apiService.post(
      '$baseUrl/Provider/addServiceProvider',
      formData,
      token: token,
    );
    print('add rpovider response ${response.data}');
    return response.data;
  }

  @override
  Future<Either<Failure, void>>addUserData(
      {required String govern,
      required String token,
      required String city,
      required String streetName,
      required int gender,
      required File image}) async {
        final formData = FormData.fromMap({
      'Governorate': govern,
      'City': city,
      'StreetName': streetName,
      'Gender': gender,
    });
        final mimeType = lookupMimeType(image.path)?.split('/') ?? ['image', 'png'];
    formData.files.add(
      MapEntry(
        'Img',
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType(mimeType[0], mimeType[1]),
        ),
      ),
    );
    final response = await apiService.post(
      '$baseUrl/UserProfile/userProfile/addUserProfile',
      token: token,
      formData,
    );
     print('add rpovider response ${response.data}');
    return response.data;
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefrence = await SharedPreferences.getInstance();
    await prefrence.setString('token', token);
    await prefrence.setBool('loggedIn', true);
  }

  Future<String?> loadToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getString('token');
  }
  

}
