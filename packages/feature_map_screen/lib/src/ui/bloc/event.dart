part of 'bloc.build.dart';

@freezed
sealed class MapScreenEvent with _$MapScreenEvent {
  factory MapScreenEvent.mapCreated(YandexMapController controller) = _MapScreenEventMapCreated;
  factory MapScreenEvent.locationPermissionRequested() = _MapScreenEventLocationPermissionRequested;
  factory MapScreenEvent.zoomInTapped() = _MapScreenEventZoomInTapped;
  factory MapScreenEvent.zoomOutTapped() = _MapScreenEventZoomOutTapped;
}
