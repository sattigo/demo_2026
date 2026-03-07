import 'package:core_navigation/core_navigation.dart';
import 'package:feature_splash_screen/feature_splash_screen.dart';
import 'package:flutter/widgets.dart';

class SplashScreenPage extends BasePage {
  SplashScreenPage({required void Function(BuildContext context) onNavigateToLanding})
    : super(
        widget: SplashScreenView(onNavigateToLanding: onNavigateToLanding),
        key: const ValueKey(SplashScreenPage),
        transition: const FadePageTransition(),
        duration: const Duration(milliseconds: 600),
      );
}
