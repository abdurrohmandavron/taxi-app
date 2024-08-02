import 'package:dio/dio.dart';

class ApiService {
  final _dio = Dio();

  Future<Response> getRequest(String url) async => await _dio.get(url);
  Future<Response> putRequest(String url) async => await _dio.put(url);
  Future<Response> postRequest(String url) async => await _dio.post(url);
  Future<Response> deleteRequest(String url) async => await _dio.delete(url);
}
