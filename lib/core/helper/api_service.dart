import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);

  Future<Response> post(String endPoint, dynamic data, {String? token}) async {
  try {
    final bool isFormData = data is FormData;

    var response = await dio.post(
      endPoint,
      data: data,
      options: Options(
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
          if (isFormData) 'Content-Type': 'multipart/form-data',
        },
      ),
    );
    return response;
  } on DioException catch (e) {
    print('🔴 Dio Error: ${e.response?.data}');
    throw e;
  }

  }

 Future<Response> get(
  String endPoint, 
  {String? token,
  Map<String, dynamic>? queryParameters}) async {
    try {
      var response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> delete(String endPoint, Map<String, dynamic> data,
      {String? token}) async {
    var response = await dio.delete(endPoint,
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return response;
  }
}