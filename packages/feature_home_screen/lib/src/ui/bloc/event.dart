part of 'bloc.build.dart';

@freezed
sealed class HomeScreenEvent with _$HomeScreenEvent {
  factory HomeScreenEvent.someEvent() = _HomeScreenEventSomeEvent;
  factory HomeScreenEvent.fetchRecipes() = _HomeScreenEventFetchRecipes;
  factory HomeScreenEvent.goToMapScreenTapped() = _HomeScreenEventGoToMapScreenTapped;
}
