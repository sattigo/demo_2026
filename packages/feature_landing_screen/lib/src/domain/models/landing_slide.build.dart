import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_slide.build.freezed.dart';

@freezed
sealed class LandingSlide with _$LandingSlide {
  const factory LandingSlide({required String id, String? title, String? subtitle, Uri? imageUrl}) = _LandingSlide;
}
