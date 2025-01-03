// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PresenceEmployee _$PresenceEmployeeFromJson(Map<String, dynamic> json) {
  return _PresenceEmployee.fromJson(json);
}

/// @nodoc
mixin _$PresenceEmployee {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Office.fromJson)
  Office get office => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_date_time', fromJson: _dateTimeFromJson)
  DateTime get inDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_latitude')
  double get inLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_longitude')
  double get inLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_accuracy')
  double get inAccuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_altitude')
  double get inAltitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_radius_from_office')
  double get inRadiusFromOffice => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
  DateTime? get outDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_latitude')
  double? get outLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_longitude')
  double? get outLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_accuracy')
  double? get outAccuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_altitude')
  double? get outAltitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_radius_from_office')
  double? get outRadiusFromOffice => throw _privateConstructorUsedError;

  /// Serializes this PresenceEmployee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PresenceEmployee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PresenceEmployeeCopyWith<PresenceEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceEmployeeCopyWith<$Res> {
  factory $PresenceEmployeeCopyWith(
          PresenceEmployee value, $Res Function(PresenceEmployee) then) =
      _$PresenceEmployeeCopyWithImpl<$Res, PresenceEmployee>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(fromJson: Office.fromJson) Office office,
      @JsonKey(name: 'in_date_time', fromJson: _dateTimeFromJson)
      DateTime inDateTime,
      @JsonKey(name: 'in_latitude') double inLatitude,
      @JsonKey(name: 'in_longitude') double inLongitude,
      @JsonKey(name: 'in_accuracy') double inAccuracy,
      @JsonKey(name: 'in_altitude') double inAltitude,
      @JsonKey(name: 'in_radius_from_office') double inRadiusFromOffice,
      @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
      DateTime? outDateTime,
      @JsonKey(name: 'out_latitude') double? outLatitude,
      @JsonKey(name: 'out_longitude') double? outLongitude,
      @JsonKey(name: 'out_accuracy') double? outAccuracy,
      @JsonKey(name: 'out_altitude') double? outAltitude,
      @JsonKey(name: 'out_radius_from_office') double? outRadiusFromOffice});

  $OfficeCopyWith<$Res> get office;
}

/// @nodoc
class _$PresenceEmployeeCopyWithImpl<$Res, $Val extends PresenceEmployee>
    implements $PresenceEmployeeCopyWith<$Res> {
  _$PresenceEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PresenceEmployee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? office = null,
    Object? inDateTime = null,
    Object? inLatitude = null,
    Object? inLongitude = null,
    Object? inAccuracy = null,
    Object? inAltitude = null,
    Object? inRadiusFromOffice = null,
    Object? outDateTime = freezed,
    Object? outLatitude = freezed,
    Object? outLongitude = freezed,
    Object? outAccuracy = freezed,
    Object? outAltitude = freezed,
    Object? outRadiusFromOffice = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as Office,
      inDateTime: null == inDateTime
          ? _value.inDateTime
          : inDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inLatitude: null == inLatitude
          ? _value.inLatitude
          : inLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      inLongitude: null == inLongitude
          ? _value.inLongitude
          : inLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      inAccuracy: null == inAccuracy
          ? _value.inAccuracy
          : inAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      inAltitude: null == inAltitude
          ? _value.inAltitude
          : inAltitude // ignore: cast_nullable_to_non_nullable
              as double,
      inRadiusFromOffice: null == inRadiusFromOffice
          ? _value.inRadiusFromOffice
          : inRadiusFromOffice // ignore: cast_nullable_to_non_nullable
              as double,
      outDateTime: freezed == outDateTime
          ? _value.outDateTime
          : outDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      outLatitude: freezed == outLatitude
          ? _value.outLatitude
          : outLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      outLongitude: freezed == outLongitude
          ? _value.outLongitude
          : outLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      outAccuracy: freezed == outAccuracy
          ? _value.outAccuracy
          : outAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      outAltitude: freezed == outAltitude
          ? _value.outAltitude
          : outAltitude // ignore: cast_nullable_to_non_nullable
              as double?,
      outRadiusFromOffice: freezed == outRadiusFromOffice
          ? _value.outRadiusFromOffice
          : outRadiusFromOffice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of PresenceEmployee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfficeCopyWith<$Res> get office {
    return $OfficeCopyWith<$Res>(_value.office, (value) {
      return _then(_value.copyWith(office: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PresenceEmployeeImplCopyWith<$Res>
    implements $PresenceEmployeeCopyWith<$Res> {
  factory _$$PresenceEmployeeImplCopyWith(_$PresenceEmployeeImpl value,
          $Res Function(_$PresenceEmployeeImpl) then) =
      __$$PresenceEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(fromJson: Office.fromJson) Office office,
      @JsonKey(name: 'in_date_time', fromJson: _dateTimeFromJson)
      DateTime inDateTime,
      @JsonKey(name: 'in_latitude') double inLatitude,
      @JsonKey(name: 'in_longitude') double inLongitude,
      @JsonKey(name: 'in_accuracy') double inAccuracy,
      @JsonKey(name: 'in_altitude') double inAltitude,
      @JsonKey(name: 'in_radius_from_office') double inRadiusFromOffice,
      @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
      DateTime? outDateTime,
      @JsonKey(name: 'out_latitude') double? outLatitude,
      @JsonKey(name: 'out_longitude') double? outLongitude,
      @JsonKey(name: 'out_accuracy') double? outAccuracy,
      @JsonKey(name: 'out_altitude') double? outAltitude,
      @JsonKey(name: 'out_radius_from_office') double? outRadiusFromOffice});

  @override
  $OfficeCopyWith<$Res> get office;
}

/// @nodoc
class __$$PresenceEmployeeImplCopyWithImpl<$Res>
    extends _$PresenceEmployeeCopyWithImpl<$Res, _$PresenceEmployeeImpl>
    implements _$$PresenceEmployeeImplCopyWith<$Res> {
  __$$PresenceEmployeeImplCopyWithImpl(_$PresenceEmployeeImpl _value,
      $Res Function(_$PresenceEmployeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PresenceEmployee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? office = null,
    Object? inDateTime = null,
    Object? inLatitude = null,
    Object? inLongitude = null,
    Object? inAccuracy = null,
    Object? inAltitude = null,
    Object? inRadiusFromOffice = null,
    Object? outDateTime = freezed,
    Object? outLatitude = freezed,
    Object? outLongitude = freezed,
    Object? outAccuracy = freezed,
    Object? outAltitude = freezed,
    Object? outRadiusFromOffice = freezed,
  }) {
    return _then(_$PresenceEmployeeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as Office,
      inDateTime: null == inDateTime
          ? _value.inDateTime
          : inDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inLatitude: null == inLatitude
          ? _value.inLatitude
          : inLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      inLongitude: null == inLongitude
          ? _value.inLongitude
          : inLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      inAccuracy: null == inAccuracy
          ? _value.inAccuracy
          : inAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      inAltitude: null == inAltitude
          ? _value.inAltitude
          : inAltitude // ignore: cast_nullable_to_non_nullable
              as double,
      inRadiusFromOffice: null == inRadiusFromOffice
          ? _value.inRadiusFromOffice
          : inRadiusFromOffice // ignore: cast_nullable_to_non_nullable
              as double,
      outDateTime: freezed == outDateTime
          ? _value.outDateTime
          : outDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      outLatitude: freezed == outLatitude
          ? _value.outLatitude
          : outLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      outLongitude: freezed == outLongitude
          ? _value.outLongitude
          : outLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      outAccuracy: freezed == outAccuracy
          ? _value.outAccuracy
          : outAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      outAltitude: freezed == outAltitude
          ? _value.outAltitude
          : outAltitude // ignore: cast_nullable_to_non_nullable
              as double?,
      outRadiusFromOffice: freezed == outRadiusFromOffice
          ? _value.outRadiusFromOffice
          : outRadiusFromOffice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceEmployeeImpl extends _PresenceEmployee {
  const _$PresenceEmployeeImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(fromJson: Office.fromJson) required this.office,
      @JsonKey(name: 'in_date_time', fromJson: _dateTimeFromJson)
      required this.inDateTime,
      @JsonKey(name: 'in_latitude') required this.inLatitude,
      @JsonKey(name: 'in_longitude') required this.inLongitude,
      @JsonKey(name: 'in_accuracy') required this.inAccuracy,
      @JsonKey(name: 'in_altitude') required this.inAltitude,
      @JsonKey(name: 'in_radius_from_office') required this.inRadiusFromOffice,
      @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
      required this.outDateTime,
      @JsonKey(name: 'out_latitude') required this.outLatitude,
      @JsonKey(name: 'out_longitude') required this.outLongitude,
      @JsonKey(name: 'out_accuracy') required this.outAccuracy,
      @JsonKey(name: 'out_altitude') required this.outAltitude,
      @JsonKey(name: 'out_radius_from_office')
      required this.outRadiusFromOffice})
      : super._();

  factory _$PresenceEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceEmployeeImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(fromJson: Office.fromJson)
  final Office office;
  @override
  @JsonKey(name: 'in_date_time', fromJson: _dateTimeFromJson)
  final DateTime inDateTime;
  @override
  @JsonKey(name: 'in_latitude')
  final double inLatitude;
  @override
  @JsonKey(name: 'in_longitude')
  final double inLongitude;
  @override
  @JsonKey(name: 'in_accuracy')
  final double inAccuracy;
  @override
  @JsonKey(name: 'in_altitude')
  final double inAltitude;
  @override
  @JsonKey(name: 'in_radius_from_office')
  final double inRadiusFromOffice;
  @override
  @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
  final DateTime? outDateTime;
  @override
  @JsonKey(name: 'out_latitude')
  final double? outLatitude;
  @override
  @JsonKey(name: 'out_longitude')
  final double? outLongitude;
  @override
  @JsonKey(name: 'out_accuracy')
  final double? outAccuracy;
  @override
  @JsonKey(name: 'out_altitude')
  final double? outAltitude;
  @override
  @JsonKey(name: 'out_radius_from_office')
  final double? outRadiusFromOffice;

  @override
  String toString() {
    return 'PresenceEmployee(id: $id, userId: $userId, office: $office, inDateTime: $inDateTime, inLatitude: $inLatitude, inLongitude: $inLongitude, inAccuracy: $inAccuracy, inAltitude: $inAltitude, inRadiusFromOffice: $inRadiusFromOffice, outDateTime: $outDateTime, outLatitude: $outLatitude, outLongitude: $outLongitude, outAccuracy: $outAccuracy, outAltitude: $outAltitude, outRadiusFromOffice: $outRadiusFromOffice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceEmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.inDateTime, inDateTime) ||
                other.inDateTime == inDateTime) &&
            (identical(other.inLatitude, inLatitude) ||
                other.inLatitude == inLatitude) &&
            (identical(other.inLongitude, inLongitude) ||
                other.inLongitude == inLongitude) &&
            (identical(other.inAccuracy, inAccuracy) ||
                other.inAccuracy == inAccuracy) &&
            (identical(other.inAltitude, inAltitude) ||
                other.inAltitude == inAltitude) &&
            (identical(other.inRadiusFromOffice, inRadiusFromOffice) ||
                other.inRadiusFromOffice == inRadiusFromOffice) &&
            (identical(other.outDateTime, outDateTime) ||
                other.outDateTime == outDateTime) &&
            (identical(other.outLatitude, outLatitude) ||
                other.outLatitude == outLatitude) &&
            (identical(other.outLongitude, outLongitude) ||
                other.outLongitude == outLongitude) &&
            (identical(other.outAccuracy, outAccuracy) ||
                other.outAccuracy == outAccuracy) &&
            (identical(other.outAltitude, outAltitude) ||
                other.outAltitude == outAltitude) &&
            (identical(other.outRadiusFromOffice, outRadiusFromOffice) ||
                other.outRadiusFromOffice == outRadiusFromOffice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      office,
      inDateTime,
      inLatitude,
      inLongitude,
      inAccuracy,
      inAltitude,
      inRadiusFromOffice,
      outDateTime,
      outLatitude,
      outLongitude,
      outAccuracy,
      outAltitude,
      outRadiusFromOffice);

  /// Create a copy of PresenceEmployee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceEmployeeImplCopyWith<_$PresenceEmployeeImpl> get copyWith =>
      __$$PresenceEmployeeImplCopyWithImpl<_$PresenceEmployeeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceEmployeeImplToJson(
      this,
    );
  }
}

abstract class _PresenceEmployee extends PresenceEmployee {
  const factory _PresenceEmployee(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(fromJson: Office.fromJson) required final Office office,
      @JsonKey(name: 'in_date_time', fromJson: _dateTimeFromJson)
      required final DateTime inDateTime,
      @JsonKey(name: 'in_latitude') required final double inLatitude,
      @JsonKey(name: 'in_longitude') required final double inLongitude,
      @JsonKey(name: 'in_accuracy') required final double inAccuracy,
      @JsonKey(name: 'in_altitude') required final double inAltitude,
      @JsonKey(name: 'in_radius_from_office')
      required final double inRadiusFromOffice,
      @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
      required final DateTime? outDateTime,
      @JsonKey(name: 'out_latitude') required final double? outLatitude,
      @JsonKey(name: 'out_longitude') required final double? outLongitude,
      @JsonKey(name: 'out_accuracy') required final double? outAccuracy,
      @JsonKey(name: 'out_altitude') required final double? outAltitude,
      @JsonKey(name: 'out_radius_from_office')
      required final double? outRadiusFromOffice}) = _$PresenceEmployeeImpl;
  const _PresenceEmployee._() : super._();

  factory _PresenceEmployee.fromJson(Map<String, dynamic> json) =
      _$PresenceEmployeeImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(fromJson: Office.fromJson)
  Office get office;
  @override
  @JsonKey(name: 'in_date_time', fromJson: _dateTimeFromJson)
  DateTime get inDateTime;
  @override
  @JsonKey(name: 'in_latitude')
  double get inLatitude;
  @override
  @JsonKey(name: 'in_longitude')
  double get inLongitude;
  @override
  @JsonKey(name: 'in_accuracy')
  double get inAccuracy;
  @override
  @JsonKey(name: 'in_altitude')
  double get inAltitude;
  @override
  @JsonKey(name: 'in_radius_from_office')
  double get inRadiusFromOffice;
  @override
  @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
  DateTime? get outDateTime;
  @override
  @JsonKey(name: 'out_latitude')
  double? get outLatitude;
  @override
  @JsonKey(name: 'out_longitude')
  double? get outLongitude;
  @override
  @JsonKey(name: 'out_accuracy')
  double? get outAccuracy;
  @override
  @JsonKey(name: 'out_altitude')
  double? get outAltitude;
  @override
  @JsonKey(name: 'out_radius_from_office')
  double? get outRadiusFromOffice;

  /// Create a copy of PresenceEmployee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresenceEmployeeImplCopyWith<_$PresenceEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
