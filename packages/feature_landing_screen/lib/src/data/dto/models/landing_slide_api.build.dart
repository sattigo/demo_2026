import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_slide_api.build.freezed.dart';

part 'landing_slide_api.build.g.dart';

@freezed
sealed class LandingSlideApi with _$LandingSlideApi {
  factory LandingSlideApi({
    int? id,
    @JsonKey(name: 'firstName') String? title,
    @JsonKey(name: 'lastName') String? subtitle,
    @JsonKey(name: 'image') String? imageUrl,
    @JsonKey(name: 'company') Map<String, dynamic>? company,
  }) = _LandingSlideApi;

  factory LandingSlideApi.fromJson(Map<String, dynamic> json) => _$LandingSlideApiFromJson(json);
}
