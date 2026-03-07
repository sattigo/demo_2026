part of 'bloc.build.dart';

@freezed
sealed class LandingScreenAction with _$LandingScreenAction {
  factory LandingScreenAction.navigateToAuth() = LandingScreenActionNavigateToAuth;
}
