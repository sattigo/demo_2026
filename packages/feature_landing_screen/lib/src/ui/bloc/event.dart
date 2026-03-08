part of 'bloc.build.dart';

@freezed
sealed class LandingScreenEvent with _$LandingScreenEvent {
  factory LandingScreenEvent.started() = _LandingScreenEventStarted;
  factory LandingScreenEvent.pageChanged(int page) = _LandingScreenEventPageChanged;
  factory LandingScreenEvent.autoAdvance() = _LandingScreenEventAutoAdvance;
  factory LandingScreenEvent.getStartedTapped() = _LandingScreenEventGetStartedTapped;
  factory LandingScreenEvent.fetchSlides() = _LandingScreenEventFetchSlides;
}
