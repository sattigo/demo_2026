// TODO(sattigo): перенести в feature_initial_screen, когда навигационные примитивы
//  (BasePage, AppGoRoute, переходы) будут вынесены в отдельный core_navigation пакет.
import 'package:demo_2026/feature/navigation/router/app_route.dart';
import 'package:demo_2026/feature/navigation/ui/page/base_page.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/navigation/page.dart';
import 'package:feature_initial_screen/feature_initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialScreenRoute extends AppGoRoute<void> {
  InitialScreenRoute({
    required FetchRecipesUseCase fetchRecipesUseCase,
    required void Function(BuildContext context) onGoToForkScreen,
  }) : _fetchRecipesUseCase = fetchRecipesUseCase,
       _onGoToForkScreen = onGoToForkScreen;

  final FetchRecipesUseCase _fetchRecipesUseCase;
  final void Function(BuildContext context) _onGoToForkScreen;

  @override
  String get path => '/';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return InitialScreenPage(
      fetchRecipesUseCase: _fetchRecipesUseCase,
      onGoToForkScreen: _onGoToForkScreen,
    );
  }
}
