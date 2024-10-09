// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCityModel _$GetCityModelFromJson(Map<String, dynamic> json) {
  return _GetCityModel.fromJson(json);
}

/// @nodoc
mixin _$GetCityModel {
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCityModelCopyWith<GetCityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCityModelCopyWith<$Res> {
  factory $GetCityModelCopyWith(
          GetCityModel value, $Res Function(GetCityModel) then) =
      _$GetCityModelCopyWithImpl<$Res, GetCityModel>;
  @useResult
  $Res call({String? name, String? slug});
}

/// @nodoc
class _$GetCityModelCopyWithImpl<$Res, $Val extends GetCityModel>
    implements $GetCityModelCopyWith<$Res> {
  _$GetCityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCityModelImplCopyWith<$Res>
    implements $GetCityModelCopyWith<$Res> {
  factory _$$GetCityModelImplCopyWith(
          _$GetCityModelImpl value, $Res Function(_$GetCityModelImpl) then) =
      __$$GetCityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? slug});
}

/// @nodoc
class __$$GetCityModelImplCopyWithImpl<$Res>
    extends _$GetCityModelCopyWithImpl<$Res, _$GetCityModelImpl>
    implements _$$GetCityModelImplCopyWith<$Res> {
  __$$GetCityModelImplCopyWithImpl(
      _$GetCityModelImpl _value, $Res Function(_$GetCityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? slug = freezed,
  }) {
    return _then(_$GetCityModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCityModelImpl implements _GetCityModel {
  const _$GetCityModelImpl({required this.name, required this.slug});

  factory _$GetCityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCityModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? slug;

  @override
  String toString() {
    return 'GetCityModel(name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCityModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCityModelImplCopyWith<_$GetCityModelImpl> get copyWith =>
      __$$GetCityModelImplCopyWithImpl<_$GetCityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCityModelImplToJson(
      this,
    );
  }
}

abstract class _GetCityModel implements GetCityModel {
  const factory _GetCityModel(
      {required final String? name,
      required final String? slug}) = _$GetCityModelImpl;

  factory _GetCityModel.fromJson(Map<String, dynamic> json) =
      _$GetCityModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get slug;
  @override
  @JsonKey(ignore: true)
  _$$GetCityModelImplCopyWith<_$GetCityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
