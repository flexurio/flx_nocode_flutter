// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_hour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkHour _$WorkHourFromJson(Map<String, dynamic> json) {
  return _WorkHour.fromJson(json);
}

/// @nodoc
mixin _$WorkHour {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
  TimeOfDay get start => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
  TimeOfDay get end => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dayFromString)
  Day get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkHourCopyWith<WorkHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkHourCopyWith<$Res> {
  factory $WorkHourCopyWith(WorkHour value, $Res Function(WorkHour) then) =
      _$WorkHourCopyWithImpl<$Res, WorkHour>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
      TimeOfDay start,
      @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
      TimeOfDay end,
      @JsonKey(fromJson: dayFromString) Day day,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$WorkHourCopyWithImpl<$Res, $Val extends WorkHour>
    implements $WorkHourCopyWith<$Res> {
  _$WorkHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? day = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as Day,
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
abstract class _$$WorkHourImplCopyWith<$Res>
    implements $WorkHourCopyWith<$Res> {
  factory _$$WorkHourImplCopyWith(
          _$WorkHourImpl value, $Res Function(_$WorkHourImpl) then) =
      __$$WorkHourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
      TimeOfDay start,
      @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
      TimeOfDay end,
      @JsonKey(fromJson: dayFromString) Day day,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$WorkHourImplCopyWithImpl<$Res>
    extends _$WorkHourCopyWithImpl<$Res, _$WorkHourImpl>
    implements _$$WorkHourImplCopyWith<$Res> {
  __$$WorkHourImplCopyWithImpl(
      _$WorkHourImpl _value, $Res Function(_$WorkHourImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? day = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WorkHourImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as Day,
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
class _$WorkHourImpl extends _WorkHour {
  const _$WorkHourImpl(
      this.id,
      @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
      this.start,
      @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
      this.end,
      @JsonKey(fromJson: dayFromString) this.day,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt)
      : super._();

  factory _$WorkHourImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkHourImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
  final TimeOfDay start;
  @override
  @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
  final TimeOfDay end;
  @override
  @JsonKey(fromJson: dayFromString)
  final Day day;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'WorkHour(id: $id, start: $start, end: $end, day: $day, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkHourImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, start, end, day, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkHourImplCopyWith<_$WorkHourImpl> get copyWith =>
      __$$WorkHourImplCopyWithImpl<_$WorkHourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkHourImplToJson(
      this,
    );
  }
}

abstract class _WorkHour extends WorkHour {
  const factory _WorkHour(
      final int id,
      @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
      final TimeOfDay start,
      @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
      final TimeOfDay end,
      @JsonKey(fromJson: dayFromString) final Day day,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt) = _$WorkHourImpl;
  const _WorkHour._() : super._();

  factory _WorkHour.fromJson(Map<String, dynamic> json) =
      _$WorkHourImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
  TimeOfDay get start;
  @override
  @JsonKey(fromJson: timeOfDayFromString, toJson: timeOfDayToString)
  TimeOfDay get end;
  @override
  @JsonKey(fromJson: dayFromString)
  Day get day;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WorkHourImplCopyWith<_$WorkHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
