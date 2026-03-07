part of 'bloc.build.dart';

@freezed
abstract class AuthScreenState with _$AuthScreenState {
  const factory AuthScreenState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    String? emailError,
    String? passwordError,
    Failure? failure,
  }) = _AuthScreenState;
}
