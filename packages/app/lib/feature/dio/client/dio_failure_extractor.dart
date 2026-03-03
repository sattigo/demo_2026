import 'package:core_failure/core_failure.dart';
import 'package:dio/dio.dart';

abstract class FailureExtractorContract {
  Failure? extract(Response<dynamic> response);
}
