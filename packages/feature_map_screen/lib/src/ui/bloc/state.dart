part of 'bloc.build.dart';

@freezed
abstract class MapScreenState with _$MapScreenState {
  const factory MapScreenState({
    YandexMapController? mapController,
    @Default(false) bool isLocationEnabled,
    Point? tappedPoint,
    @Default([]) List<MapObject<dynamic>> mapObjects,
  }) = _MapScreenState;
}
