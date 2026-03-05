import 'package:demo_2026/feature/app/app.dart';
import 'package:demo_2026/feature/navigation/router/extension.dart';
import 'package:demo_2026/feature/navigation/router/router.dart';
import 'package:demo_2026/feature/screens/fork_screen/route.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/navigation/route.dart';
import 'package:feature_initial_screen/feature_initial_screen.dart';
import 'package:flutter/material.dart';

class MainRouter extends AppRouter {
  MainRouter()
    : super(
        navigatorKey: App.injector.get<GlobalKey<NavigatorState>>(),
        routes: [
          InitialScreenRoute(
            fetchRecipesUseCase: App.injector.get<FetchRecipesUseCase>(),
            onGoToForkScreen: (context) => ForkScreenRoute().pushNamed(context),
          ),
          ForkScreenRoute(),
        ],
      );
}
