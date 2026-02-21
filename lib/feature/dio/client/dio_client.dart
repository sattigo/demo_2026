import 'package:demo_2026/feature/dio/client/dio_result_failure_handler.dart';
import 'package:demo_2026/feature/dio/client/dio_result_response_handler.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient({
    required Dio dio,
    required DioResponseHandlerContract defaultResponseHandler,
    required DioFailureHandlerContract defaultFailureHandler,
  }) : _dio = dio,
       _defaultResponseHandler = defaultResponseHandler,
       _defaultFailureHandler = defaultFailureHandler;

  final Dio _dio;
  final DioResponseHandlerContract _defaultResponseHandler;
  final DioFailureHandlerContract _defaultFailureHandler;
}
