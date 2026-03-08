part of 'bloc.build.dart';

@freezed
abstract class LandingScreenState with _$LandingScreenState {
  const factory LandingScreenState({
    @Default(0) int currentPage,
    @Default(false) bool isLoading,
    List<LandingSlide>? slides,
    Failure? failure,
  }) = _LandingScreenState;
}
