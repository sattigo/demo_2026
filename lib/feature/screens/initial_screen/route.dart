
import 'package:demo_2026/feature/navigation/router/app_route.dart';
import 'package:demo_2026/feature/navigation/ui/page/base_page.dart';
import 'package:demo_2026/feature/screens/initial_screen/page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialScreenRoute extends AppGoRoute<void> {
  @override
  String get path => '/';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return const InitialScreenPage();
  }
}
