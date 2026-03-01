import 'package:demo_2026/feature/base_bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.build.freezed.dart';

class InitialScreenBloc extends BaseBloc<InitialScreenEvent, InitialScreenState, InitialScreenAction> {
  InitialScreenBloc() : super(const InitialScreenState()) {
    on<_InitialScreenEventSomeEvent>(_onSomeEvent);
  }

  void _onSomeEvent(_InitialScreenEventSomeEvent event, Emitter<InitialScreenState> emit) {
    emitAction(InitialScreenAction.someAction());
  }
}
