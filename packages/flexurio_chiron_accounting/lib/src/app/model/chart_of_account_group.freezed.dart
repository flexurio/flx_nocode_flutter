// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_of_account_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChartOfAccountGroup _$ChartOfAccountGroupFromJson(Map<String, dynamic> json) {
  return _ChartOfAccountGroup.fromJson(json);
}

/// @nodoc
mixin _$ChartOfAccountGroup {
  @JsonKey(name: 'created_by_id')
  int? get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int? get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'forecast_number')
  String get forecastNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_group')
  BalanceGroup get balanceGroup => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this ChartOfAccountGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartOfAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartOfAccountGroupCopyWith<ChartOfAccountGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartOfAccountGroupCopyWith<$Res> {
  factory $ChartOfAccountGroupCopyWith(
          ChartOfAccountGroup value, $Res Function(ChartOfAccountGroup) then) =
      _$ChartOfAccountGroupCopyWithImpl<$Res, ChartOfAccountGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_by_id') int? createdById,
      @JsonKey(name: 'updated_by_id') int? updateById,
      @JsonKey(name: 'forecast_number') String forecastNumber,
      @JsonKey(name: 'balance_group') BalanceGroup balanceGroup,
      String name,
      String id});

  $BalanceGroupCopyWith<$Res> get balanceGroup;
}

/// @nodoc
class _$ChartOfAccountGroupCopyWithImpl<$Res, $Val extends ChartOfAccountGroup>
    implements $ChartOfAccountGroupCopyWith<$Res> {
  _$ChartOfAccountGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartOfAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdById = freezed,
    Object? updateById = freezed,
    Object? forecastNumber = null,
    Object? balanceGroup = null,
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      updateById: freezed == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int?,
      forecastNumber: null == forecastNumber
          ? _value.forecastNumber
          : forecastNumber // ignore: cast_nullable_to_non_nullable
              as String,
      balanceGroup: null == balanceGroup
          ? _value.balanceGroup
          : balanceGroup // ignore: cast_nullable_to_non_nullable
              as BalanceGroup,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of ChartOfAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BalanceGroupCopyWith<$Res> get balanceGroup {
    return $BalanceGroupCopyWith<$Res>(_value.balanceGroup, (value) {
      return _then(_value.copyWith(balanceGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChartOfAccountGroupImplCopyWith<$Res>
    implements $ChartOfAccountGroupCopyWith<$Res> {
  factory _$$ChartOfAccountGroupImplCopyWith(_$ChartOfAccountGroupImpl value,
          $Res Function(_$ChartOfAccountGroupImpl) then) =
      __$$ChartOfAccountGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_by_id') int? createdById,
      @JsonKey(name: 'updated_by_id') int? updateById,
      @JsonKey(name: 'forecast_number') String forecastNumber,
      @JsonKey(name: 'balance_group') BalanceGroup balanceGroup,
      String name,
      String id});

  @override
  $BalanceGroupCopyWith<$Res> get balanceGroup;
}

/// @nodoc
class __$$ChartOfAccountGroupImplCopyWithImpl<$Res>
    extends _$ChartOfAccountGroupCopyWithImpl<$Res, _$ChartOfAccountGroupImpl>
    implements _$$ChartOfAccountGroupImplCopyWith<$Res> {
  __$$ChartOfAccountGroupImplCopyWithImpl(_$ChartOfAccountGroupImpl _value,
      $Res Function(_$ChartOfAccountGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartOfAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdById = freezed,
    Object? updateById = freezed,
    Object? forecastNumber = null,
    Object? balanceGroup = null,
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$ChartOfAccountGroupImpl(
      freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int?,
      null == forecastNumber
          ? _value.forecastNumber
          : forecastNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == balanceGroup
          ? _value.balanceGroup
          : balanceGroup // ignore: cast_nullable_to_non_nullable
              as BalanceGroup,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartOfAccountGroupImpl extends _ChartOfAccountGroup {
  _$ChartOfAccountGroupImpl(
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_by_id') this.updateById,
      @JsonKey(name: 'forecast_number') this.forecastNumber,
      @JsonKey(name: 'balance_group') this.balanceGroup,
      this.name,
      this.id)
      : super._();

  factory _$ChartOfAccountGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartOfAccountGroupImplFromJson(json);

  @override
  @JsonKey(name: 'created_by_id')
  final int? createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  final int? updateById;
  @override
  @JsonKey(name: 'forecast_number')
  final String forecastNumber;
  @override
  @JsonKey(name: 'balance_group')
  final BalanceGroup balanceGroup;
  @override
  final String name;
  @override
  final String id;

  @override
  String toString() {
    return 'ChartOfAccountGroup(createdById: $createdById, updateById: $updateById, forecastNumber: $forecastNumber, balanceGroup: $balanceGroup, name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartOfAccountGroupImpl &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.forecastNumber, forecastNumber) ||
                other.forecastNumber == forecastNumber) &&
            (identical(other.balanceGroup, balanceGroup) ||
                other.balanceGroup == balanceGroup) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createdById, updateById,
      forecastNumber, balanceGroup, name, id);

  /// Create a copy of ChartOfAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartOfAccountGroupImplCopyWith<_$ChartOfAccountGroupImpl> get copyWith =>
      __$$ChartOfAccountGroupImplCopyWithImpl<_$ChartOfAccountGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartOfAccountGroupImplToJson(
      this,
    );
  }
}

abstract class _ChartOfAccountGroup extends ChartOfAccountGroup {
  factory _ChartOfAccountGroup(
      @JsonKey(name: 'created_by_id') final int? createdById,
      @JsonKey(name: 'updated_by_id') final int? updateById,
      @JsonKey(name: 'forecast_number') final String forecastNumber,
      @JsonKey(name: 'balance_group') final BalanceGroup balanceGroup,
      final String name,
      final String id) = _$ChartOfAccountGroupImpl;
  _ChartOfAccountGroup._() : super._();

  factory _ChartOfAccountGroup.fromJson(Map<String, dynamic> json) =
      _$ChartOfAccountGroupImpl.fromJson;

  @override
  @JsonKey(name: 'created_by_id')
  int? get createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  int? get updateById;
  @override
  @JsonKey(name: 'forecast_number')
  String get forecastNumber;
  @override
  @JsonKey(name: 'balance_group')
  BalanceGroup get balanceGroup;
  @override
  String get name;
  @override
  String get id;

  /// Create a copy of ChartOfAccountGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartOfAccountGroupImplCopyWith<_$ChartOfAccountGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
