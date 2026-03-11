import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/app/app.dart';
import 'package:demo_2026/feature/screens/auth_screen/route.dart';
import 'package:demo_2026/feature/screens/home_screen/ui/navigation/route.dart';
import 'package:demo_2026/feature/screens/landing_screen/route.dart';
import 'package:demo_2026/feature/screens/map_screen/route.dart';
import 'package:demo_2026/feature/screens/splash_screen/route.dart';
import 'package:feature_auth_screen/feature_auth_screen.dart';
import 'package:feature_home_screen/feature_home_screen.dart';
import 'package:feature_landing_screen/feature_landing_screen.dart';
import 'package:flutter/material.dart';

class MainRouter extends AppRouter {
  MainRouter()
    : super(
        navigatorKey: App.injector.get<GlobalKey<NavigatorState>>(),
        routes: [
          SplashScreenRoute(
            onNavigateToLanding: (context) => LandingScreenRoute(
              fetchSlidesUseCase: App.injector.get<FetchSlidesUseCase>(),
              onNavigateToAuth: (context) => AuthScreenRoute(
                loginUseCase: App.injector.get<LoginUseCase>(),
                onNavigateToHome: (context) => HomeScreenRoute(
                  fetchRecipesUseCase: App.injector.get<FetchRecipesUseCase>(),
                  onGoToForkScreen: (context) => MapScreenRoute().pushNamed(context),
                ).goNamed(context),
              ).pushNamed(context),
            ).pushNamed(context),
          ),
          LandingScreenRoute(
            fetchSlidesUseCase: App.injector.get<FetchSlidesUseCase>(),
            onNavigateToAuth: (context) => AuthScreenRoute(
              loginUseCase: App.injector.get<LoginUseCase>(),
              onNavigateToHome: (context) => HomeScreenRoute(
                fetchRecipesUseCase: App.injector.get<FetchRecipesUseCase>(),
                onGoToForkScreen: (context) => MapScreenRoute().pushNamed(context),
              ).goNamed(context),
            ).pushNamed(context),
          ),
          AuthScreenRoute(
            loginUseCase: App.injector.get<LoginUseCase>(),
            onNavigateToHome: (context) => HomeScreenRoute(
              fetchRecipesUseCase: App.injector.get<FetchRecipesUseCase>(),
              onGoToForkScreen: (context) => MapScreenRoute().pushNamed(context),
            ).goNamed(context),
          ),
          HomeScreenRoute(
            fetchRecipesUseCase: App.injector.get<FetchRecipesUseCase>(),
            onGoToForkScreen: (context) => MapScreenRoute().pushNamed(context),
          ),
          MapScreenRoute(),
        ],
      );
}
