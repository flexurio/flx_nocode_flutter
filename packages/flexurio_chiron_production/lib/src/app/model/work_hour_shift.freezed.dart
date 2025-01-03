// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_hour_shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkHourShift _$WorkHourShiftFromJson(Map<String, dynamic> json) {
  return _WorkHourShift.fromJson(json);
}

/// @nodoc
mixin _$WorkHourShift {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
  DateTime get periodStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
  DateTime get periodEnd => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkHourShiftCopyWith<WorkHourShift> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkHourShiftCopyWith<$Res> {
  factory $WorkHourShiftCopyWith(
          WorkHourShift value, $Res Function(WorkHourShift) then) =
      _$WorkHourShiftCopyWithImpl<$Res, WorkHourShift>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
      DateTime periodStart,
      @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
      DateTime periodEnd,
      String name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$WorkHourShiftCopyWithImpl<$Res, $Val extends WorkHourShift>
    implements $WorkHourShiftCopyWith<$Res> {
  _$WorkHourShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkHourShiftImplCopyWith<$Res>
    implements $WorkHourShiftCopyWith<$Res> {
  factory _$$WorkHourShiftImplCopyWith(
          _$WorkHourShiftImpl value, $Res Function(_$WorkHourShiftImpl) then) =
      __$$WorkHourShiftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
      DateTime periodStart,
      @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
      DateTime periodEnd,
      String name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$WorkHourShiftImplCopyWithImpl<$Res>
    extends _$WorkHourShiftCopyWithImpl<$Res, _$WorkHourShiftImpl>
    implements _$$WorkHourShiftImplCopyWith<$Res> {
  __$$WorkHourShiftImplCopyWithImpl(
      _$WorkHourShiftImpl _value, $Res Function(_$WorkHourShiftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WorkHourShiftImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkHourShiftImpl extends _WorkHourShift {
  const _$WorkHourShiftImpl(
      this.id,
      @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
      this.periodStart,
      @JsonKey(name: 'end_period', fromJson: isoDateToDateTime) this.periodEnd,
      this.name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt)
      : super._();

  factory _$WorkHourShiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkHourShiftImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
  final DateTime periodStart;
  @override
  @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
  final DateTime periodEnd;
  @override
  final String name;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'WorkHourShift(id: $id, periodStart: $periodStart, periodEnd: $periodEnd, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkHourShiftImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, periodStart, periodEnd, name, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkHourShiftImplCopyWith<_$WorkHourShiftImpl> get copyWith =>
      __$$WorkHourShiftImplCopyWithImpl<_$WorkHourShiftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkHourShiftImplToJson(
      this,
    );
  }
}

abstract class _WorkHourShift extends WorkHourShift {
  const factory _WorkHourShift(
      final int id,
      @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
      final DateTime periodStart,
      @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
      final DateTime periodEnd,
      final String name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt) = _$WorkHourShiftImpl;
  const _WorkHourShift._() : super._();

  factory _WorkHourShift.fromJson(Map<String, dynamic> json) =
      _$WorkHourShiftImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
  DateTime get periodStart;
  @override
  @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
  DateTime get periodEnd;
  @override
  String get name;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WorkHourShiftImplCopyWith<_$WorkHourShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
