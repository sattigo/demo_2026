import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Базовый sealed-класс для всех маршрутов приложения.
///
/// Оборачивает go_router [RouteBase] и позволяет строить дерево маршрутов
/// без прямой зависимости на go_router в фича-коде.
///
/// Два разрешённых подтипа: [AppGoRoute] и [AppShellRoute].
sealed class AppRoute<T extends RouteBase> {
  List<AppRoute> routes = [];

  /// Добавляет дочерние маршруты. Возвращает себя для цепочки вызовов:
  /// ```dart
  /// HomeRoute().children([ProfileRoute(), SettingsRoute()])
  /// ```
  AppRoute children(List<AppRoute> routes) {
    this.routes = routes;
    return this;
  }

  /// Конвертирует [AppRoute] в go_router `RouteBase`.
  /// Вызывается рекурсивно в `AppRouter` — не вызывать напрямую.
  T buildRoute({List<RouteBase> routes = const []});
}

/// Маршрут с общей оболочкой (shell) для группы экранов.
///
/// Используется, когда несколько экранов разделяют общий виджет-обёртку
/// (например, `BottomNavigationBar`), не пересоздавая её при навигации.
///
/// ```dart
/// class TabShellRoute extends AppShellRoute {
///   @override
///   Widget buildWidget(context, state, child) => MainTabScaffold(child: child);
/// }
/// ```
abstract class AppShellRoute extends AppRoute<ShellRoute> {
  /// Строит виджет-оболочку. [child] — текущий активный дочерний экран.
  Widget buildWidget(BuildContext context, GoRouterState state, Widget child);

  @override
  ShellRoute buildRoute({List<RouteBase> routes = const []}) {
    return ShellRoute(builder: buildWidget, routes: routes);
  }
}

/// Маршрут отдельного экрана. [T] — тип данных, передаваемых через `extra`.
///
/// Каждая фича создаёт свой класс-наследник:
/// ```dart
/// class ProfileRoute extends AppGoRoute<ProfileArgs> {
///   @override
///   String get path => '/profile';
///
///   @override
///   BasePage buildPage(context, state) {
///     final args = getData(state); // из extension.dart
///     return BasePage(widget: ProfileScreen(args: args));
///   }
/// }
/// ```
///
/// Навигация через extension-методы (см. `AppRouteExtension` в extension.dart):
/// ```dart
/// ProfileRoute().push(context, data: ProfileArgs(userId: 42));
/// ```
abstract class AppGoRoute<T> extends AppRoute<GoRoute> {
  /// Создаёт страницу для отображения. Используй `BasePage` из navigation/ui.
  Page<dynamic> buildPage(BuildContext context, GoRouterState state);

  @override
  GoRoute buildRoute({List<RouteBase> routes = const []}) {
    return GoRoute(path: path, name: name, pageBuilder: buildPage, routes: routes);
  }

  /// Имя маршрута для именованной навигации. По умолчанию — имя класса.
  String get name => runtimeType.toString();

  /// Путь маршрута, например `'/profile'` или `'details'` для вложенных.
  String get path;
}