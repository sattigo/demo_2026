import 'package:demo_2026/platform/platform_type_service.dart';
import 'package:flutter/widgets.dart';

class Platform extends StatelessWidget {
  const Platform({
    required Widget Function(BuildContext) androidBuilder,
    required Widget Function(BuildContext) iOSBuilder,
    super.key,
  }) : _iOSBuilder = iOSBuilder,
        _androidBuilder = androidBuilder;

  final Widget Function(BuildContext) _androidBuilder;
  final Widget Function(BuildContext) _iOSBuilder;

  @override
  Widget build(BuildContext context) {
    return PlatformTypeService.execute(
      android: () => _androidBuilder.call(context),
      iOS: () => _iOSBuilder.call(context),
    );
  }
}
