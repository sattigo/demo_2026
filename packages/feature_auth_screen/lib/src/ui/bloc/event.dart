part of 'bloc.build.dart';

@freezed
sealed class AuthScreenEvent with _$AuthScreenEvent {
  factory AuthScreenEvent.emailChanged(String email) = _AuthScreenEventEmailChanged;
  factory AuthScreenEvent.passwordChanged(String password) = _AuthScreenEventPasswordChanged;
  factory AuthScreenEvent.loginSubmitted() = _AuthScreenEventLoginSubmitted;
}
