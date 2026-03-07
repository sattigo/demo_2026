// TODO(sattigo): перенести в feature_home_screen, когда навигационные примитивы
//  (BasePage, AppGoRoute, переходы) будут вынесены в отдельный core_navigation пакет.
import 'package:demo_2026/feature/navigation/router/app_route.dart';
import 'package:demo_2026/feature/navigation/ui/page/base_page.dart';
import 'package:demo_2026/feature/screens/home_screen/ui/navigation/page.dart';
import 'package:feature_home_screen/feature_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenRoute extends AppGoRoute<void> {
  HomeScreenRoute({
    required FetchRecipesUseCase fetchRecipesUseCase,
    required void Function(BuildContext context) onGoToForkScreen,
  }) : _fetchRecipesUseCase = fetchRecipesUseCase,
       _onGoToForkScreen = onGoToForkScreen;

  final FetchRecipesUseCase _fetchRecipesUseCase;
  final void Function(BuildContext context) _onGoToForkScreen;

  @override
  String get path => '/home';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return HomeScreenPage(fetchRecipesUseCase: _fetchRecipesUseCase, onGoToForkScreen: _onGoToForkScreen);
  }
}
