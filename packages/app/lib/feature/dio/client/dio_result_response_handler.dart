import 'package:core_failure/core_failure.dart';
import 'package:demo_2026/feature/result/result.build.dart';
import 'package:dio/dio.dart';

abstract class DioResponseHandlerContract {
  /// Failure extractor - for special failure handling. Backend/mobile contract required
  DioResponseHandlerContract(/*{required this.failureExtractor}*/);

  //final FailureExtractorContract failureExtractor;

  Result<T, Failure> call<T>(Response<dynamic> response);
}

class DefaultDioResponseHandler extends DioResponseHandlerContract {
  DefaultDioResponseHandler(/*{required super.failureExtractor}*/);

  Result<T, Failure> call<T>(Response<dynamic> response) {
    //final failure = failureExtractor.extract(response) ?? const Failure.general();
    return Result.failure(const Failure.general());
  }
}
