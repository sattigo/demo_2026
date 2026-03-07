part of 'bloc.build.dart';

@freezed
sealed class SplashScreenEvent with _$SplashScreenEvent {
  factory SplashScreenEvent.started() = _SplashScreenEventStarted;
  factory SplashScreenEvent.fadeInCompleted() = _SplashScreenEventFadeInCompleted;
  factory SplashScreenEvent.holdCompleted() = _SplashScreenEventHoldCompleted;
  factory SplashScreenEvent.fadeOutCompleted() = _SplashScreenEventFadeOutCompleted;
}
