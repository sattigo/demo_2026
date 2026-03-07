import 'package:demo_2026/feature/navigation/ui/page/base_page.dart';
import 'package:demo_2026/feature/navigation/ui/transitions/slide_from_right_transition.dart';
import 'package:feature_home_screen/feature_home_screen.dart';
import 'package:flutter/widgets.dart';

class HomeScreenPage extends BasePage {
  HomeScreenPage({
    required FetchRecipesUseCase fetchRecipesUseCase,
    required void Function(BuildContext context) onGoToForkScreen,
  }) : super(
         widget: HomeScreenView(fetchRecipesUseCase: fetchRecipesUseCase, onGoToForkScreen: onGoToForkScreen),
         key: const ValueKey(HomeScreenPage),
         transition: const SlideFromRightTransition(),
       );
}
