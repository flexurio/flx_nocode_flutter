// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_sub_stage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionSubStage _$ProductionSubStageFromJson(Map<String, dynamic> json) {
  return _ProductionSubStage.fromJson(json);
}

/// @nodoc
mixin _$ProductionSubStage {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_stage')
  ProductionStage get stage => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this ProductionSubStage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductionSubStage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductionSubStageCopyWith<ProductionSubStage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionSubStageCopyWith<$Res> {
  factory $ProductionSubStageCopyWith(
          ProductionSubStage value, $Res Function(ProductionSubStage) then) =
      _$ProductionSubStageCopyWithImpl<$Res, ProductionSubStage>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'production_stage') ProductionStage stage,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive});

  $ProductionStageCopyWith<$Res> get stage;
}

/// @nodoc
class _$ProductionSubStageCopyWithImpl<$Res, $Val extends ProductionSubStage>
    implements $ProductionSubStageCopyWith<$Res> {
  _$ProductionSubStageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductionSubStage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as ProductionStage,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ProductionSubStage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionStageCopyWith<$Res> get stage {
    return $ProductionStageCopyWith<$Res>(_value.stage, (value) {
      return _then(_value.copyWith(stage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductionSubStageImplCopyWith<$Res>
    implements $ProductionSubStageCopyWith<$Res> {
  factory _$$ProductionSubStageImplCopyWith(_$ProductionSubStageImpl value,
          $Res Function(_$ProductionSubStageImpl) then) =
      __$$ProductionSubStageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'production_stage') ProductionStage stage,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive});

  @override
  $ProductionStageCopyWith<$Res> get stage;
}

/// @nodoc
class __$$ProductionSubStageImplCopyWithImpl<$Res>
    extends _$ProductionSubStageCopyWithImpl<$Res, _$ProductionSubStageImpl>
    implements _$$ProductionSubStageImplCopyWith<$Res> {
  __$$ProductionSubStageImplCopyWithImpl(_$ProductionSubStageImpl _value,
      $Res Function(_$ProductionSubStageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductionSubStage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
  }) {
    return _then(_$ProductionSubStageImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as ProductionStage,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionSubStageImpl extends _ProductionSubStage {
  const _$ProductionSubStageImpl(
      this.id,
      this.name,
      @JsonKey(name: 'production_stage') this.stage,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'is_active', defaultValue: false) this.isActive)
      : super._();

  factory _$ProductionSubStageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionSubStageImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'production_stage')
  final ProductionStage stage;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  final bool isActive;

  @override
  String toString() {
    return 'ProductionSubStage(id: $id, name: $name, stage: $stage, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionSubStageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, stage, createdAt, updatedAt, isActive);

  /// Create a copy of ProductionSubStage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionSubStageImplCopyWith<_$ProductionSubStageImpl> get copyWith =>
      __$$ProductionSubStageImplCopyWithImpl<_$ProductionSubStageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionSubStageImplToJson(
      this,
    );
  }
}

abstract class _ProductionSubStage extends ProductionSubStage {
  const factory _ProductionSubStage(
      final int id,
      final String name,
      @JsonKey(name: 'production_stage') final ProductionStage stage,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'is_active', defaultValue: false)
      final bool isActive) = _$ProductionSubStageImpl;
  const _ProductionSubStage._() : super._();

  factory _ProductionSubStage.fromJson(Map<String, dynamic> json) =
      _$ProductionSubStageImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'production_stage')
  ProductionStage get stage;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive;

  /// Create a copy of ProductionSubStage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductionSubStageImplCopyWith<_$ProductionSubStageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
