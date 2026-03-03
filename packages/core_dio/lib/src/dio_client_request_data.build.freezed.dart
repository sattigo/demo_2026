// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio_client_request_data.build.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DioClientRequestData {

 Object get data;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioClientRequestData&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DioClientRequestData(data: $data)';
}


}

/// @nodoc
class $DioClientRequestDataCopyWith<$Res>  {
$DioClientRequestDataCopyWith(DioClientRequestData _, $Res Function(DioClientRequestData) __);
}


/// @nodoc


class DioMapData implements DioClientRequestData {
  const DioMapData(final  Map<String, dynamic> data): _data = data;
  

 final  Map<String, dynamic> _data;
@override Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of DioClientRequestData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioMapDataCopyWith<DioMapData> get copyWith => _$DioMapDataCopyWithImpl<DioMapData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioMapData&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'DioClientRequestData.map(data: $data)';
}


}

/// @nodoc
abstract mixin class $DioMapDataCopyWith<$Res> implements $DioClientRequestDataCopyWith<$Res> {
  factory $DioMapDataCopyWith(DioMapData value, $Res Function(DioMapData) _then) = _$DioMapDataCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> data
});




}
/// @nodoc
class _$DioMapDataCopyWithImpl<$Res>
    implements $DioMapDataCopyWith<$Res> {
  _$DioMapDataCopyWithImpl(this._self, this._then);

  final DioMapData _self;
  final $Res Function(DioMapData) _then;

/// Create a copy of DioClientRequestData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(DioMapData(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class DioFormData implements DioClientRequestData {
  const DioFormData(this.data);
  

@override final  FormData data;

/// Create a copy of DioClientRequestData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioFormDataCopyWith<DioFormData> get copyWith => _$DioFormDataCopyWithImpl<DioFormData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DioFormData&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'DioClientRequestData.formData(data: $data)';
}


}

/// @nodoc
abstract mixin class $DioFormDataCopyWith<$Res> implements $DioClientRequestDataCopyWith<$Res> {
  factory $DioFormDataCopyWith(DioFormData value, $Res Function(DioFormData) _then) = _$DioFormDataCopyWithImpl;
@useResult
$Res call({
 FormData data
});




}
/// @nodoc
class _$DioFormDataCopyWithImpl<$Res>
    implements $DioFormDataCopyWith<$Res> {
  _$DioFormDataCopyWithImpl(this._self, this._then);

  final DioFormData _self;
  final $Res Function(DioFormData) _then;

/// Create a copy of DioClientRequestData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(DioFormData(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FormData,
  ));
}


}

// dart format on
