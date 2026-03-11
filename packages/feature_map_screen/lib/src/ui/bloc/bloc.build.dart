import 'package:core_bloc/core_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'action.dart';
part 'bloc.build.freezed.dart';
part 'event.dart';
part 'state.dart';

class MapScreenBloc extends BaseBloc<MapScreenEvent, MapScreenState, MapScreenAction> {
  MapScreenBloc() : super(const MapScreenState()) {
    on<_MapScreenEventMapCreated>(_onMapCreated);
    on<_MapScreenEventLocationPermissionRequested>(_onLocationPermissionRequested);
    on<_MapScreenEventZoomInTapped>(_onZoomInTapped);
    on<_MapScreenEventZoomOutTapped>(_onZoomOutTapped);
  }

  void _onMapCreated(_MapScreenEventMapCreated event, Emitter<MapScreenState> emit) {
    emit(state.copyWith(mapController: event.controller));
  }

  Future<void> _onLocationPermissionRequested(
    _MapScreenEventLocationPermissionRequested event,
    Emitter<MapScreenState> emit,
  ) async {
    final status = await Permission.locationWhenInUse.request();
    final granted = status.isGranted;
    if (granted) {
      await state.mapController?.toggleUserLayer(visible: true);
    }
    emit(state.copyWith(isLocationEnabled: granted));
  }

  Future<void> _onZoomInTapped(_MapScreenEventZoomInTapped event, Emitter<MapScreenState> emit) async {
    await state.mapController?.moveCamera(CameraUpdate.zoomIn());
  }

  Future<void> _onZoomOutTapped(_MapScreenEventZoomOutTapped event, Emitter<MapScreenState> emit) async {
    await state.mapController?.moveCamera(CameraUpdate.zoomOut());
  }
}
