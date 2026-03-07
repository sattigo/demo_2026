part of 'bloc.build.dart';

@freezed
sealed class AuthScreenAction with _$AuthScreenAction {
  factory AuthScreenAction.navigateToHome() = AuthScreenActionNavigateToHome;
}
