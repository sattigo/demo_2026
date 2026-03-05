import 'package:demo_2026/feature/navigation/ui/page/base_page.dart';
import 'package:demo_2026/feature/navigation/ui/transitions/slide_from_right_transition.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/use_cases/fetch_recipes_use_case.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/widgets/view.dart';
import 'package:flutter/foundation.dart';

class InitialScreenPage extends BasePage {
  InitialScreenPage({required FetchRecipesUseCase fetchRecipesUseCase})
    : super(
        widget: InitialScreenView(fetchRecipesUseCase: fetchRecipesUseCase),
        key: const ValueKey(InitialScreenPage),
        transition: const SlideFromRightTransition(),
      );
}
