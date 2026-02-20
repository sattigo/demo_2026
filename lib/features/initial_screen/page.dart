import 'package:demo_2026/features/initial_screen/view.dart';
import 'package:demo_2026/navigation/ui/page/base_page.dart';
import 'package:demo_2026/navigation/ui/transitions/slide_from_right_transition.dart';
import 'package:flutter/foundation.dart';

class InitialScreenPage extends BasePage {
  const InitialScreenPage()
      : super(
    widget: const InitialScreenView(),
    key: const ValueKey(InitialScreenPage),
    transition: const SlideFromRightTransition(),
  );
}