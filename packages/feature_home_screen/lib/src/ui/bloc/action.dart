part of 'bloc.build.dart';

@freezed
sealed class HomeScreenAction with _$HomeScreenAction {
  factory HomeScreenAction.someAction() = HomeScreenActionSomeAction;
}
