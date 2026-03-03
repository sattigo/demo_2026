// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio_failure.build.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DioFailure {

 Response<dynamic>? get response;
/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureCopyWith<DioFailure> get copyWith => _$DioFailureCopyWithImpl<DioFailure>(this as DioFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailure&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureCopyWith<$Res>  {
  factory $DioFailureCopyWith(DioFailure value, $Res Function(DioFailure) _then) = _$DioFailureCopyWithImpl;
@useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureCopyWithImpl<$Res>
    implements $DioFailureCopyWith<$Res> {
  _$DioFailureCopyWithImpl(this._self, this._then);

  final DioFailure _self;
  final $Res Function(DioFailure) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? response = freezed,}) {
  return _then(_self.copyWith(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}

}


/// @nodoc


class DioFailureBadResponse implements DioFailure {
  const DioFailureBadResponse({this.response});
  

@override final  Response<dynamic>? response;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureBadResponseCopyWith<DioFailureBadResponse> get copyWith => _$DioFailureBadResponseCopyWithImpl<DioFailureBadResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailureBadResponse&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure.badResponse(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureBadResponseCopyWith<$Res> implements $DioFailureCopyWith<$Res> {
  factory $DioFailureBadResponseCopyWith(DioFailureBadResponse value, $Res Function(DioFailureBadResponse) _then) = _$DioFailureBadResponseCopyWithImpl;
@override @useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureBadResponseCopyWithImpl<$Res>
    implements $DioFailureBadResponseCopyWith<$Res> {
  _$DioFailureBadResponseCopyWithImpl(this._self, this._then);

  final DioFailureBadResponse _self;
  final $Res Function(DioFailureBadResponse) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(DioFailureBadResponse(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}


}

/// @nodoc


class DioFailureConnectTimeout implements DioFailure {
  const DioFailureConnectTimeout({this.response});
  

@override final  Response<dynamic>? response;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureConnectTimeoutCopyWith<DioFailureConnectTimeout> get copyWith => _$DioFailureConnectTimeoutCopyWithImpl<DioFailureConnectTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailureConnectTimeout&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure.connectTimeout(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureConnectTimeoutCopyWith<$Res> implements $DioFailureCopyWith<$Res> {
  factory $DioFailureConnectTimeoutCopyWith(DioFailureConnectTimeout value, $Res Function(DioFailureConnectTimeout) _then) = _$DioFailureConnectTimeoutCopyWithImpl;
@override @useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureConnectTimeoutCopyWithImpl<$Res>
    implements $DioFailureConnectTimeoutCopyWith<$Res> {
  _$DioFailureConnectTimeoutCopyWithImpl(this._self, this._then);

  final DioFailureConnectTimeout _self;
  final $Res Function(DioFailureConnectTimeout) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(DioFailureConnectTimeout(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}


}

/// @nodoc


class DioFailureSendTimeout implements DioFailure {
  const DioFailureSendTimeout({this.response});
  

@override final  Response<dynamic>? response;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureSendTimeoutCopyWith<DioFailureSendTimeout> get copyWith => _$DioFailureSendTimeoutCopyWithImpl<DioFailureSendTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailureSendTimeout&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure.sendTimeout(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureSendTimeoutCopyWith<$Res> implements $DioFailureCopyWith<$Res> {
  factory $DioFailureSendTimeoutCopyWith(DioFailureSendTimeout value, $Res Function(DioFailureSendTimeout) _then) = _$DioFailureSendTimeoutCopyWithImpl;
@override @useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureSendTimeoutCopyWithImpl<$Res>
    implements $DioFailureSendTimeoutCopyWith<$Res> {
  _$DioFailureSendTimeoutCopyWithImpl(this._self, this._then);

  final DioFailureSendTimeout _self;
  final $Res Function(DioFailureSendTimeout) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(DioFailureSendTimeout(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}


}

/// @nodoc


class DioFailureReceiveTimeout implements DioFailure {
  const DioFailureReceiveTimeout({this.response});
  

@override final  Response<dynamic>? response;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureReceiveTimeoutCopyWith<DioFailureReceiveTimeout> get copyWith => _$DioFailureReceiveTimeoutCopyWithImpl<DioFailureReceiveTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailureReceiveTimeout&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure.receiveTimeout(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureReceiveTimeoutCopyWith<$Res> implements $DioFailureCopyWith<$Res> {
  factory $DioFailureReceiveTimeoutCopyWith(DioFailureReceiveTimeout value, $Res Function(DioFailureReceiveTimeout) _then) = _$DioFailureReceiveTimeoutCopyWithImpl;
@override @useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureReceiveTimeoutCopyWithImpl<$Res>
    implements $DioFailureReceiveTimeoutCopyWith<$Res> {
  _$DioFailureReceiveTimeoutCopyWithImpl(this._self, this._then);

  final DioFailureReceiveTimeout _self;
  final $Res Function(DioFailureReceiveTimeout) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(DioFailureReceiveTimeout(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}


}

/// @nodoc


class DioFailureCancelDio implements DioFailure {
  const DioFailureCancelDio({this.response});
  

@override final  Response<dynamic>? response;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureCancelDioCopyWith<DioFailureCancelDio> get copyWith => _$DioFailureCancelDioCopyWithImpl<DioFailureCancelDio>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailureCancelDio&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure.cancel(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureCancelDioCopyWith<$Res> implements $DioFailureCopyWith<$Res> {
  factory $DioFailureCancelDioCopyWith(DioFailureCancelDio value, $Res Function(DioFailureCancelDio) _then) = _$DioFailureCancelDioCopyWithImpl;
@override @useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureCancelDioCopyWithImpl<$Res>
    implements $DioFailureCancelDioCopyWith<$Res> {
  _$DioFailureCancelDioCopyWithImpl(this._self, this._then);

  final DioFailureCancelDio _self;
  final $Res Function(DioFailureCancelDio) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(DioFailureCancelDio(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}


}

/// @nodoc


class DioFailureUnknownDio implements DioFailure {
  const DioFailureUnknownDio({this.response});
  

@override final  Response<dynamic>? response;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureUnknownDioCopyWith<DioFailureUnknownDio> get copyWith => _$DioFailureUnknownDioCopyWithImpl<DioFailureUnknownDio>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailureUnknownDio&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure.unknown(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureUnknownDioCopyWith<$Res> implements $DioFailureCopyWith<$Res> {
  factory $DioFailureUnknownDioCopyWith(DioFailureUnknownDio value, $Res Function(DioFailureUnknownDio) _then) = _$DioFailureUnknownDioCopyWithImpl;
@override @useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureUnknownDioCopyWithImpl<$Res>
    implements $DioFailureUnknownDioCopyWith<$Res> {
  _$DioFailureUnknownDioCopyWithImpl(this._self, this._then);

  final DioFailureUnknownDio _self;
  final $Res Function(DioFailureUnknownDio) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(DioFailureUnknownDio(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}


}

/// @nodoc


class DioFailureBadCertificate implements DioFailure {
  const DioFailureBadCertificate({this.response});
  

@override final  Response<dynamic>? response;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureBadCertificateCopyWith<DioFailureBadCertificate> get copyWith => _$DioFailureBadCertificateCopyWithImpl<DioFailureBadCertificate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailureBadCertificate&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure.badCertificate(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureBadCertificateCopyWith<$Res> implements $DioFailureCopyWith<$Res> {
  factory $DioFailureBadCertificateCopyWith(DioFailureBadCertificate value, $Res Function(DioFailureBadCertificate) _then) = _$DioFailureBadCertificateCopyWithImpl;
@override @useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureBadCertificateCopyWithImpl<$Res>
    implements $DioFailureBadCertificateCopyWith<$Res> {
  _$DioFailureBadCertificateCopyWithImpl(this._self, this._then);

  final DioFailureBadCertificate _self;
  final $Res Function(DioFailureBadCertificate) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(DioFailureBadCertificate(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}


}

/// @nodoc


class DioFailureConnectionError implements DioFailure {
  const DioFailureConnectionError({this.response});
  

@override final  Response<dynamic>? response;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFailureConnectionErrorCopyWith<DioFailureConnectionError> get copyWith => _$DioFailureConnectionErrorCopyWithImpl<DioFailureConnectionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFailureConnectionError&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'DioFailure.connectionError(response: $response)';
}


}

/// @nodoc
abstract mixin class $DioFailureConnectionErrorCopyWith<$Res> implements $DioFailureCopyWith<$Res> {
  factory $DioFailureConnectionErrorCopyWith(DioFailureConnectionError value, $Res Function(DioFailureConnectionError) _then) = _$DioFailureConnectionErrorCopyWithImpl;
@override @useResult
$Res call({
 Response<dynamic>? response
});




}
/// @nodoc
class _$DioFailureConnectionErrorCopyWithImpl<$Res>
    implements $DioFailureConnectionErrorCopyWith<$Res> {
  _$DioFailureConnectionErrorCopyWithImpl(this._self, this._then);

  final DioFailureConnectionError _self;
  final $Res Function(DioFailureConnectionError) _then;

/// Create a copy of DioFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(DioFailureConnectionError(
response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response<dynamic>?,
  ));
}


}

// dart format on
