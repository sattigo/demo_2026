import 'package:demo_2026/feature/app/app.dart';
import 'package:demo_2026/feature/navigation/router/router.dart';
import 'package:demo_2026/feature/screens/fork_screen/route.dart';
import 'package:demo_2026/feature/screens/initial_screen/route.dart';
import 'package:flutter/material.dart';

class MainRouter extends AppRouter {
  MainRouter()
    : super(
        navigatorKey: App.injector.get<GlobalKey<NavigatorState>>(),
        routes: [InitialScreenRoute(), ForkScreenRoute()],
      );
}
