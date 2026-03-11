import 'package:core_navigation/core_navigation.dart';
import 'package:feature_landing_screen/feature_landing_screen.dart';
import 'package:flutter/widgets.dart';

class LandingScreenPage extends BasePage {
  LandingScreenPage({required FetchSlidesUseCase fetchSlidesUseCase, required String authRouteName})
    : super(
        widget: LandingScreenView(fetchSlidesUseCase: fetchSlidesUseCase, authRouteName: authRouteName),
        key: const ValueKey(LandingScreenPage),
        transition: const SlideFromRightTransition(),
      );
}
