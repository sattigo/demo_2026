import 'package:core_l10n/core_l10n.dart';
import 'package:feature_home_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({required void Function(BuildContext context) onGoToForkScreen, super.key})
    : _onGoToForkScreen = onGoToForkScreen;

  final void Function(BuildContext context) _onGoToForkScreen;

  Future<void> _onButtonPressed(BuildContext context) async {
    if (context.mounted) {
      _onGoToForkScreen(context);
    }
  }

  Future<void> _onFetchRecipes(BuildContext context) async {
    if (context.mounted) {
      BlocProvider.of<HomeScreenBloc>(context).add(HomeScreenEvent.fetchRecipes());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).homeScreen_notClickable_original_appBarText)),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        bloc: BlocProvider.of<HomeScreenBloc>(context),
        builder: (blocContext, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.failure != null) {
            return Center(
              child: MaterialButton(
                child: Text(S.of(context).homeScreen_clickable_original_tryAgainButton),
                onPressed: () => _onFetchRecipes(context),
              ),
            );
          } else {
            final recipesList = state.recipesList;
            return SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    child: Text(S.of(context).homeScreen_clickable_original_toForkScreenButton),
                    onPressed: () => _onButtonPressed(context),
                  ),
                  const SizedBox(height: 8),
                  MaterialButton(
                    child: Text(S.of(context).homeScreen_clickable_original_fetchRecipesButton),
                    onPressed: () => _onFetchRecipes(context),
                  ),
                  if (recipesList != null && recipesList.isNotEmpty) Text('${recipesList.length}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
