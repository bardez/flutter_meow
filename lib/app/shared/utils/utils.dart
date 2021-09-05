import 'package:dio/dio.dart';
import 'package:flutter_meow/app/shared/handlers/interceptors_handler.dart';


class Utils {

  static Dio dioInstance() {
    Dio _dio = Dio(BaseOptions(
        connectTimeout: 300 * 1000,
        receiveTimeout: 300 * 1000,
        sendTimeout: 300 * 1000));
    _dio.interceptors.add(InterceptorsHandler());
    _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        requestBody: false));
    return _dio;
  }
}