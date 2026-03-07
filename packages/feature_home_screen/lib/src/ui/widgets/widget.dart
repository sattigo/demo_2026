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
      appBar: AppBar(title: const Text('Initial Screen')),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        bloc: BlocProvider.of<HomeScreenBloc>(context),
        builder: (blocContext, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.failure != null) {
            return Center(
              child: MaterialButton(child: const Text('Try again'), onPressed: () => _onFetchRecipes(context)),
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
                  MaterialButton(child: const Text('To Fork Screen'), onPressed: () => _onButtonPressed(context)),
                  const SizedBox(height: 8),
                  MaterialButton(child: const Text('On fetch recipes'), onPressed: () => _onFetchRecipes(context)),
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
