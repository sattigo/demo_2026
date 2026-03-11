import 'package:core_l10n/core_l10n.dart';
import 'package:feature_home_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

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
                onPressed: () => BlocProvider.of<HomeScreenBloc>(context).add(HomeScreenEvent.fetchRecipes()),
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
                    child: Text(S.of(context).homeScreen_clickable_original_toMapScreenButton),
                    onPressed: () =>
                        BlocProvider.of<HomeScreenBloc>(context).add(HomeScreenEvent.goToMapScreenTapped()),
                  ),
                  const SizedBox(height: 8),
                  MaterialButton(
                    child: Text(S.of(context).homeScreen_clickable_original_fetchRecipesButton),
                    onPressed: () => BlocProvider.of<HomeScreenBloc>(context).add(HomeScreenEvent.fetchRecipes()),
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
