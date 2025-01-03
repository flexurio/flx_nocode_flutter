// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_of_account_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChartOfAccountNumber _$ChartOfAccountNumberFromJson(Map<String, dynamic> json) {
  return _ChartOfAccountNumber.fromJson(json);
}

/// @nodoc
mixin _$ChartOfAccountNumber {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_factory_overhead', defaultValue: false)
  bool get isFactoryOverhead => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: ChartOfAccountNumberStatus.fromString)
  ChartOfAccountNumberStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_group')
  ChartOfAccountGroup get chartOfAccountGroup =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;

  /// Serializes this ChartOfAccountNumber to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartOfAccountNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartOfAccountNumberCopyWith<ChartOfAccountNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartOfAccountNumberCopyWith<$Res> {
  factory $ChartOfAccountNumberCopyWith(ChartOfAccountNumber value,
          $Res Function(ChartOfAccountNumber) then) =
      _$ChartOfAccountNumberCopyWithImpl<$Res, ChartOfAccountNumber>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'is_factory_overhead', defaultValue: false)
      bool isFactoryOverhead,
      @JsonKey(name: 'status', fromJson: ChartOfAccountNumberStatus.fromString)
      ChartOfAccountNumberStatus status,
      @JsonKey(name: 'chart_of_account_group')
      ChartOfAccountGroup chartOfAccountGroup,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById});

  $ChartOfAccountGroupCopyWith<$Res> get chartOfAccountGroup;
}

/// @nodoc
class _$ChartOfAccountNumberCopyWithImpl<$Res,
        $Val extends ChartOfAccountNumber>
    implements $ChartOfAccountNumberCopyWith<$Res> {
  _$ChartOfAccountNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartOfAccountNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isFactoryOverhead = null,
    Object? status = null,
    Object? chartOfAccountGroup = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isFactoryOverhead: null == isFactoryOverhead
          ? _value.isFactoryOverhead
          : isFactoryOverhead // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumberStatus,
      chartOfAccountGroup: null == chartOfAccountGroup
          ? _value.chartOfAccountGroup
          : chartOfAccountGroup // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountGroup,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ChartOfAccountNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartOfAccountGroupCopyWith<$Res> get chartOfAccountGroup {
    return $ChartOfAccountGroupCopyWith<$Res>(_value.chartOfAccountGroup,
        (value) {
      return _then(_value.copyWith(chartOfAccountGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChartOfAccountNumberImplCopyWith<$Res>
    implements $ChartOfAccountNumberCopyWith<$Res> {
  factory _$$ChartOfAccountNumberImplCopyWith(_$ChartOfAccountNumberImpl value,
          $Res Function(_$ChartOfAccountNumberImpl) then) =
      __$$ChartOfAccountNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'is_factory_overhead', defaultValue: false)
      bool isFactoryOverhead,
      @JsonKey(name: 'status', fromJson: ChartOfAccountNumberStatus.fromString)
      ChartOfAccountNumberStatus status,
      @JsonKey(name: 'chart_of_account_group')
      ChartOfAccountGroup chartOfAccountGroup,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById});

  @override
  $ChartOfAccountGroupCopyWith<$Res> get chartOfAccountGroup;
}

/// @nodoc
class __$$ChartOfAccountNumberImplCopyWithImpl<$Res>
    extends _$ChartOfAccountNumberCopyWithImpl<$Res, _$ChartOfAccountNumberImpl>
    implements _$$ChartOfAccountNumberImplCopyWith<$Res> {
  __$$ChartOfAccountNumberImplCopyWithImpl(_$ChartOfAccountNumberImpl _value,
      $Res Function(_$ChartOfAccountNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartOfAccountNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isFactoryOverhead = null,
    Object? status = null,
    Object? chartOfAccountGroup = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
  }) {
    return _then(_$ChartOfAccountNumberImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == isFactoryOverhead
          ? _value.isFactoryOverhead
          : isFactoryOverhead // ignore: cast_nullable_to_non_nullable
              as bool,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumberStatus,
      null == chartOfAccountGroup
          ? _value.chartOfAccountGroup
          : chartOfAccountGroup // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountGroup,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartOfAccountNumberImpl extends _ChartOfAccountNumber {
  _$ChartOfAccountNumberImpl(
      this.id,
      this.name,
      @JsonKey(name: 'is_factory_overhead', defaultValue: false)
      this.isFactoryOverhead,
      @JsonKey(name: 'status', fromJson: ChartOfAccountNumberStatus.fromString)
      this.status,
      @JsonKey(name: 'chart_of_account_group') this.chartOfAccountGroup,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'updated_by_id') this.updateById)
      : super._();

  factory _$ChartOfAccountNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartOfAccountNumberImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'is_factory_overhead', defaultValue: false)
  final bool isFactoryOverhead;
  @override
  @JsonKey(name: 'status', fromJson: ChartOfAccountNumberStatus.fromString)
  final ChartOfAccountNumberStatus status;
  @override
  @JsonKey(name: 'chart_of_account_group')
  final ChartOfAccountGroup chartOfAccountGroup;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updateById;

  @override
  String toString() {
    return 'ChartOfAccountNumber(id: $id, name: $name, isFactoryOverhead: $isFactoryOverhead, status: $status, chartOfAccountGroup: $chartOfAccountGroup, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartOfAccountNumberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFactoryOverhead, isFactoryOverhead) ||
                other.isFactoryOverhead == isFactoryOverhead) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.chartOfAccountGroup, chartOfAccountGroup) ||
                other.chartOfAccountGroup == chartOfAccountGroup) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      isFactoryOverhead,
      status,
      chartOfAccountGroup,
      createdAt,
      createdById,
      updatedAt,
      updateById);

  /// Create a copy of ChartOfAccountNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartOfAccountNumberImplCopyWith<_$ChartOfAccountNumberImpl>
      get copyWith =>
          __$$ChartOfAccountNumberImplCopyWithImpl<_$ChartOfAccountNumberImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartOfAccountNumberImplToJson(
      this,
    );
  }
}

abstract class _ChartOfAccountNumber extends ChartOfAccountNumber {
  factory _ChartOfAccountNumber(
      final String id,
      final String name,
      @JsonKey(name: 'is_factory_overhead', defaultValue: false)
      final bool isFactoryOverhead,
      @JsonKey(name: 'status', fromJson: ChartOfAccountNumberStatus.fromString)
      final ChartOfAccountNumberStatus status,
      @JsonKey(name: 'chart_of_account_group')
      final ChartOfAccountGroup chartOfAccountGroup,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id')
      final int updateById) = _$ChartOfAccountNumberImpl;
  _ChartOfAccountNumber._() : super._();

  factory _ChartOfAccountNumber.fromJson(Map<String, dynamic> json) =
      _$ChartOfAccountNumberImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'is_factory_overhead', defaultValue: false)
  bool get isFactoryOverhead;
  @override
  @JsonKey(name: 'status', fromJson: ChartOfAccountNumberStatus.fromString)
  ChartOfAccountNumberStatus get status;
  @override
  @JsonKey(name: 'chart_of_account_group')
  ChartOfAccountGroup get chartOfAccountGroup;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updateById;

  /// Create a copy of ChartOfAccountNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartOfAccountNumberImplCopyWith<_$ChartOfAccountNumberImpl>
      get copyWith => throw _privateConstructorUsedError;
}
