import 'package:demo_2026/navigation/ui/page/base_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

sealed class AppRoute<T extends RouteBase> {
  List<AppRoute> routes = [];

  AppRoute children(List<AppRoute> routes) {
    this.routes = routes;
    return this;
  }

  T buildRoute({List<RouteBase> routes = const []});
}

abstract class AppShellRoute extends AppRoute<ShellRoute> {
  Widget buildWidget(BuildContext context, GoRouterState state, Widget child);

  @override
  ShellRoute buildRoute({List<RouteBase> routes = const []}) {
    return ShellRoute(builder: buildWidget, routes: routes);
  }
}

abstract class AppGoRoute<T> extends AppRoute<GoRoute> {
  BasePage buildPage(BuildContext context, GoRouterState state);

  @override
  GoRoute buildRoute({List<RouteBase> routes = const []}) {
    return GoRoute(path: path, name: name, pageBuilder: buildPage, routes: routes);
  }

  String get name => runtimeType.toString();

  String get path;
}