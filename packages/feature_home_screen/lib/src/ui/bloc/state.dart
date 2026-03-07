part of 'bloc.build.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({@Default(false) bool isLoading, Failure? failure, List<Recipe>? recipesList}) =
      _HomeScreenState;
}
