# Yangi Finance — Demo 2026

Flutter-приложение с демонстрацией архитектурных подходов: BLoC, Clean Architecture, Melos-монорепозиторий.

## Требования

- Flutter `3.41.4`
- Dart `3.11.1`
- Melos `7.4.0`

## Структура монорепозитория

```
packages/
  app/                      # Точка входа, навигация, DI
  core_bloc/                # Базовый BaseBloc с action-стримом
  core_chain/               # Chain-трансформеры и валидаторы
  core_dio/                 # Dio-клиент с обработкой ошибок
  core_failure/             # Базовые типы ошибок
  core_platform/            # Определение платформы (Android/iOS)
  core_result/              # Result<Success, Failure>
  feature_splash_screen/    # Splash-экран
  feature_landing_screen/   # Landing-экран с каруселью
  feature_auth_screen/      # Экран авторизации
  feature_home_screen/      # Главный экран (рецепты)
```

## Навигационный флоу

```
/ (Splash) → /landing (Landing) → /auth (Auth) → /home (Home) → /fork (Fork)
```

Splash и Landing используют `push` (можно вернуться назад). Auth и Home — `go` (стек очищается).

## Запуск

```bash
# Установить melos глобально
dart pub global activate melos 7.4.0

# Установить зависимости
melos bootstrap

# Запустить кодогенерацию
melos run gen

# Запустить приложение
cd packages/app
flutter run
```

## Команды

```bash
melos run analyze   # Анализ всех пакетов
melos run gen       # Кодогенерация (freezed, json_serializable)
melos run format    # Форматирование (line-length 120)
melos run test      # Тесты
melos run reinstall # Полная переустановка с нуля
```

## Архитектурные принципы

- **BLoC**: виджеты только рендерят state. Логика, таймеры, переходы — в BLoC. Навигация — через action-стрим в coordinator.
- **Clean Architecture**: domain не зависит от data и UI. Data-слой с fake-реализациями для экранов без бэкенда.
- **DI**: GetIt, единый scope. Регистрация в `DependencyInjector`.
- **Навигация**: go_router через обёртки `AppGoRoute` / `AppShellRoute`. Переходы кастомные (`FadePageTransition`, `SlideFromRightTransition`).

---

# Yangi Finance — Demo 2026

Flutter application demonstrating architectural patterns: BLoC, Clean Architecture, Melos monorepo.

## Requirements

- Flutter `3.41.4`
- Dart `3.11.1`
- Melos `7.4.0`

## Monorepo structure

```
packages/
  app/                      # Entry point, navigation, DI
  core_bloc/                # Base BaseBloc with action stream
  core_chain/               # Chain transformers and validators
  core_dio/                 # Dio client with error handling
  core_failure/             # Base failure types
  core_platform/            # Platform detection (Android/iOS)
  core_result/              # Result<Success, Failure>
  feature_splash_screen/    # Splash screen
  feature_landing_screen/   # Landing screen with carousel
  feature_auth_screen/      # Auth screen
  feature_home_screen/      # Home screen (recipes)
```

## Navigation flow

```
/ (Splash) → /landing (Landing) → /auth (Auth) → /home (Home) → /fork (Fork)
```

Splash and Landing use `push` (back navigation allowed). Auth and Home use `go` (stack cleared).

## Getting started

```bash
# Install melos globally
dart pub global activate melos 7.4.0

# Install dependencies
melos bootstrap

# Run code generation
melos run gen

# Run the app
cd packages/app
flutter run
```

## Scripts

```bash
melos run analyze   # Analyze all packages
melos run gen       # Code generation (freezed, json_serializable)
melos run format    # Format code (line-length 120)
melos run test      # Run tests
melos run reinstall # Full clean reinstall from scratch
```

## Architecture

- **BLoC**: widgets only render state. Logic, timers, transitions are in BLoC. Navigation is handled via action stream in coordinator.
- **Clean Architecture**: domain does not depend on data or UI. Data layer uses fake implementations for screens without a backend.
- **DI**: GetIt, single scope. Registered in `DependencyInjector`.
- **Navigation**: go_router via `AppGoRoute` / `AppShellRoute` wrappers. Custom transitions (`FadePageTransition`, `SlideFromRightTransition`).
