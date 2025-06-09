import 'package:dio/dio.dart';

class ApiService {
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImM4Y2YxNzc2LTY3ZTAtNGNhOC05NGEzLTZhMWY1Yzk1MWIzYyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDEwMjk3NjI2MDQiLCJqdGkiOiI0YTIzNjE3ZC1iNTBmLTRkMzUtYTJlMS1lYmY1MjE5YWIxYTQiLCJleHAiOjE3NTAyNjEzMTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI3MSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.9tFNMpiTbKB3HXxwxXZzmftcXzYvBsf2G4IGhCbgOdQ";
  Dio dio = Dio(
    BaseOptions(headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      
    }),

  );

  Future<Response> post(String endPoint, dynamic data, {String? token}) async {
    var response = await dio.post(
      endPoint,
      data: data,
    );
    return response;
  }

  Future<Response> get(String endPoint, {String? token}) async {
    var response = await dio.get(
      endPoint,
    );
    print(response.data);
    return response;
  }

  Future<Response> delete(String endPoint, Map<String, dynamic>? data,
      {String? token, Map<String, dynamic>? params}) async {
    var response =
        await dio.delete(endPoint, data: data, queryParameters: params);
    return response;
  }

  Future<Response> put(
      {required String endPoint,
      dynamic data,
      String? token,
      Map<String, dynamic>? params}) async {
    var response = await dio.put(endPoint, data: data, queryParameters: params);
    return response;
  }
}
