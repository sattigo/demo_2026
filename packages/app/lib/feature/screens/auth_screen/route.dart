import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/screens/auth_screen/page.dart';
import 'package:feature_auth_screen/feature_auth_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AuthScreenRoute extends AppGoRoute<void> {
  AuthScreenRoute({required LoginUseCase loginUseCase, required void Function(BuildContext context) onNavigateToHome})
    : _loginUseCase = loginUseCase,
      _onNavigateToHome = onNavigateToHome;

  final LoginUseCase _loginUseCase;
  final void Function(BuildContext context) _onNavigateToHome;

  @override
  String get path => '/auth';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return AuthScreenPage(loginUseCase: _loginUseCase, onNavigateToHome: _onNavigateToHome);
  }
}
