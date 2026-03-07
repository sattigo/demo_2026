import 'package:core_bloc/core_bloc.dart';
import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_auth_screen/src/domain/use_cases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.build.freezed.dart';
part 'action.dart';
part 'event.dart';
part 'state.dart';

class AuthScreenBloc extends BaseBloc<AuthScreenEvent, AuthScreenState, AuthScreenAction> {
  AuthScreenBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(const AuthScreenState()) {
    on<_AuthScreenEventEmailChanged>(_onEmailChanged);
    on<_AuthScreenEventPasswordChanged>(_onPasswordChanged);
    on<_AuthScreenEventLoginSubmitted>(_onLoginSubmitted);
  }

  final LoginUseCase _loginUseCase;

  void _onEmailChanged(_AuthScreenEventEmailChanged event, Emitter<AuthScreenState> emit) {
    emit(state.copyWith(email: event.email, emailError: null, failure: null));
  }

  void _onPasswordChanged(_AuthScreenEventPasswordChanged event, Emitter<AuthScreenState> emit) {
    emit(state.copyWith(password: event.password, passwordError: null, failure: null));
  }

  Future<void> _onLoginSubmitted(_AuthScreenEventLoginSubmitted event, Emitter<AuthScreenState> emit) async {
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);

    if (emailError != null || passwordError != null) {
      emit(state.copyWith(emailError: emailError, passwordError: passwordError));
      return;
    }

    emit(state.copyWith(isLoading: true, failure: null));
    final result = await _loginUseCase.call(email: state.email, password: state.password);
    switch (result) {
      case Success<void, Failure>():
        emit(state.copyWith(isLoading: false));
        emitAction(AuthScreenAction.navigateToHome());
      case Error<void, Failure>(:final error):
        emit(state.copyWith(isLoading: false, failure: error));
    }
  }

  String? _validateEmail(String email) {
    if (!email.contains('@') || !email.contains('.')) {
      return 'Invalid email';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
