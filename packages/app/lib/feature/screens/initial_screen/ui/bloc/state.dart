part of 'bloc.build.dart';

@freezed
abstract class InitialScreenState with _$InitialScreenState {
   const factory InitialScreenState({@Default(false) bool isLoading}) = _InitialScreenState;
}
