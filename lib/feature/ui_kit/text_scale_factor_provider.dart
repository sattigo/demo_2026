import 'package:flutter/widgets.dart';

/// Виджет для ограничения масштабирования текста в приложении.
///
/// [TextScaleFactorProvider] обеспечивает контролируемое масштабирование текста
/// для улучшения пользовательского опыта и поддержания
/// читаемости интерфейса при различных настройках доступности устройства.
///
/// Особенности:
/// - Ограничивает минимальный и максимальный коэффициенты масштабирования текста
/// - Предотвращает чрезмерное увеличение или уменьшение текста
///
/// Пример использования:
/// ```dart
/// TextScaleFactorProvider(
///   maxTextScale: 1.5,
///   child: ChildWidget(),
/// )
/// ```
class TextScaleFactorProvider extends StatelessWidget {
  /// Создает виджет с ограниченным масштабированием текста.
  ///
  /// [child] - дочерний виджет, для которого применяется ограничение масштабирования
  /// [minTextScale] - минимальный коэффициент масштабирования (по умолчанию 1.0)
  /// [maxTextScale] - максимальный коэффициент масштабирования (по умолчанию 1.0)
  const TextScaleFactorProvider({
    required Widget child,
    double minTextScale = 1.0,
    double maxTextScale = 1.0,
    super.key,
  }) : _child = child,
        _minTextScale = minTextScale,
        _maxTextScale = maxTextScale;

  /// Дочерний виджет
  final Widget _child;

  /// Минимальный коэффициент масштабирования текста
  final double _minTextScale;

  /// Максимальный коэффициент масштабирования текста
  final double _maxTextScale;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.withClampedTextScaling(
      child: _child,
      minScaleFactor: _minTextScale,
      maxScaleFactor: _maxTextScale,
    );
  }
}
