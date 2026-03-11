import 'package:feature_home_screen/src/domain/use_cases/fetch_recipes_use_case.dart';
import 'package:feature_home_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_home_screen/src/ui/widgets/coordinator.dart';
import 'package:feature_home_screen/src/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({required FetchRecipesUseCase fetchRecipesUseCase, required String mapRouteName, super.key})
    : _fetchRecipesUseCase = fetchRecipesUseCase,
      _mapRouteName = mapRouteName;

  final FetchRecipesUseCase _fetchRecipesUseCase;
  final String _mapRouteName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenBloc(fetchRecipesUseCase: _fetchRecipesUseCase),
      child: HomeScreenCoordinator(mapRouteName: _mapRouteName, child: const HomeScreenWidget()),
    );
  }
}
