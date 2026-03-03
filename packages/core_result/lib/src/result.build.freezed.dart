// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.build.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Result<SUCCESS_TYPE,FAILURE_TYPE> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<SUCCESS_TYPE, FAILURE_TYPE>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Result<$SUCCESS_TYPE, $FAILURE_TYPE>()';
}


}

/// @nodoc
class $ResultCopyWith<SUCCESS_TYPE,FAILURE_TYPE,$Res>  {
$ResultCopyWith(Result<SUCCESS_TYPE, FAILURE_TYPE> _, $Res Function(Result<SUCCESS_TYPE, FAILURE_TYPE>) __);
}


/// @nodoc


class Success<SUCCESS_TYPE,FAILURE_TYPE> implements Result<SUCCESS_TYPE, FAILURE_TYPE> {
  const Success(this.data);
  

 final  SUCCESS_TYPE data;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<SUCCESS_TYPE, FAILURE_TYPE, Success<SUCCESS_TYPE, FAILURE_TYPE>> get copyWith => _$SuccessCopyWithImpl<SUCCESS_TYPE, FAILURE_TYPE, Success<SUCCESS_TYPE, FAILURE_TYPE>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<SUCCESS_TYPE, FAILURE_TYPE>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Result<$SUCCESS_TYPE, $FAILURE_TYPE>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<SUCCESS_TYPE,FAILURE_TYPE,$Res> implements $ResultCopyWith<SUCCESS_TYPE, FAILURE_TYPE, $Res> {
  factory $SuccessCopyWith(Success<SUCCESS_TYPE, FAILURE_TYPE> value, $Res Function(Success<SUCCESS_TYPE, FAILURE_TYPE>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 SUCCESS_TYPE data
});




}
/// @nodoc
class _$SuccessCopyWithImpl<SUCCESS_TYPE,FAILURE_TYPE,$Res>
    implements $SuccessCopyWith<SUCCESS_TYPE, FAILURE_TYPE, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<SUCCESS_TYPE, FAILURE_TYPE> _self;
  final $Res Function(Success<SUCCESS_TYPE, FAILURE_TYPE>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Success<SUCCESS_TYPE, FAILURE_TYPE>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SUCCESS_TYPE,
  ));
}


}

/// @nodoc


class Error<SUCCESS_TYPE,FAILURE_TYPE> implements Result<SUCCESS_TYPE, FAILURE_TYPE> {
  const Error(this.error);
  

 final  FAILURE_TYPE error;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<SUCCESS_TYPE, FAILURE_TYPE, Error<SUCCESS_TYPE, FAILURE_TYPE>> get copyWith => _$ErrorCopyWithImpl<SUCCESS_TYPE, FAILURE_TYPE, Error<SUCCESS_TYPE, FAILURE_TYPE>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<SUCCESS_TYPE, FAILURE_TYPE>&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'Result<$SUCCESS_TYPE, $FAILURE_TYPE>.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<SUCCESS_TYPE,FAILURE_TYPE,$Res> implements $ResultCopyWith<SUCCESS_TYPE, FAILURE_TYPE, $Res> {
  factory $ErrorCopyWith(Error<SUCCESS_TYPE, FAILURE_TYPE> value, $Res Function(Error<SUCCESS_TYPE, FAILURE_TYPE>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 FAILURE_TYPE error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<SUCCESS_TYPE,FAILURE_TYPE,$Res>
    implements $ErrorCopyWith<SUCCESS_TYPE, FAILURE_TYPE, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<SUCCESS_TYPE, FAILURE_TYPE> _self;
  final $Res Function(Error<SUCCESS_TYPE, FAILURE_TYPE>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(Error<SUCCESS_TYPE, FAILURE_TYPE>(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as FAILURE_TYPE,
  ));
}


}

// dart format on
