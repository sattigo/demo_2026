import 'package:demo_2026/app/app.dart';
import 'package:demo_2026/features/fork_screen/route.dart';
import 'package:demo_2026/features/initial_screen/route.dart';
import 'package:demo_2026/navigation/router/router.dart';
import 'package:flutter/material.dart';

class MainRouter extends AppRouter {
  MainRouter()
    : super(
        navigatorKey: App.injector.get<GlobalKey<NavigatorState>>(),
        routes: [InitialScreenRoute(), ForkScreenRoute()],
      );
}
