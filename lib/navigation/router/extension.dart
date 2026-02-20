import 'package:demo_2026/navigation/router/app_route.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension AppRouteExtension<T> on AppGoRoute<T> {
  T? getDataOrNull(GoRouterState state) {
    if (state.extra is! T) {
      return null;
    }
    return state.extra as T;
  }

  T getData(GoRouterState state) {
    return state.extra as T;
  }

  void goNamed(BuildContext context, {T? data}) {
    return GoRouter.of(context).goNamed(name, extra: data);
  }

  void go(BuildContext context, String location, {T? data}) {
    return GoRouter.of(context).go(location, extra: data);
  }

  Future<T?> pushNamed(BuildContext context, {T? data}) {
    return GoRouter.of(context).pushNamed<T>(name, extra: data);
  }

  Future<T?> push(BuildContext context, String location, {T? data}) {
    return GoRouter.of(context).push<T>(location, extra: data);
  }

  Future<T?> pushReplacementNamed(BuildContext context, {T? data}) {
    return GoRouter.of(context).pushReplacementNamed<T>(name, extra: data);
  }

  Future<T?> pushReplacement(BuildContext context, String location, {T? data}) {
    return GoRouter.of(context).pushReplacement<T>(location, extra: data);
  }

  Future<T?> replaceNamed(BuildContext context, {T? data}) {
    return GoRouter.of(context).replaceNamed<T>(name, extra: data);
  }

  Future<T?> replace(BuildContext context, String location, {T? data}) {
    return GoRouter.of(context).replace<T>(location, extra: data);
  }
}

extension AppRouterHelper on BuildContext {
  bool canPop() => GoRouter.of(this).canPop();

  void pop<T extends Object?>([T? result]) => GoRouter.of(this).pop(result);
}