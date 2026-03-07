import 'package:core_navigation/core_navigation.dart';
import 'package:feature_landing_screen/feature_landing_screen.dart';
import 'package:flutter/widgets.dart';

class LandingScreenPage extends BasePage {
  LandingScreenPage({required void Function(BuildContext context) onNavigateToAuth})
    : super(
        widget: LandingScreenView(onNavigateToAuth: onNavigateToAuth),
        key: const ValueKey(LandingScreenPage),
        transition: const SlideFromRightTransition(),
      );
}
