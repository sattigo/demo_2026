part of 'bloc.build.dart';

@freezed
sealed class MapScreenAction with _$MapScreenAction {
  factory MapScreenAction.placeholder() = MapScreenActionPlaceholder;
}
