import 'package:core_dio/core_dio.dart';
import 'package:core_platform/core_platform.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/data_sources/local/contract.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/data_sources/local/impl.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/data_sources/remote/contract.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/data_sources/remote/impl.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/repositories/impl.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/repositories/repository_contract.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/use_cases/fetch_recipes_use_case.dart';
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
        baseUrl: 'https://dummyjson.com/',
        connectTimeout: const Duration(seconds: 30),
        followRedirects: false,
        persistentConnection: true,
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      ),
    );

    _getIt.registerSingleton<Dio>(Dio(_getIt<BaseOptions>()));

    _getIt.registerSingleton<DefaultDioResponseHandler>(DefaultDioResponseHandler());

    _getIt.registerSingleton<DefaultDioFailureHandler>(DefaultDioFailureHandler());

    _getIt.registerSingleton<DioClient>(
      DioClient(
        dio: _getIt<Dio>(),
        defaultResponseHandler: _getIt<DefaultDioResponseHandler>(),
        defaultFailureHandler: _getIt<DefaultDioFailureHandler>(),
      ),
    );

    _getIt.registerSingleton<InitialScreenRemoteDataSource>(
      InitialScreenRemoteDataSourceImpl(dioClient: _getIt<DioClient>()),
    );

    _getIt.registerSingleton<InitialScreenLocalDataSource>(InitialScreenLocalDataSourceImpl());

    _getIt.registerSingleton<InitialScreenRepository>(
      InitialScreenRepositoryImpl(
        localDataSource: _getIt<InitialScreenLocalDataSource>(),
        remoteDataSource: _getIt<InitialScreenRemoteDataSource>(),
      ),
    );

    _getIt.registerSingleton<FetchRecipesUseCase>(
      FetchRecipesUseCase(repository: _getIt<InitialScreenRepository>()),
    );
  }

  static Future<DependencyInjector> create() async {
    final di = DependencyInjector._();
    await di._init();
    _instance = di;
    return di;
  }

  T get<T extends Object>() => _getIt<T>();
}
