import 'package:core_navigation/core_navigation.dart';
import 'package:feature_auth_screen/feature_auth_screen.dart';
import 'package:flutter/widgets.dart';

class AuthScreenPage extends BasePage {
  AuthScreenPage({required LoginUseCase loginUseCase, required String homeRouteName})
    : super(
        widget: AuthScreenView(loginUseCase: loginUseCase, homeRouteName: homeRouteName),
        key: const ValueKey(AuthScreenPage),
        transition: const SlideFromRightTransition(),
      );
}
