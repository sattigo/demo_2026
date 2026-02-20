import 'package:demo_2026/navigation/ui/routes/cupertino_route.dart';
import 'package:demo_2026/navigation/ui/routes/material_route.dart';
import 'package:demo_2026/navigation/ui/transitions/base_transition_contract.dart';
import 'package:demo_2026/platform/platform_type_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasePage extends Page<dynamic> {
  const BasePage({
    required this.widget,
    super.key,
    super.arguments,
    this.transition,
    this.duration = const Duration(milliseconds: 250),
    this.isTransparent = false,
    super.name,
  });

  final Widget widget;
  final BaseTransitionContract? transition;
  final Duration duration;
  final bool isTransparent;

  PageRoute<dynamic> getMaterialPageRoute(Widget widget) {
    if (isTransparent) {
      return _buildTransparentPageRoute();
    }
    if (transition != null) {
      return BaseMaterialPageRoute(builder: (_) => widget, settings: this, duration: duration, transition: transition!);
    }
    return MaterialPageRoute(builder: (_) => widget, settings: this);
  }

  PageRoute<dynamic> getCupertinoPageRoute(Widget widget) {
    if (isTransparent) {
      return _buildTransparentPageRoute();
    }
    if (transition != null) {
      return BaseCupertinoPageRoute(
        builder: (_) => widget,
        settings: this,
        duration: duration,
        transition: transition!,
      );
    }
    return CupertinoPageRoute(builder: (_) => widget, settings: this);
  }

  PageRoute<dynamic> _buildTransparentPageRoute() {
    return PageRouteBuilder(
      opaque: false,
      settings: this,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition?.animate(context, animation, secondaryAnimation, child) ?? child;
      },
      pageBuilder: (_, _, _) => widget,
    );
  }

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return PlatformTypeService.execute(
      android: () => getMaterialPageRoute(widget),
      iOS: () => getCupertinoPageRoute(widget),
    );
  }
}
