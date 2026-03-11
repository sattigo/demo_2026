part of 'bloc.build.dart';

@freezed
sealed class MapScreenEvent with _$MapScreenEvent {
  factory MapScreenEvent.someEvent() = _MapScreenEventSomeEvent;
}
