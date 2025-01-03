// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleDetail _$ScheduleDetailFromJson(Map<String, dynamic> json) {
  return _ScheduleDetail.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDetail {
  int get id => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError;
  int get cycle => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: ScheduleDetailStatus.fromString)
  ScheduleDetailStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  DateTime get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_valid', defaultValue: false)
  bool get isValid => throw _privateConstructorUsedError;
  @JsonKey(name: 'pic_id')
  int get picId => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_header')
  int get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleDetailCopyWith<ScheduleDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDetailCopyWith<$Res> {
  factory $ScheduleDetailCopyWith(
          ScheduleDetail value, $Res Function(ScheduleDetail) then) =
      _$ScheduleDetailCopyWithImpl<$Res, ScheduleDetail>;
  @useResult
  $Res call(
      {int id,
      String remarks,
      int cycle,
      @JsonKey(name: 'status', fromJson: ScheduleDetailStatus.fromString)
      ScheduleDetailStatus status,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) DateTime endTime,
      @JsonKey(name: 'is_valid', defaultValue: false) bool isValid,
      @JsonKey(name: 'pic_id') int picId,
      @JsonKey(name: 'schedule_header') int scheduleId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$ScheduleDetailCopyWithImpl<$Res, $Val extends ScheduleDetail>
    implements $ScheduleDetailCopyWith<$Res> {
  _$ScheduleDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remarks = null,
    Object? cycle = null,
    Object? status = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? isValid = null,
    Object? picId = null,
    Object? scheduleId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScheduleDetailStatus,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      picId: null == picId
          ? _value.picId
          : picId // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$ScheduleDetailImplCopyWith<$Res>
    implements $ScheduleDetailCopyWith<$Res> {
  factory _$$ScheduleDetailImplCopyWith(_$ScheduleDetailImpl value,
          $Res Function(_$ScheduleDetailImpl) then) =
      __$$ScheduleDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String remarks,
      int cycle,
      @JsonKey(name: 'status', fromJson: ScheduleDetailStatus.fromString)
      ScheduleDetailStatus status,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) DateTime endTime,
      @JsonKey(name: 'is_valid', defaultValue: false) bool isValid,
      @JsonKey(name: 'pic_id') int picId,
      @JsonKey(name: 'schedule_header') int scheduleId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$ScheduleDetailImplCopyWithImpl<$Res>
    extends _$ScheduleDetailCopyWithImpl<$Res, _$ScheduleDetailImpl>
    implements _$$ScheduleDetailImplCopyWith<$Res> {
  __$$ScheduleDetailImplCopyWithImpl(
      _$ScheduleDetailImpl _value, $Res Function(_$ScheduleDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remarks = null,
    Object? cycle = null,
    Object? status = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? isValid = null,
    Object? picId = null,
    Object? scheduleId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ScheduleDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as int,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ScheduleDetailStatus,
      null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      null == picId
          ? _value.picId
          : picId // ignore: cast_nullable_to_non_nullable
              as int,
      null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$ScheduleDetailImpl extends _ScheduleDetail {
  _$ScheduleDetailImpl(
      this.id,
      this.remarks,
      this.cycle,
      @JsonKey(name: 'status', fromJson: ScheduleDetailStatus.fromString)
      this.status,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime) this.startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) this.endTime,
      @JsonKey(name: 'is_valid', defaultValue: false) this.isValid,
      @JsonKey(name: 'pic_id') this.picId,
      @JsonKey(name: 'schedule_header') this.scheduleId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt)
      : super._();

  factory _$ScheduleDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDetailImplFromJson(json);

  @override
  final int id;
  @override
  final String remarks;
  @override
  final int cycle;
  @override
  @JsonKey(name: 'status', fromJson: ScheduleDetailStatus.fromString)
  final ScheduleDetailStatus status;
  @override
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  final DateTime startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  final DateTime endTime;
  @override
  @JsonKey(name: 'is_valid', defaultValue: false)
  final bool isValid;
  @override
  @JsonKey(name: 'pic_id')
  final int picId;
  @override
  @JsonKey(name: 'schedule_header')
  final int scheduleId;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ScheduleDetail(id: $id, remarks: $remarks, cycle: $cycle, status: $status, startTime: $startTime, endTime: $endTime, isValid: $isValid, picId: $picId, scheduleId: $scheduleId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.picId, picId) || other.picId == picId) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, remarks, cycle, status,
      startTime, endTime, isValid, picId, scheduleId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDetailImplCopyWith<_$ScheduleDetailImpl> get copyWith =>
      __$$ScheduleDetailImplCopyWithImpl<_$ScheduleDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDetailImplToJson(
      this,
    );
  }
}

abstract class _ScheduleDetail extends ScheduleDetail {
  factory _ScheduleDetail(
      final int id,
      final String remarks,
      final int cycle,
      @JsonKey(name: 'status', fromJson: ScheduleDetailStatus.fromString)
      final ScheduleDetailStatus status,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      final DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
      final DateTime endTime,
      @JsonKey(name: 'is_valid', defaultValue: false) final bool isValid,
      @JsonKey(name: 'pic_id') final int picId,
      @JsonKey(name: 'schedule_header') final int scheduleId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt) = _$ScheduleDetailImpl;
  _ScheduleDetail._() : super._();

  factory _ScheduleDetail.fromJson(Map<String, dynamic> json) =
      _$ScheduleDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get remarks;
  @override
  int get cycle;
  @override
  @JsonKey(name: 'status', fromJson: ScheduleDetailStatus.fromString)
  ScheduleDetailStatus get status;
  @override
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  DateTime get startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  DateTime get endTime;
  @override
  @JsonKey(name: 'is_valid', defaultValue: false)
  bool get isValid;
  @override
  @JsonKey(name: 'pic_id')
  int get picId;
  @override
  @JsonKey(name: 'schedule_header')
  int get scheduleId;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleDetailImplCopyWith<_$ScheduleDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
