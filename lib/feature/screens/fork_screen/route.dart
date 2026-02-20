import 'package:demo_2026/feature/navigation/router/app_route.dart';
import 'package:demo_2026/feature/navigation/ui/page/base_page.dart';
import 'package:demo_2026/feature/screens/fork_screen/page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForkScreenRoute extends AppGoRoute<void> {
  @override
  String get path => '/fork';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return const ForkScreenPage();
  }
}
