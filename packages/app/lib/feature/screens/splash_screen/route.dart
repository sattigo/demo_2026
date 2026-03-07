import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/screens/splash_screen/page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashScreenRoute extends AppGoRoute<void> {
  SplashScreenRoute({required void Function(BuildContext context) onNavigateToLanding})
    : _onNavigateToLanding = onNavigateToLanding;

  final void Function(BuildContext context) _onNavigateToLanding;

  @override
  String get path => '/';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return SplashScreenPage(onNavigateToLanding: _onNavigateToLanding);
  }
}
