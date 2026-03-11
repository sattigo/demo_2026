part of 'bloc.build.dart';

@freezed
abstract class MapScreenState with _$MapScreenState {
  const factory MapScreenState({YandexMapController? mapController}) = _MapScreenState;
}
