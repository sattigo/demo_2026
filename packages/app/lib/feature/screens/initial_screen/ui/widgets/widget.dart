import 'package:demo_2026/feature/navigation/router/extension.dart';
import 'package:demo_2026/feature/screens/fork_screen/route.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/bloc/bloc.build.dart';
import 'package:demo_2026/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialScreenWidget extends StatelessWidget {
  const InitialScreenWidget({super.key});

  Future<void> _onButtonPressed(BuildContext context) async {
    if (context.mounted) {
      await ForkScreenRoute().pushNamed(context);
    }
  }

  Future<void> _onFetchRecipes(BuildContext context) async {
    if (context.mounted) {
      BlocProvider.of<InitialScreenBloc>(context).add(InitialScreenEvent.fetchRecipes());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).initialScreen_notClickable_original_appBarText)),
      body: BlocBuilder<InitialScreenBloc, InitialScreenState>(
        bloc: BlocProvider.of<InitialScreenBloc>(context),
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
                  MaterialButton(
                    child: Text(S.of(context).initialScreen_clickable_original_toForkScreenButton),
                    onPressed: () => _onButtonPressed(context),
                  ),
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
