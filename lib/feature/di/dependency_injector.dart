import 'package:demo_2026/feature/platform/platform_type_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class DependencyInjector {
  DependencyInjector._();

  final GetIt _getIt = GetIt.instance;

  static Future<DependencyInjector> init() async {
    final instance = DependencyInjector._();

    instance._getIt.registerSingletonAsync<PlatformTypeService>(PlatformTypeService.getInstance);

    await instance._getIt.allReady();

    instance._getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());

    return instance;
  }

  T get<T extends Object>() => _getIt<T>();
}
