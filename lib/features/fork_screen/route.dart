import 'package:demo_2026/features/fork_screen/page.dart';
import 'package:demo_2026/navigation/router/app_route.dart';
import 'package:demo_2026/navigation/ui/page/base_page.dart';
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
