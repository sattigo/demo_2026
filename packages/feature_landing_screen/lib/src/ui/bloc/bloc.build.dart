import 'dart:async';

import 'package:core_bloc/core_bloc.dart';
import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';
import 'package:feature_landing_screen/src/domain/use_cases/fetch_slides_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.build.freezed.dart';

part 'action.dart';

part 'event.dart';

part 'state.dart';

const _slideCount = 3;
const _autoAdvanceInterval = Duration(seconds: 3);

class LandingScreenBloc extends BaseBloc<LandingScreenEvent, LandingScreenState, LandingScreenAction> {
  LandingScreenBloc({required FetchSlidesUseCase fetchSlidesUseCase})
    : _fetchSlidesUseCase = fetchSlidesUseCase,
      super(const LandingScreenState()) {
    on<_LandingScreenEventStarted>(_onStarted);
    on<_LandingScreenEventPageChanged>(_onPageChanged);
    on<_LandingScreenEventAutoAdvance>(_onAutoAdvance);
    on<_LandingScreenEventGetStartedTapped>(_onGetStartedTapped);
    on<_LandingScreenEventFetchSlides>(_onFetchSlides);
  }

  final FetchSlidesUseCase _fetchSlidesUseCase;
  Timer? _timer;

  void _onStarted(_LandingScreenEventStarted event, Emitter<LandingScreenState> emit) {
    _resetTimer();
    add(LandingScreenEvent.fetchSlides());
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

  Future<void> _onFetchSlides(_LandingScreenEventFetchSlides event, Emitter<LandingScreenState> emit) async {
    emit(state.copyWith(isLoading: true, failure: null));
    final result = await _fetchSlidesUseCase.call();
    switch (result) {
      case Success<List<LandingSlide>, Failure>(:final data):
        emit(state.copyWith(isLoading: false, slides: data, failure: null));
      case Error<List<LandingSlide>, Failure>(:final error):
        emit(state.copyWith(isLoading: false, failure: error));
    }
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
