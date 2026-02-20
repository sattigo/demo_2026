import 'dart:async';

import 'package:demo_2026/navigation/router/app_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter extends GoRouter {
  AppRouter({
    required List<AppRoute> routes,
    super.onException,
    super.errorPageBuilder,
    super.errorBuilder,
    GoRouterRedirect? redirect,
    super.refreshListenable,
    int redirectLimit = 5,
    super.routerNeglect,
    super.initialLocation,
    super.initialExtra,
    super.observers,
    super.debugLogDiagnostics,
    super.navigatorKey,
    super.restorationScopeId,
    super.requestFocus,
    super.extraCodec,
    super.overridePlatformDefaultLocation,
  }) : super.routingConfig(
    routingConfig: _ConstantRoutingConfig(
      RoutingConfig(
        routes: _createRoutes(routes),
        redirect: redirect ?? _defaultRedirect,
        redirectLimit: redirectLimit,
      ),
    ),
  );

  static FutureOr<String?> _defaultRedirect(BuildContext context, GoRouterState state) {
    if (state.uri.path.contains('slRL') || state.uri.path.contains('gotu')) {
      return '/';
    }
    return null;
  }

  static List<RouteBase> _createRoutes(List<AppRoute> routes) {
    return routes.map((e) => e.buildRoute(routes: _createRoutes(e.routes))).toList();
  }
}

/// Конфиг go_router для стандартного конструктора GoRouter. Скопировано из go_router/lib/src/router.dart
///
/// Конфигурация маршрутизации, которая никогда не изменится.
class _ConstantRoutingConfig extends ValueListenable<RoutingConfig> {
  const _ConstantRoutingConfig(this.value);

  @override
  final RoutingConfig value;

  @override
  void addListener(VoidCallback listener) {
    // Намеренно пусто, потому что прослушиватель никогда не будет вызван.
  }

  @override
  void removeListener(VoidCallback listener) {
    // Намеренно пусто, потому что прослушиватель никогда не будет вызван.
  }
}