import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class CustomDio extends DioForNative {
  CustomDio() : super(BaseOptions(
    baseUrl: 'https://raw.githubusercontent.com/luizcmaciel/cinepop_app/main/lib',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 60),
  )) {
    interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }
}