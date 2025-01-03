// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_machine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionMachine _$ProductionMachineFromJson(Map<String, dynamic> json) {
  return _ProductionMachine.fromJson(json);
}

/// @nodoc
mixin _$ProductionMachine {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_no', defaultValue: '')
  String? get assetNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionMachineCopyWith<ProductionMachine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionMachineCopyWith<$Res> {
  factory $ProductionMachineCopyWith(
          ProductionMachine value, $Res Function(ProductionMachine) then) =
      _$ProductionMachineCopyWithImpl<$Res, ProductionMachine>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'asset_no', defaultValue: '') String? assetNumber});
}

/// @nodoc
class _$ProductionMachineCopyWithImpl<$Res, $Val extends ProductionMachine>
    implements $ProductionMachineCopyWith<$Res> {
  _$ProductionMachineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assetNumber = freezed,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assetNumber: freezed == assetNumber
          ? _value.assetNumber
          : assetNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionMachineImplCopyWith<$Res>
    implements $ProductionMachineCopyWith<$Res> {
  factory _$$ProductionMachineImplCopyWith(_$ProductionMachineImpl value,
          $Res Function(_$ProductionMachineImpl) then) =
      __$$ProductionMachineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'asset_no', defaultValue: '') String? assetNumber});
}

/// @nodoc
class __$$ProductionMachineImplCopyWithImpl<$Res>
    extends _$ProductionMachineCopyWithImpl<$Res, _$ProductionMachineImpl>
    implements _$$ProductionMachineImplCopyWith<$Res> {
  __$$ProductionMachineImplCopyWithImpl(_$ProductionMachineImpl _value,
      $Res Function(_$ProductionMachineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assetNumber = freezed,
  }) {
    return _then(_$ProductionMachineImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      freezed == assetNumber
          ? _value.assetNumber
          : assetNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionMachineImpl extends _ProductionMachine {
  const _$ProductionMachineImpl(
      this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'asset_no', defaultValue: '') this.assetNumber)
      : super._();

  factory _$ProductionMachineImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionMachineImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'asset_no', defaultValue: '')
  final String? assetNumber;

  @override
  String toString() {
    return 'ProductionMachine(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, assetNumber: $assetNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionMachineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.assetNumber, assetNumber) ||
                other.assetNumber == assetNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, createdAt, updatedAt, assetNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionMachineImplCopyWith<_$ProductionMachineImpl> get copyWith =>
      __$$ProductionMachineImplCopyWithImpl<_$ProductionMachineImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionMachineImplToJson(
      this,
    );
  }
}

abstract class _ProductionMachine extends ProductionMachine {
  const factory _ProductionMachine(
      final int id,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'asset_no', defaultValue: '')
      final String? assetNumber) = _$ProductionMachineImpl;
  const _ProductionMachine._() : super._();

  factory _ProductionMachine.fromJson(Map<String, dynamic> json) =
      _$ProductionMachineImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'asset_no', defaultValue: '')
  String? get assetNumber;
  @override
  @JsonKey(ignore: true)
  _$$ProductionMachineImplCopyWith<_$ProductionMachineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
