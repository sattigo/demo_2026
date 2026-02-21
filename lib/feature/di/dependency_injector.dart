import 'package:demo_2026/feature/platform/platform_type_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class DependencyInjector {
  DependencyInjector._();

  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    assert(_instance != null, 'DependencyInjector is not initialized. Call init() first.');
    return _instance!;
  }

  final GetIt _getIt = GetIt.instance;

  Future<void> _init() async {
    _getIt.registerSingletonAsync<PlatformTypeService>(PlatformTypeService.getInstance);

    await _getIt.allReady();

    _getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
    _getIt.registerSingleton<BaseOptions>(
      BaseOptions(
        baseUrl: 'https://google.com',
        connectTimeout: const Duration(seconds: 30),
        followRedirects: false,
        persistentConnection: true,
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      ),
    );
    _getIt.registerSingleton<Dio>(Dio(_getIt<BaseOptions>()));
  }

  static Future<DependencyInjector> create() async {
    final di = DependencyInjector._();
    await di._init();
    _instance = di;
    return di;
  }

  T get<T extends Object>() => _getIt<T>();
}
