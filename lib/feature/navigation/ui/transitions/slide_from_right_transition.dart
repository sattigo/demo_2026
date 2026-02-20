
import 'package:demo_2026/feature/navigation/ui/transitions/base_transition_contract.dart';
import 'package:flutter/widgets.dart';

class SlideFromRightTransition extends BaseTransitionContract {
  const SlideFromRightTransition();

  @protected
  Offset getOffset() => const Offset(1, 0);

  @override
  Widget animate(BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget widget) {
    final offset = Tween<Offset>(begin: getOffset(), end: Offset.zero).animate(animation);
    return SlideTransition(position: offset, child: widget);
  }
}