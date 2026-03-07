import 'package:core_navigation/core_navigation.dart';
import 'package:demo_2026/feature/screens/fork_screen/view.dart';
import 'package:flutter/foundation.dart';

class ForkScreenPage extends BasePage {
  const ForkScreenPage()
    : super(
        widget: const ForkScreenView(),
        key: const ValueKey(ForkScreenPage),
        transition: const SlideFromRightTransition(),
      );
}
