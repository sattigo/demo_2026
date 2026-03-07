import 'package:demo_2026/feature/navigation/ui/page/base_page.dart';
import 'package:demo_2026/feature/navigation/ui/transitions/slide_from_right_transition.dart';
import 'package:feature_auth_screen/feature_auth_screen.dart';
import 'package:flutter/widgets.dart';

class AuthScreenPage extends BasePage {
  AuthScreenPage({
    required LoginUseCase loginUseCase,
    required void Function(BuildContext context) onNavigateToHome,
  }) : super(
         widget: AuthScreenView(loginUseCase: loginUseCase, onNavigateToHome: onNavigateToHome),
         key: const ValueKey(AuthScreenPage),
         transition: const SlideFromRightTransition(),
       );
}
