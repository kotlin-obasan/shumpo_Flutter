// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'instagram_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InstagramModel _$InstagramModelFromJson(Map<String, dynamic> json) {
  return _InstagramModel.fromJson(json);
}

/// @nodoc
mixin _$InstagramModel {
  List<Map<String, dynamic>>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstagramModelCopyWith<InstagramModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstagramModelCopyWith<$Res> {
  factory $InstagramModelCopyWith(
          InstagramModel value, $Res Function(InstagramModel) then) =
      _$InstagramModelCopyWithImpl<$Res, InstagramModel>;
  @useResult
  $Res call({List<Map<String, dynamic>>? data});
}

/// @nodoc
class _$InstagramModelCopyWithImpl<$Res, $Val extends InstagramModel>
    implements $InstagramModelCopyWith<$Res> {
  _$InstagramModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstagramModelCopyWith<$Res>
    implements $InstagramModelCopyWith<$Res> {
  factory _$$_InstagramModelCopyWith(
          _$_InstagramModel value, $Res Function(_$_InstagramModel) then) =
      __$$_InstagramModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>>? data});
}

/// @nodoc
class __$$_InstagramModelCopyWithImpl<$Res>
    extends _$InstagramModelCopyWithImpl<$Res, _$_InstagramModel>
    implements _$$_InstagramModelCopyWith<$Res> {
  __$$_InstagramModelCopyWithImpl(
      _$_InstagramModel _value, $Res Function(_$_InstagramModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_InstagramModel(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InstagramModel implements _InstagramModel {
  _$_InstagramModel({final List<Map<String, dynamic>>? data}) : _data = data;

  factory _$_InstagramModel.fromJson(Map<String, dynamic> json) =>
      _$$_InstagramModelFromJson(json);

  final List<Map<String, dynamic>>? _data;
  @override
  List<Map<String, dynamic>>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InstagramModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InstagramModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstagramModelCopyWith<_$_InstagramModel> get copyWith =>
      __$$_InstagramModelCopyWithImpl<_$_InstagramModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InstagramModelToJson(
      this,
    );
  }
}

abstract class _InstagramModel implements InstagramModel {
  factory _InstagramModel({final List<Map<String, dynamic>>? data}) =
      _$_InstagramModel;

  factory _InstagramModel.fromJson(Map<String, dynamic> json) =
      _$_InstagramModel.fromJson;

  @override
  List<Map<String, dynamic>>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_InstagramModelCopyWith<_$_InstagramModel> get copyWith =>
      throw _privateConstructorUsedError;
}
