import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/screens/home_screen/ui/navigation/page.dart';
import 'package:feature_home_screen/feature_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenRoute extends AppGoRoute<void> {
  HomeScreenRoute({required FetchRecipesUseCase fetchRecipesUseCase, required String mapRouteName})
    : _fetchRecipesUseCase = fetchRecipesUseCase,
      _mapRouteName = mapRouteName;

  static const routeName = 'HomeScreenRoute';

  final FetchRecipesUseCase _fetchRecipesUseCase;
  final String _mapRouteName;

  @override
  String get name => routeName;

  @override
  String get path => '/home';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return HomeScreenPage(fetchRecipesUseCase: _fetchRecipesUseCase, mapRouteName: _mapRouteName);
  }
}
