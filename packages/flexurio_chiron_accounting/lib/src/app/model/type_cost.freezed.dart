// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_cost.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeCost _$TypeCostFromJson(Map<String, dynamic> json) {
  return _TypeCost.fromJson(json);
}

/// @nodoc
mixin _$TypeCost {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get chartOfAccountNumber =>
      throw _privateConstructorUsedError;

  /// Serializes this TypeCost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeCost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeCostCopyWith<TypeCost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeCostCopyWith<$Res> {
  factory $TypeCostCopyWith(TypeCost value, $Res Function(TypeCost) then) =
      _$TypeCostCopyWithImpl<$Res, TypeCost>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String name,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber chartOfAccountNumber});

  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccountNumber;
}

/// @nodoc
class _$TypeCostCopyWithImpl<$Res, $Val extends TypeCost>
    implements $TypeCostCopyWith<$Res> {
  _$TypeCostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeCost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? chartOfAccountNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountNumber: null == chartOfAccountNumber
          ? _value.chartOfAccountNumber
          : chartOfAccountNumber // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
    ) as $Val);
  }

  /// Create a copy of TypeCost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccountNumber {
    return $ChartOfAccountNumberCopyWith<$Res>(_value.chartOfAccountNumber,
        (value) {
      return _then(_value.copyWith(chartOfAccountNumber: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TypeCostImplCopyWith<$Res>
    implements $TypeCostCopyWith<$Res> {
  factory _$$TypeCostImplCopyWith(
          _$TypeCostImpl value, $Res Function(_$TypeCostImpl) then) =
      __$$TypeCostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String name,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber chartOfAccountNumber});

  @override
  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccountNumber;
}

/// @nodoc
class __$$TypeCostImplCopyWithImpl<$Res>
    extends _$TypeCostCopyWithImpl<$Res, _$TypeCostImpl>
    implements _$$TypeCostImplCopyWith<$Res> {
  __$$TypeCostImplCopyWithImpl(
      _$TypeCostImpl _value, $Res Function(_$TypeCostImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypeCost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? chartOfAccountNumber = null,
  }) {
    return _then(_$TypeCostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountNumber: null == chartOfAccountNumber
          ? _value.chartOfAccountNumber
          : chartOfAccountNumber // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeCostImpl extends _TypeCost {
  _$TypeCostImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      required this.name,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      required this.chartOfAccountNumber})
      : super._();

  factory _$TypeCostImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeCostImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final String name;
  @override
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  final ChartOfAccountNumber chartOfAccountNumber;

  @override
  String toString() {
    return 'TypeCost(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, chartOfAccountNumber: $chartOfAccountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeCostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.chartOfAccountNumber, chartOfAccountNumber) ||
                other.chartOfAccountNumber == chartOfAccountNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, name, chartOfAccountNumber);

  /// Create a copy of TypeCost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeCostImplCopyWith<_$TypeCostImpl> get copyWith =>
      __$$TypeCostImplCopyWithImpl<_$TypeCostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeCostImplToJson(
      this,
    );
  }
}

abstract class _TypeCost extends TypeCost {
  factory _TypeCost(
          {required final int id,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          required final String name,
          @JsonKey(
              name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
          required final ChartOfAccountNumber chartOfAccountNumber}) =
      _$TypeCostImpl;
  _TypeCost._() : super._();

  factory _TypeCost.fromJson(Map<String, dynamic> json) =
      _$TypeCostImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  String get name;
  @override
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get chartOfAccountNumber;

  /// Create a copy of TypeCost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeCostImplCopyWith<_$TypeCostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
