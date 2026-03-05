import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dio_client_request_data.build.freezed.dart';

@freezed
sealed class DioClientRequestData with _$DioClientRequestData {
  const factory DioClientRequestData.map(Map<String, dynamic> data) = DioMapData;

  // TODO(EgorPopov): needs another factory for files (or current modification)
  const factory DioClientRequestData.formData(FormData data) = DioFormData;
}
