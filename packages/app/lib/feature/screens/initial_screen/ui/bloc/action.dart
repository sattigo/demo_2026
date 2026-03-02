part of 'bloc.build.dart';

@freezed
sealed class InitialScreenAction with _$InitialScreenAction {
  factory InitialScreenAction.someAction() = InitialScreenActionSomeAction;
}
