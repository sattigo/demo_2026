import 'package:flutter/widgets.dart';

abstract class BaseTransitionContract {
  const BaseTransitionContract();

  Widget animate(BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget widget);
}