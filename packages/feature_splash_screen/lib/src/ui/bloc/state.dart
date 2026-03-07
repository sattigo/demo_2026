part of 'bloc.build.dart';

enum SplashAnimationPhase { fadeIn, hold, fadeOut, done }

@freezed
abstract class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState({
    @Default(0) double opacity,
    @Default(SplashAnimationPhase.fadeIn) SplashAnimationPhase phase,
  }) = _SplashScreenState;
}
