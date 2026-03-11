import 'package:core_bloc/core_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'action.dart';
part 'bloc.build.freezed.dart';
part 'event.dart';
part 'state.dart';

class MapScreenBloc extends BaseBloc<MapScreenEvent, MapScreenState, MapScreenAction> {
  MapScreenBloc() : super(const MapScreenState()) {
    on<_MapScreenEventMapCreated>(_onMapCreated);
  }

  void _onMapCreated(_MapScreenEventMapCreated event, Emitter<MapScreenState> emit) {
    emit(state.copyWith(mapController: event.controller));
  }
}
