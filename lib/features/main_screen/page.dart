import 'package:demo_2026/features/main_screen/view.dart';
import 'package:demo_2026/navigation/ui/page/base_page.dart';
import 'package:demo_2026/navigation/ui/transitions/slide_from_right_transition.dart';
import 'package:flutter/foundation.dart';

class MainScreenPage extends BasePage {
  const MainScreenPage()
      : super(
    widget: const MainScreenView(),
    key: const ValueKey(MainScreenPage),
    transition: const SlideFromRightTransition(),
  );
}