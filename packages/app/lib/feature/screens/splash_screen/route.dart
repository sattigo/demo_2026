import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/screens/splash_screen/page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashScreenRoute extends AppGoRoute<void> {
  SplashScreenRoute({required String landingRouteName}) : _landingRouteName = landingRouteName;

  static const routeName = 'SplashScreenRoute';

  final String _landingRouteName;

  @override
  String get name => routeName;

  @override
  String get path => '/';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return SplashScreenPage(landingRouteName: _landingRouteName);
  }
}
