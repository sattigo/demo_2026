import 'package:core_dio/src/client/dio_failure.build.dart';
import 'package:core_dio/src/client/dio_result.dart';
import 'package:core_dio/src/client/dio_result_failure_handler.dart';
import 'package:core_dio/src/client/dio_result_response_handler.dart';
import 'package:core_dio/src/dio_client_request_data.build.dart';
import 'package:core_result/core_result.dart';
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

  Future<DioResult> _request(
    String path, {
    required String method,
    ResponseType? responseType,
    Map<String, dynamic>? queryParameters,
    DioClientRequestData? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    bool useAuthentication = true,
    Duration? sendTimeout,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.request<dynamic>(
        path,
        data: switch (data) {
          null => null,
          DioMapData(:final data) => data,
          DioFormData(:final data) => data,
        },
        queryParameters: queryParameters,
        options: Options(
          method: method,
          extra: extra,
          responseType: responseType,
          headers: headers,
          validateStatus: (status) => true,
          sendTimeout: sendTimeout,
        ),
        cancelToken: cancelToken,
      );
      return DioResult(
        result: Result.success(response),
        defaultFailureHandler: _defaultFailureHandler,
        defaultResponseHandler: _defaultResponseHandler,
      );
    } on Object catch (exception) {
      Result<Response<dynamic>, DioFailure> result;

      if (exception is DioException) {
        final dioFailure = exception.toDioFailure2();
        result = Result.failure(dioFailure);
      } else {
        result = const Result.failure(DioFailure.unknown());
      }

      return DioResult(
        result: result,
        defaultFailureHandler: _defaultFailureHandler,
        defaultResponseHandler: _defaultResponseHandler,
      );
    }
  }

  Future<DioResult> get(
    String path, {
    ResponseType? responseType,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    bool useAuthentication = true,
    CancelToken? cancelToken,
  }) {
    return _request(
      path,
      method: 'GET',
      responseType: responseType,
      queryParameters: queryParams,
      headers: headers,
      extra: extra,
      useAuthentication: useAuthentication,
      cancelToken: cancelToken,
    );
  }

  Future<DioResult> post(
    String path, {
    ResponseType? responseType,
    Map<String, dynamic>? queryParams,
    DioClientRequestData? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    bool useAuthentication = true,
    Duration? sendTimeout,
    CancelToken? cancelToken,
  }) {
    return _request(
      path,
      method: 'POST',
      responseType: responseType,
      data: data,
      queryParameters: queryParams,
      headers: headers,
      extra: extra,
      useAuthentication: useAuthentication,
      sendTimeout: sendTimeout,
      cancelToken: cancelToken,
    );
  }

  Future<DioResult> put(
    String path, {
    ResponseType? responseType,
    Map<String, dynamic>? queryParams,
    DioClientRequestData? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    bool useAuthentication = true,
    CancelToken? cancelToken,
  }) {
    return _request(
      path,
      method: 'PUT',
      data: data,
      responseType: responseType,
      queryParameters: queryParams,
      headers: headers,
      extra: extra,
      useAuthentication: useAuthentication,
      cancelToken: cancelToken,
    );
  }

  Future<DioResult> patch(
    String path, {
    ResponseType? responseType,
    Map<String, dynamic>? queryParams,
    DioClientRequestData? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    bool useAuthentication = true,
    CancelToken? cancelToken,
  }) {
    return _request(
      path,
      method: 'PATCH',
      responseType: responseType,
      data: data,
      queryParameters: queryParams,
      headers: headers,
      extra: extra,
      useAuthentication: useAuthentication,
      cancelToken: cancelToken,
    );
  }

  Future<DioResult> delete(
    String path, {
    ResponseType? responseType,
    Map<String, dynamic>? queryParams,
    DioClientRequestData? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    bool useAuthentication = true,
    CancelToken? cancelToken,
  }) {
    return _request(
      path,
      method: 'DELETE',
      data: data,
      responseType: responseType,
      queryParameters: queryParams,
      headers: headers,
      extra: extra,
      useAuthentication: useAuthentication,
      cancelToken: cancelToken,
    );
  }
}

extension DioErrorMapper on DioException {
  DioFailure toDioFailure2() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return DioFailure.connectTimeout(response: response);
      case DioExceptionType.sendTimeout:
        return DioFailure.sendTimeout(response: response);
      case DioExceptionType.receiveTimeout:
        return DioFailure.receiveTimeout(response: response);
      case DioExceptionType.badResponse:
        return DioFailure.badResponse(response: response);
      case DioExceptionType.cancel:
        return DioFailure.cancel(response: response);
      case DioExceptionType.unknown:
        return DioFailure.unknown(response: response);
      case DioExceptionType.badCertificate:
        return DioFailure.badCertificate(response: response);
      case DioExceptionType.connectionError:
        return DioFailure.connectionError(response: response);
    }
  }
}
