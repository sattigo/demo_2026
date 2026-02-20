import 'package:demo_2026/features/fork_screen/view.dart';
import 'package:demo_2026/navigation/ui/page/base_page.dart';
import 'package:demo_2026/navigation/ui/transitions/slide_from_right_transition.dart';
import 'package:flutter/foundation.dart';

class ForkScreenPage extends BasePage {
  const ForkScreenPage()
    : super(
        widget: const ForkScreenView(),
        key: const ValueKey(ForkScreenPage),
        transition: const SlideFromRightTransition(),
      );
}
