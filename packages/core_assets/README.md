# core_assets

Пакет с ресурсами приложения: изображения, шрифты, иконки, анимации.

## Подключение

```yaml
dependencies:
  core_assets: any
```

```dart
import 'package:core_assets/core_assets.dart';
```

## Изображения

Используй `.pkg()` — он автоматически подставляет `package: 'core_assets'`:

```dart
// Виджет
Assets.images.appImage.pkg(width: 200, fit: BoxFit.cover)

// ImageProvider (для DecorationImage и т.п.)
Assets.images.appImage.pkgProvider()
```

> Не используй `.image()` напрямую — без `package` ассет не найдётся.

## Шрифты

```dart
TextStyle(fontFamily: FontFamily.roboto, fontWeight: FontWeight.w400)
TextStyle(fontFamily: FontFamily.roboto, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic)
TextStyle(fontFamily: FontFamily.oswald, fontWeight: FontWeight.w600)
```

Доступные веса Roboto: 100, 200, 300, 400, 500, 600, 700, 800, 900 (+ italic для каждого).
Доступные веса Oswald: 200, 300, 400, 500, 600, 700.

Зачёркнутый и подчёркнутый текст — через `TextDecoration`, не зависят от шрифта:

```dart
TextStyle(decoration: TextDecoration.lineThrough)
TextStyle(decoration: TextDecoration.underline)
```

## Добавление новых ассетов

1. Положи файл в нужную папку (`assets/images/`, `assets/icons/`, `assets/animations/`)
2. Запусти `melos run gen` в корне монорепозитория
3. Новый ассет появится в `Assets.*` автоматически

Для новых шрифтов — дополнительно зарегистрируй их в `pubspec.yaml` в секции `flutter.fonts`.

## Структура

```
assets/
  animations/   # Lottie JSON, Rive (интеграции подключаются по необходимости)
  fonts/
    oswald/
    roboto/
  icons/        # SVG, PNG иконки
  images/       # PNG, JPG, WebP
lib/
  core_assets.dart        # публичный barrel
  src/
    asset_image_x.dart    # extension .pkg() / .pkgProvider()
    gen/
      assets.gen.dart     # генерируется flutter_gen — не редактировать
      fonts.gen.dart      # генерируется flutter_gen — не редактировать
```
