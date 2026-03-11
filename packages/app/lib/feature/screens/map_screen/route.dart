import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/screens/map_screen/page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MapScreenRoute extends AppGoRoute<void> {
  @override
  String get path => '/fork';

  @override
  BasePage buildPage(BuildContext context, GoRouterState state) {
    return const MapScreenPage();
  }
}
