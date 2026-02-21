import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_failure.build.freezed.dart';

@freezed
sealed class DioFailure with _$DioFailure {
  const factory DioFailure.badResponse({Response<dynamic>? response}) = DioFailureBadResponse;

  const factory DioFailure.connectTimeout({Response<dynamic>? response}) = DioFailureConnectTimeout;

  const factory DioFailure.sendTimeout({Response<dynamic>? response}) = DioFailureSendTimeout;

  const factory DioFailure.receiveTimeout({Response<dynamic>? response}) = DioFailureReceiveTimeout;

  const factory DioFailure.cancel({Response<dynamic>? response}) = DioFailureCancelDio;

  const factory DioFailure.unknown({Response<dynamic>? response}) = DioFailureUnknownDio;

  const factory DioFailure.badCertificate({Response<dynamic>? response}) = DioFailureBadCertificate;

  const factory DioFailure.connectionError({Response<dynamic>? response}) = DioFailureConnectionError;
}
