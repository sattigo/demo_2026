import 'package:core_navigation/core_navigation.dart';
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
