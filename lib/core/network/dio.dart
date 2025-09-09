import 'package:dio/dio.dart';
import 'package:nwhco_app/core/network/app_interceptor.dart';

class DioNet {
  static final Dio instance = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 100000),
    receiveTimeout: const Duration(milliseconds: 300000),
    contentType: Headers.jsonContentType,
    receiveDataWhenStatusError: true,
  ))
    ..interceptors.add(AppInterceptor());
}
