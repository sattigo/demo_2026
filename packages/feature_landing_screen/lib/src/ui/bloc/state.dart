part of 'bloc.build.dart';

@freezed
abstract class LandingScreenState with _$LandingScreenState {
  const factory LandingScreenState({@Default(0) int currentPage}) = _LandingScreenState;
}
