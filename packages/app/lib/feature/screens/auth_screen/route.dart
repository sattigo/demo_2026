import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/screens/auth_screen/page.dart';
import 'package:feature_auth_screen/feature_auth_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AuthScreenRoute extends AppGoRoute<void> {
  AuthScreenRoute({required LoginUseCase loginUseCase, required String homeRouteName})
    : _loginUseCase = loginUseCase,
      _homeRouteName = homeRouteName;

  static const routeName = 'AuthScreenRoute';

  final LoginUseCase _loginUseCase;
  final String _homeRouteName;

  @override
  String get name => routeName;

  @override
  String get path => '/auth';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return AuthScreenPage(loginUseCase: _loginUseCase, homeRouteName: _homeRouteName);
  }
}
