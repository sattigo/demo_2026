part of 'bloc.build.dart';

@freezed
sealed class InitialScreenEvent with _$InitialScreenEvent {
  factory InitialScreenEvent.someEvent() = _InitialScreenEventSomeEvent;
}
