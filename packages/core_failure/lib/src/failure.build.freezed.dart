// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.build.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// @nodoc


class FailureGeneral implements Failure {
  const FailureGeneral();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureGeneral);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.general()';
}


}




/// @nodoc


class FailureUserFriendly implements Failure {
  const FailureUserFriendly({this.title, final  List<String> errors = const [], final  Map<String, dynamic>? meta}): _errors = errors,_meta = meta;
  

 final  String? title;
 final  List<String> _errors;
@JsonKey() List<String> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}

 final  Map<String, dynamic>? _meta;
 Map<String, dynamic>? get meta {
  final value = _meta;
  if (value == null) return null;
  if (_meta is EqualUnmodifiableMapView) return _meta;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureUserFriendlyCopyWith<FailureUserFriendly> get copyWith => _$FailureUserFriendlyCopyWithImpl<FailureUserFriendly>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureUserFriendly&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._errors, _errors)&&const DeepCollectionEquality().equals(other._meta, _meta));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_errors),const DeepCollectionEquality().hash(_meta));

@override
String toString() {
  return 'Failure.userFriendly(title: $title, errors: $errors, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $FailureUserFriendlyCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $FailureUserFriendlyCopyWith(FailureUserFriendly value, $Res Function(FailureUserFriendly) _then) = _$FailureUserFriendlyCopyWithImpl;
@useResult
$Res call({
 String? title, List<String> errors, Map<String, dynamic>? meta
});




}
/// @nodoc
class _$FailureUserFriendlyCopyWithImpl<$Res>
    implements $FailureUserFriendlyCopyWith<$Res> {
  _$FailureUserFriendlyCopyWithImpl(this._self, this._then);

  final FailureUserFriendly _self;
  final $Res Function(FailureUserFriendly) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? errors = null,Object? meta = freezed,}) {
  return _then(FailureUserFriendly(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>,meta: freezed == meta ? _self._meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class FailureCustom implements Failure {
  const FailureCustom({required this.custom});
  

 final  CustomFailure custom;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCustomCopyWith<FailureCustom> get copyWith => _$FailureCustomCopyWithImpl<FailureCustom>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureCustom&&(identical(other.custom, custom) || other.custom == custom));
}


@override
int get hashCode => Object.hash(runtimeType,custom);

@override
String toString() {
  return 'Failure.custom(custom: $custom)';
}


}

/// @nodoc
abstract mixin class $FailureCustomCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $FailureCustomCopyWith(FailureCustom value, $Res Function(FailureCustom) _then) = _$FailureCustomCopyWithImpl;
@useResult
$Res call({
 CustomFailure custom
});




}
/// @nodoc
class _$FailureCustomCopyWithImpl<$Res>
    implements $FailureCustomCopyWith<$Res> {
  _$FailureCustomCopyWithImpl(this._self, this._then);

  final FailureCustom _self;
  final $Res Function(FailureCustom) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? custom = null,}) {
  return _then(FailureCustom(
custom: null == custom ? _self.custom : custom // ignore: cast_nullable_to_non_nullable
as CustomFailure,
  ));
}


}

// dart format on
