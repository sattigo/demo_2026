import 'package:demo_2026/feature/dio/client/dio_failure_extractor.dart';
import 'package:demo_2026/feature/failure/failure.build.dart';
import 'package:demo_2026/feature/result/result.build.dart';
import 'package:dio/dio.dart';

abstract class DioResponseHandlerContract {
  DioResponseHandlerContract({required this.failureExtractor});

  final FailureExtractorContract failureExtractor;

  Result<T, Failure> call<T>(Response<dynamic> response);
}

class DefaultDioResponseHandler extends DioResponseHandlerContract {
  DefaultDioResponseHandler({required super.failureExtractor});

  Result<T, Failure> call<T>(Response<dynamic> response) {
    final failure = failureExtractor.extract(response) ?? const Failure.general();
    return Result.failure(failure);
  }
}
