import 'package:demo_2026/feature/navigation/ui/page/base_page.dart';
import 'package:demo_2026/feature/navigation/ui/transitions/slide_from_right_transition.dart';
import 'package:feature_initial_screen/feature_initial_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InitialScreenPage extends BasePage {
  InitialScreenPage({
    required FetchRecipesUseCase fetchRecipesUseCase,
    required void Function(BuildContext context) onGoToForkScreen,
  }) : super(
         widget: InitialScreenView(
           fetchRecipesUseCase: fetchRecipesUseCase,
           onGoToForkScreen: onGoToForkScreen,
         ),
         key: const ValueKey(InitialScreenPage),
         transition: const SlideFromRightTransition(),
       );
}
