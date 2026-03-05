import 'package:demo_2026/feature/screens/initial_screen/domain/use_cases/fetch_recipes_use_case.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/bloc/bloc.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/widgets/coordinator.dart';
import 'package:demo_2026/feature/screens/initial_screen/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialScreenView extends StatelessWidget {
  const InitialScreenView({required FetchRecipesUseCase fetchRecipesUseCase, super.key})
    : _fetchRecipesUseCase = fetchRecipesUseCase;

  final FetchRecipesUseCase _fetchRecipesUseCase;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InitialScreenBloc(fetchRecipesUseCase: _fetchRecipesUseCase),
      child: const InitialScreenCoordinator(child: InitialScreenWidget()),
    );
  }
}
