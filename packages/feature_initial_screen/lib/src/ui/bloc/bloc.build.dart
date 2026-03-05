import 'package:core_bloc/core_bloc.dart';
import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_initial_screen/src/domain/models/recipe.build.dart';
import 'package:feature_initial_screen/src/domain/use_cases/fetch_recipes_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action.dart';
part 'bloc.build.freezed.dart';
part 'event.dart';
part 'state.dart';

class InitialScreenBloc extends BaseBloc<InitialScreenEvent, InitialScreenState, InitialScreenAction> {
  InitialScreenBloc({required FetchRecipesUseCase fetchRecipesUseCase})
    : _fetchRecipesUseCase = fetchRecipesUseCase,
      super(const InitialScreenState()) {
    on<_InitialScreenEventSomeEvent>(_onSomeEvent);
    on<_InitialScreenEventFetchRecipes>(_onFetchRecipes);
  }

  final FetchRecipesUseCase _fetchRecipesUseCase;

  void _onSomeEvent(_InitialScreenEventSomeEvent event, Emitter<InitialScreenState> emit) {
    emitAction(InitialScreenAction.someAction());
  }

  Future<void> _onFetchRecipes(_InitialScreenEventFetchRecipes event, Emitter<InitialScreenState> emit) async {
    emit(state.copyWith(isLoading: true, failure: null));
    final result = await _fetchRecipesUseCase.call();
    switch (result) {
      case Success<List<Recipe>, Failure>(:final data):
        emit(state.copyWith(isLoading: false, recipesList: data, failure: null));
      case Error<List<Recipe>, Failure>(:final error):
        emit(state.copyWith(isLoading: false, failure: error));
    }
  }
}
