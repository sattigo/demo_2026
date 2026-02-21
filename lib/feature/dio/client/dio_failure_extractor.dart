import 'package:demo_2026/feature/failure/failure.build.dart';
import 'package:dio/dio.dart';

abstract class FailureExtractorContract {
  Failure? extract(Response<dynamic> response);
}
