import 'package:demo_2026/feature/navigation/ui/transitions/base_transition_contract.dart';
import 'package:flutter/widgets.dart';

class FadePageTransition extends BaseTransitionContract {
  const FadePageTransition();

  @override
  Widget animate(BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget widget) {
    return FadeTransition(opacity: animation, child: widget);
  }
}
