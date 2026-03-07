part of 'bloc.build.dart';

@freezed
sealed class SplashScreenAction with _$SplashScreenAction {
  factory SplashScreenAction.navigateToLanding() = SplashScreenActionNavigateToLanding;
}
