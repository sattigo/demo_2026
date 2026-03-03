import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:demo_2026/feature/dio/client/default_dio_failure_exception.dart';
import 'package:demo_2026/feature/dio/client/dio_failure.build.dart';
import 'package:demo_2026/feature/dio/client/dio_result_failure_handler.dart';
import 'package:demo_2026/feature/dio/client/dio_result_response_handler.dart';
import 'package:dio/dio.dart';

part 'dio_status_code_constans.dart';

class DioResult {
  DioResult({
    required Result<Response<dynamic>, DioFailure> result,
    required DioResponseHandlerContract defaultResponseHandler,
    required DioFailureHandlerContract defaultFailureHandler,
  }) : _defaultResponseHandler = defaultResponseHandler,
       _defaultFailureHandler = defaultFailureHandler,
       _result = result;

  static void Function() invalidStatusCodeHandler = _defaultInvalidStatusCodeHandler;

  static void _defaultInvalidStatusCodeHandler() {
    try {
      throw UnimplementedError('Wrong "onStatusCodes" into $DioResult.when() function');
    } on Object catch (exception, stackTrace) {
      throw DefaultDioFailureException('$exception\n$stackTrace');
    }
  }

  final Result<Response<dynamic>, DioFailure> _result;
  final DioResponseHandlerContract _defaultResponseHandler;
  final DioFailureHandlerContract _defaultFailureHandler;

  Result<T, Failure> when<T>({
    Map<dynamic, Result<T, Failure> Function(Response<dynamic> response)>? onStatusCodes,
    Result<T, Failure> Function(int statusCode, Response<dynamic> response)? defaultStatusCodeHandler,
    Failure? Function(DioFailure failure)? onFailure,
    Failure Function(DioFailure failure)? defaultFailureHandler,
  }) {
    final value = switch (_result) {
      Success<Response, DioFailure>(:final data) => _onSuccess<T>(
        data: data,
        onStatusCodes: onStatusCodes,
        defaultFailureHandler: defaultFailureHandler,
        defaultStatusCodeHandler: defaultStatusCodeHandler,
        onFailure: onFailure,
      ),
      Error<Response, DioFailure>(:final error) => _onFailure<T>(
        error: error,
        onFailure: onFailure,
        defaultFailureHandler: defaultFailureHandler,
      ),
    };

    return value;
  }

  Result<T, Failure> _onSuccess<T>({
    required Response<dynamic> data,
    Map<dynamic, Result<T, Failure> Function(Response<dynamic> response)>? onStatusCodes,
    Result<T, Failure> Function(int statusCode, Response<dynamic> response)? defaultStatusCodeHandler,
    Failure? Function(DioFailure failure)? onFailure,
    Failure Function(DioFailure failure)? defaultFailureHandler,
  }) {
    final responseStatusCode = data.statusCode;
    if (responseStatusCode == null) {
      final dioFailure = DioFailure.badResponse(response: data);
      final resultFailure =
          onFailure?.call(dioFailure) ??
          defaultFailureHandler?.call(dioFailure) ??
          _defaultFailureHandler.call(dioFailure);
      return Result<T, Failure>.failure(resultFailure);
    }

    if (onStatusCodes == null || onStatusCodes.isEmpty) {
      return defaultStatusCodeHandler?.call(responseStatusCode, data) ?? _defaultResponseHandler.call(data);
    }

    final statusCodes = onStatusCodes.keys;
    for (final caseStatusCode in statusCodes) {
      if (caseStatusCode is int) {
        if (responseStatusCode == caseStatusCode) {
          return onStatusCodes[caseStatusCode]!.call(data);
        }
      } else if (caseStatusCode is List<int>) {
        if (caseStatusCode.contains(responseStatusCode)) {
          return onStatusCodes[caseStatusCode]!.call(data);
        }
      } else if (caseStatusCode is Map<int, int>) {
        for (final entry in caseStatusCode.entries) {
          final range = _Range(low: entry.key, high: entry.value);
          if (range.contains(responseStatusCode)) {
            return onStatusCodes[caseStatusCode]!.call(data);
          }
        }
      } else {
        invalidStatusCodeHandler.call();
      }
    }

    return defaultStatusCodeHandler?.call(responseStatusCode, data) ?? _defaultResponseHandler.call(data);
  }

  Result<T, Failure> _onFailure<T>({
    required DioFailure error,
    Failure? Function(DioFailure failure)? onFailure,
    Failure Function(DioFailure failure)? defaultFailureHandler,
  }) {
    final resultFailure =
        onFailure?.call(error) ?? defaultFailureHandler?.call(error) ?? _defaultFailureHandler.call(error);
    return Result<T, Failure>.failure(resultFailure);
  }
}

class _Range {
  const _Range({required this.low, required this.high});

  final int low;
  final int high;

  bool contains(int value) {
    return value >= low && value <= high;
  }
}
