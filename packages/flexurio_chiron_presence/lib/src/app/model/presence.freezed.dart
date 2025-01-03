// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Presence _$PresenceFromJson(Map<String, dynamic> json) {
  return _Presence.fromJson(json);
}

/// @nodoc
mixin _$Presence {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_id')
  int? get officeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_name')
  String? get officeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_date_time', fromJson: dateTimeNullableFromJson)
  DateTime? get inDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_radius_from_office')
  double? get inRadiusFromOffice => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
  DateTime? get outDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_radius_from_office')
  double? get outRadiusFromOffice => throw _privateConstructorUsedError;

  /// Serializes this Presence to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PresenceCopyWith<Presence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceCopyWith<$Res> {
  factory $PresenceCopyWith(Presence value, $Res Function(Presence) then) =
      _$PresenceCopyWithImpl<$Res, Presence>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'office_id') int? officeId,
      @JsonKey(name: 'office_name') String? officeName,
      @JsonKey(name: 'in_date_time', fromJson: dateTimeNullableFromJson)
      DateTime? inDateTime,
      @JsonKey(name: 'in_radius_from_office') double? inRadiusFromOffice,
      @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
      DateTime? outDateTime,
      @JsonKey(name: 'out_radius_from_office') double? outRadiusFromOffice});
}

/// @nodoc
class _$PresenceCopyWithImpl<$Res, $Val extends Presence>
    implements $PresenceCopyWith<$Res> {
  _$PresenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? officeId = freezed,
    Object? officeName = freezed,
    Object? inDateTime = freezed,
    Object? inRadiusFromOffice = freezed,
    Object? outDateTime = freezed,
    Object? outRadiusFromOffice = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      officeId: freezed == officeId
          ? _value.officeId
          : officeId // ignore: cast_nullable_to_non_nullable
              as int?,
      officeName: freezed == officeName
          ? _value.officeName
          : officeName // ignore: cast_nullable_to_non_nullable
              as String?,
      inDateTime: freezed == inDateTime
          ? _value.inDateTime
          : inDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inRadiusFromOffice: freezed == inRadiusFromOffice
          ? _value.inRadiusFromOffice
          : inRadiusFromOffice // ignore: cast_nullable_to_non_nullable
              as double?,
      outDateTime: freezed == outDateTime
          ? _value.outDateTime
          : outDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      outRadiusFromOffice: freezed == outRadiusFromOffice
          ? _value.outRadiusFromOffice
          : outRadiusFromOffice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PresenceImplCopyWith<$Res>
    implements $PresenceCopyWith<$Res> {
  factory _$$PresenceImplCopyWith(
          _$PresenceImpl value, $Res Function(_$PresenceImpl) then) =
      __$$PresenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'office_id') int? officeId,
      @JsonKey(name: 'office_name') String? officeName,
      @JsonKey(name: 'in_date_time', fromJson: dateTimeNullableFromJson)
      DateTime? inDateTime,
      @JsonKey(name: 'in_radius_from_office') double? inRadiusFromOffice,
      @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
      DateTime? outDateTime,
      @JsonKey(name: 'out_radius_from_office') double? outRadiusFromOffice});
}

/// @nodoc
class __$$PresenceImplCopyWithImpl<$Res>
    extends _$PresenceCopyWithImpl<$Res, _$PresenceImpl>
    implements _$$PresenceImplCopyWith<$Res> {
  __$$PresenceImplCopyWithImpl(
      _$PresenceImpl _value, $Res Function(_$PresenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? officeId = freezed,
    Object? officeName = freezed,
    Object? inDateTime = freezed,
    Object? inRadiusFromOffice = freezed,
    Object? outDateTime = freezed,
    Object? outRadiusFromOffice = freezed,
  }) {
    return _then(_$PresenceImpl(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == officeId
          ? _value.officeId
          : officeId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == officeName
          ? _value.officeName
          : officeName // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == inDateTime
          ? _value.inDateTime
          : inDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == inRadiusFromOffice
          ? _value.inRadiusFromOffice
          : inRadiusFromOffice // ignore: cast_nullable_to_non_nullable
              as double?,
      freezed == outDateTime
          ? _value.outDateTime
          : outDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == outRadiusFromOffice
          ? _value.outRadiusFromOffice
          : outRadiusFromOffice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceImpl extends _Presence {
  const _$PresenceImpl(
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'office_id') this.officeId,
      @JsonKey(name: 'office_name') this.officeName,
      @JsonKey(name: 'in_date_time', fromJson: dateTimeNullableFromJson)
      this.inDateTime,
      @JsonKey(name: 'in_radius_from_office') this.inRadiusFromOffice,
      @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
      this.outDateTime,
      @JsonKey(name: 'out_radius_from_office') this.outRadiusFromOffice)
      : super._();

  factory _$PresenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  @JsonKey(name: 'office_id')
  final int? officeId;
  @override
  @JsonKey(name: 'office_name')
  final String? officeName;
  @override
  @JsonKey(name: 'in_date_time', fromJson: dateTimeNullableFromJson)
  final DateTime? inDateTime;
  @override
  @JsonKey(name: 'in_radius_from_office')
  final double? inRadiusFromOffice;
  @override
  @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
  final DateTime? outDateTime;
  @override
  @JsonKey(name: 'out_radius_from_office')
  final double? outRadiusFromOffice;

  @override
  String toString() {
    return 'Presence(userId: $userId, userName: $userName, officeId: $officeId, officeName: $officeName, inDateTime: $inDateTime, inRadiusFromOffice: $inRadiusFromOffice, outDateTime: $outDateTime, outRadiusFromOffice: $outRadiusFromOffice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.officeId, officeId) ||
                other.officeId == officeId) &&
            (identical(other.officeName, officeName) ||
                other.officeName == officeName) &&
            (identical(other.inDateTime, inDateTime) ||
                other.inDateTime == inDateTime) &&
            (identical(other.inRadiusFromOffice, inRadiusFromOffice) ||
                other.inRadiusFromOffice == inRadiusFromOffice) &&
            (identical(other.outDateTime, outDateTime) ||
                other.outDateTime == outDateTime) &&
            (identical(other.outRadiusFromOffice, outRadiusFromOffice) ||
                other.outRadiusFromOffice == outRadiusFromOffice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      officeId,
      officeName,
      inDateTime,
      inRadiusFromOffice,
      outDateTime,
      outRadiusFromOffice);

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      __$$PresenceImplCopyWithImpl<_$PresenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceImplToJson(
      this,
    );
  }
}

abstract class _Presence extends Presence {
  const factory _Presence(
      @JsonKey(name: 'user_id') final int userId,
      @JsonKey(name: 'user_name') final String userName,
      @JsonKey(name: 'office_id') final int? officeId,
      @JsonKey(name: 'office_name') final String? officeName,
      @JsonKey(name: 'in_date_time', fromJson: dateTimeNullableFromJson)
      final DateTime? inDateTime,
      @JsonKey(name: 'in_radius_from_office') final double? inRadiusFromOffice,
      @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
      final DateTime? outDateTime,
      @JsonKey(name: 'out_radius_from_office')
      final double? outRadiusFromOffice) = _$PresenceImpl;
  const _Presence._() : super._();

  factory _Presence.fromJson(Map<String, dynamic> json) =
      _$PresenceImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  @JsonKey(name: 'office_id')
  int? get officeId;
  @override
  @JsonKey(name: 'office_name')
  String? get officeName;
  @override
  @JsonKey(name: 'in_date_time', fromJson: dateTimeNullableFromJson)
  DateTime? get inDateTime;
  @override
  @JsonKey(name: 'in_radius_from_office')
  double? get inRadiusFromOffice;
  @override
  @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
  DateTime? get outDateTime;
  @override
  @JsonKey(name: 'out_radius_from_office')
  double? get outRadiusFromOffice;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
