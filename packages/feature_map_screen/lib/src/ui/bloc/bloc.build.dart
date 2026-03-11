import 'package:core_bloc/core_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action.dart';
part 'bloc.build.freezed.dart';
part 'event.dart';
part 'state.dart';

class MapScreenBloc extends BaseBloc<MapScreenEvent, MapScreenState, MapScreenAction> {
  MapScreenBloc() : super(const MapScreenState()) {
    on<_MapScreenEventSomeEvent>(_onSomeEvent);
  }

  void _onSomeEvent(_MapScreenEventSomeEvent event, Emitter<MapScreenState> emit) {
    emitAction(MapScreenAction.someAction());
  }
}
