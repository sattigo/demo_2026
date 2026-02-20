import 'package:demo_2026/navigation/ui/transitions/base_transition_contract.dart';
import 'package:flutter/material.dart';

class BaseMaterialPageRoute extends MaterialPageRoute<dynamic> {
  BaseMaterialPageRoute({
    required this.transition,
    required super.builder,
    super.settings,
    this.duration = const Duration(milliseconds: 300),
  });

  final Duration duration;
  final BaseTransitionContract transition;

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return transition.animate(context, animation, secondaryAnimation, child);
  }

  @override
  Duration get transitionDuration => duration;
}