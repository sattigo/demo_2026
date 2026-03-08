# CLAUDE.md — demo_2026

> Обязательно к прочтению перед началом работы с проектом.
> Этот файл должен обновляться при любых значимых изменениях в проекте: новые пакеты, экраны, паттерны, версии зависимостей.

## Проект

**Yangi Finance Demo 2026** — Flutter-приложение, демонстрирующее архитектурные подходы: BLoC, Clean Architecture, Melos-монорепозиторий.

- Точка входа: `packages/app/lib/main.dart`
- API: `https://dummyjson.com/` (только home screen, остальное fake)
- Ориентация: только portrait

## Требования к окружению

| Инструмент | Версия |
|------------|--------|
| Flutter    | 3.41.4 |
| Dart       | 3.11.1 |
| Melos      | 7.4.0  |

## Команды

```bash
dart pub global activate melos 7.4.0  # Установить melos
melos bootstrap                        # Установить зависимости
melos run gen                          # Кодогенерация (freezed, json_serializable)
melos run analyze                      # Анализ всех пакетов
melos run format                       # Форматирование (line-length 120)
melos run test                         # Тесты
melos run reinstall                    # Полная переустановка с нуля
cd packages/app && flutter run         # Запуск приложения
```

## Структура монорепозитория

```
packages/
  app/                     # Точка входа, DI, сборка роутера (MainRouter)
  core_bloc/               # BaseBloc<Event, State, Action> с action-стримом
  core_chain/              # ChainPipeline: трансформеры и валидаторы
  core_dio/                # DioClient с обработкой ошибок
  core_failure/            # Базовые типы ошибок (Failure, CustomFailure)
  core_platform/           # Определение платформы (Android/iOS)
  core_l10n/               # Локализация (flutter_intl): S класс, .arb файлы, делегат
  core_navigation/         # AppGoRoute, AppShellRoute, AppRouter, BasePage, переходы
  core_result/             # Result<SUCCESS, FAILURE> (sealed: Success / Error)
  feature_splash_screen/   # Splash-экран
  feature_landing_screen/  # Landing-экран с каруселью
  feature_auth_screen/     # Экран авторизации (fake)
  feature_home_screen/     # Главный экран — список рецептов (реальный API)
```

## Навигационный флоу

```
/ (Splash) --push--> /landing --push--> /auth --go--> /home --go--> /fork
```

- `push` — сохраняет стек (назад можно): Splash, Landing
- `go` — очищает стек: Auth, Home, Fork

Навигация через `AppGoRoute`/`AppShellRoute` из `core_navigation` (обёртки над go_router). Голый `GoRoute` не использовать.

## Архитектура

### Clean Architecture (на примере feature_home_screen)

```
domain/
  models/          # Freezed-модели домена
  repositories/    # Абстракции (contract)
  use_cases/       # Бизнес-логика
data/
  data_sources/
    local/         # Кеш (contract + impl)
    remote/        # HTTP (contract + impl)
  dto/
    models/        # DTO (freezed + json_serializable)
    transformers/  # API → Domain
    validators/    # Валидация сырых данных
  repositories/    # impl: кеш → remote fallback (TTL 5 минут)
ui/
  bloc/            # bloc.build.dart, event.dart, state.dart, action.dart
  widgets/
    widget.dart    # BlocProvider + Coordinator
    coordinator.dart  # Подписка на action-стрим, навигация/тосты
    view.dart      # Чистый UI, только BlocBuilder
```

### BLoC

- `BaseBloc<Event, State, Action>` — базовый класс из `core_bloc`
- Виджет (`view.dart`) — только рендер state, никакой логики
- Навигация и сайд-эффекты — через `emitAction(action)` → Coordinator
- Coordinator слушает `bloc.actions` в `initState`

### DI

- GetIt, единый глобальный scope
- Регистрация: `packages/app/lib/feature/di/dependency_injector.dart`
- Инициализация: `DependencyInjector.create()` → вызывается в `App.init()`
- Добавление новой фичи: зарегистрировать DataSource → Repository → UseCase в `_init()`

### Result-тип

```dart
// Использование
switch (result) {
  case Success(:final data): // обработать успех
  case Error(:final error):  // обработать ошибку (Error — это Failure-кейс!)
}
typedef ResultFuture<S, F> = Future<Result<S, F>>
```

### Chain-пайплайн

```dart
ChainPipeline.startWithValue(rawData)
  .validate(SomeValidator())
  .transform(SomeTransformer())
  .getResult();
```

## Соглашения

### Вынесение кода в пакеты

- Публичное API пакета — только через главный barrel-файл `lib/<package_name>.dart`
- Внутренние файлы (`src/` или вложенные папки) **не экспортируются** напрямую — только то, что нужно потребителям
- После создания/изменения пакета запустить в корне монорепозитория:
  ```bash
  ignorium gen   # обновить .gitignore для всех пакетов
  ```

### Файлы и именование

- Модели: `<name>.build.dart` (не просто `<name>.dart`)
- Генерируемые файлы: `*.build.freezed.dart`, `*.build.g.dart` — не редактировать
- Исключение: `core_assets` использует `assets.gen.dart` — flutter_gen не поддерживает кастомное имя выходного файла
- Контракты: `contract.dart`; реализации: `impl.dart`
- BLoC-файлы: `bloc.build.dart`, `event.dart`, `state.dart`, `action.dart` в папке `bloc/`

### Зависимости

- Версии — **точные**, без диапазонов (кроме `ignorium`). Это соглашение проекта.

### Форматирование

- Line length: **120** символов

### Локализация

- Пакет: `core_l10n` — подключить как `core_l10n: any`, импорт `package:core_l10n/core_l10n.dart`
- `flutter_intl` + `intl_utils`, основная локаль: `ru`, `.arb` файлы в `packages/core_l10n/lib/l10n/`
- Регенерация после изменения `.arb`: `melos run gen` (включает `intl_utils:generate`)

#### Именование ключей локализации

```
{featureName}_{clickability}_{uniqueness}_{stringName}
```

- `featureName` — camelCase название экрана: `landingScreen`, `homeScreen`, `forkScreen`, ...
- `clickability` — `clickable` (кнопки, ссылки) / `notClickable` (тексты, заголовки)
- `uniqueness` — `original` для строк уникальных для этого места; для переиспользуемых — своё слово
- `stringName` — описание строки: `appBarText`, `getStartedButton`, `tryAgainButton`, ...

Примеры:
```
landingScreen_clickable_original_getStartedButton
homeScreen_notClickable_original_appBarText
forkScreen_clickable_original_toForkScreenButton
```
