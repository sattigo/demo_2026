import 'package:feature_auth_screen/src/domain/use_cases/login_use_case.dart';
import 'package:feature_auth_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_auth_screen/src/ui/widgets/coordinator.dart';
import 'package:feature_auth_screen/src/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreenView extends StatelessWidget {
  const AuthScreenView({required LoginUseCase loginUseCase, required String homeRouteName, super.key})
    : _loginUseCase = loginUseCase,
      _homeRouteName = homeRouteName;

  final LoginUseCase _loginUseCase;
  final String _homeRouteName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthScreenBloc(loginUseCase: _loginUseCase),
      child: AuthScreenCoordinator(homeRouteName: _homeRouteName, child: const AuthScreenWidget()),
    );
  }
}
