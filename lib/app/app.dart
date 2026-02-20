import 'package:demo_2026/di/dependency_injector.dart';
import 'package:demo_2026/navigation/main_router.dart';
import 'package:go_router/go_router.dart';

class App {
  static final GoRouter _mainRouter = MainRouter();

  static late final DependencyInjector _injector;

  static GoRouter get mainRouter => _mainRouter;

  static DependencyInjector get injector => _injector;

  static Future<void> init() async {
    _injector = await DependencyInjector.init();
  }
}
