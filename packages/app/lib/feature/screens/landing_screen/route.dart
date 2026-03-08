import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/screens/landing_screen/page.dart';
import 'package:feature_landing_screen/feature_landing_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class LandingScreenRoute extends AppGoRoute<void> {
  LandingScreenRoute({
    required FetchSlidesUseCase fetchSlidesUseCase,
    required void Function(BuildContext context) onNavigateToAuth,
  }) : _fetchSlidesUseCase = fetchSlidesUseCase,
       _onNavigateToAuth = onNavigateToAuth;

  final FetchSlidesUseCase _fetchSlidesUseCase;
  final void Function(BuildContext context) _onNavigateToAuth;

  @override
  String get path => '/landing';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return LandingScreenPage(fetchSlidesUseCase: _fetchSlidesUseCase, onNavigateToAuth: _onNavigateToAuth);
  }
}
