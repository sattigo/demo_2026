import 'dart:async';

import 'package:core_bloc/core_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.build.freezed.dart';
part 'action.dart';
part 'event.dart';
part 'state.dart';

const _slideCount = 3;
const _autoAdvanceInterval = Duration(seconds: 3);

class LandingScreenBloc extends BaseBloc<LandingScreenEvent, LandingScreenState, LandingScreenAction> {
  LandingScreenBloc() : super(const LandingScreenState()) {
    on<_LandingScreenEventStarted>(_onStarted);
    on<_LandingScreenEventPageChanged>(_onPageChanged);
    on<_LandingScreenEventAutoAdvance>(_onAutoAdvance);
    on<_LandingScreenEventGetStartedTapped>(_onGetStartedTapped);
  }

  Timer? _timer;

  void _onStarted(_LandingScreenEventStarted event, Emitter<LandingScreenState> emit) {
    _resetTimer();
  }

  void _onPageChanged(_LandingScreenEventPageChanged event, Emitter<LandingScreenState> emit) {
    emit(state.copyWith(currentPage: event.page));
    _resetTimer();
  }

  void _onAutoAdvance(_LandingScreenEventAutoAdvance event, Emitter<LandingScreenState> emit) {
    final nextPage = (state.currentPage + 1) % _slideCount;
    emit(state.copyWith(currentPage: nextPage));
  }

  void _onGetStartedTapped(_LandingScreenEventGetStartedTapped event, Emitter<LandingScreenState> emit) {
    emitAction(LandingScreenAction.navigateToAuth());
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(_autoAdvanceInterval, (_) => add(LandingScreenEvent.autoAdvance()));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
