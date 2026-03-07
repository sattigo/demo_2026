import 'package:core_bloc/core_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.build.freezed.dart';
part 'action.dart';
part 'event.dart';
part 'state.dart';

class SplashScreenBloc extends BaseBloc<SplashScreenEvent, SplashScreenState, SplashScreenAction> {
  SplashScreenBloc() : super(const SplashScreenState()) {
    on<_SplashScreenEventStarted>(_onStarted);
    on<_SplashScreenEventFadeInCompleted>(_onFadeInCompleted);
    on<_SplashScreenEventHoldCompleted>(_onHoldCompleted);
    on<_SplashScreenEventFadeOutCompleted>(_onFadeOutCompleted);
  }

  void _onStarted(_SplashScreenEventStarted event, Emitter<SplashScreenState> emit) {
    emit(state.copyWith(opacity: 1, phase: SplashAnimationPhase.fadeIn));
  }

  Future<void> _onFadeInCompleted(_SplashScreenEventFadeInCompleted event, Emitter<SplashScreenState> emit) async {
    emit(state.copyWith(phase: SplashAnimationPhase.hold));
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    add(SplashScreenEvent.holdCompleted());
  }

  void _onHoldCompleted(_SplashScreenEventHoldCompleted event, Emitter<SplashScreenState> emit) {
    emit(state.copyWith(opacity: 0, phase: SplashAnimationPhase.fadeOut));
  }

  void _onFadeOutCompleted(_SplashScreenEventFadeOutCompleted event, Emitter<SplashScreenState> emit) {
    emit(state.copyWith(phase: SplashAnimationPhase.done));
    emitAction(SplashScreenAction.navigateToLanding());
  }
}
