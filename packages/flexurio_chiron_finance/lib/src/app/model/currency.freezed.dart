// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  @JsonKey(
      name: 'created_at',
      fromJson: isoDateToDateTime,
      toJson: dateTimeToIsoDate)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'updated_at',
      fromJson: isoDateToDateTime,
      toJson: dateTimeToIsoDate)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  Offline? get offline => throw _privateConstructorUsedError;

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'created_at',
          fromJson: isoDateToDateTime,
          toJson: dateTimeToIsoDate)
      DateTime createdAt,
      @JsonKey(
          name: 'updated_at',
          fromJson: isoDateToDateTime,
          toJson: dateTimeToIsoDate)
      DateTime updatedAt,
      @JsonKey(name: 'id') String id,
      Offline? offline});

  $OfflineCopyWith<$Res>? get offline;
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? offline = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      offline: freezed == offline
          ? _value.offline
          : offline // ignore: cast_nullable_to_non_nullable
              as Offline?,
    ) as $Val);
  }

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfflineCopyWith<$Res>? get offline {
    if (_value.offline == null) {
      return null;
    }

    return $OfflineCopyWith<$Res>(_value.offline!, (value) {
      return _then(_value.copyWith(offline: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyImplCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$$CurrencyImplCopyWith(
          _$CurrencyImpl value, $Res Function(_$CurrencyImpl) then) =
      __$$CurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'created_at',
          fromJson: isoDateToDateTime,
          toJson: dateTimeToIsoDate)
      DateTime createdAt,
      @JsonKey(
          name: 'updated_at',
          fromJson: isoDateToDateTime,
          toJson: dateTimeToIsoDate)
      DateTime updatedAt,
      @JsonKey(name: 'id') String id,
      Offline? offline});

  @override
  $OfflineCopyWith<$Res>? get offline;
}

/// @nodoc
class __$$CurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$CurrencyImpl>
    implements _$$CurrencyImplCopyWith<$Res> {
  __$$CurrencyImplCopyWithImpl(
      _$CurrencyImpl _value, $Res Function(_$CurrencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? offline = freezed,
  }) {
    return _then(_$CurrencyImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      offline: freezed == offline
          ? _value.offline
          : offline // ignore: cast_nullable_to_non_nullable
              as Offline?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyImpl extends _Currency {
  _$CurrencyImpl(
      {@JsonKey(
          name: 'created_at',
          fromJson: isoDateToDateTime,
          toJson: dateTimeToIsoDate)
      required this.createdAt,
      @JsonKey(
          name: 'updated_at',
          fromJson: isoDateToDateTime,
          toJson: dateTimeToIsoDate)
      required this.updatedAt,
      @JsonKey(name: 'id') required this.id,
      this.offline})
      : super._();

  factory _$CurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyImplFromJson(json);

  @override
  @JsonKey(
      name: 'created_at',
      fromJson: isoDateToDateTime,
      toJson: dateTimeToIsoDate)
  final DateTime createdAt;
  @override
  @JsonKey(
      name: 'updated_at',
      fromJson: isoDateToDateTime,
      toJson: dateTimeToIsoDate)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  final Offline? offline;

  @override
  String toString() {
    return 'Currency(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, offline: $offline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offline, offline) || other.offline == offline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, createdAt, updatedAt, id, offline);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      __$$CurrencyImplCopyWithImpl<_$CurrencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyImplToJson(
      this,
    );
  }
}

abstract class _Currency extends Currency {
  factory _Currency(
      {@JsonKey(
          name: 'created_at',
          fromJson: isoDateToDateTime,
          toJson: dateTimeToIsoDate)
      required final DateTime createdAt,
      @JsonKey(
          name: 'updated_at',
          fromJson: isoDateToDateTime,
          toJson: dateTimeToIsoDate)
      required final DateTime updatedAt,
      @JsonKey(name: 'id') required final String id,
      final Offline? offline}) = _$CurrencyImpl;
  _Currency._() : super._();

  factory _Currency.fromJson(Map<String, dynamic> json) =
      _$CurrencyImpl.fromJson;

  @override
  @JsonKey(
      name: 'created_at',
      fromJson: isoDateToDateTime,
      toJson: dateTimeToIsoDate)
  DateTime get createdAt;
  @override
  @JsonKey(
      name: 'updated_at',
      fromJson: isoDateToDateTime,
      toJson: dateTimeToIsoDate)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  Offline? get offline;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Offline _$OfflineFromJson(Map<String, dynamic> json) {
  return _Offline.fromJson(json);
}

/// @nodoc
mixin _$Offline {
  String get host => throw _privateConstructorUsedError;

  /// Serializes this Offline to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Offline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfflineCopyWith<Offline> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineCopyWith<$Res> {
  factory $OfflineCopyWith(Offline value, $Res Function(Offline) then) =
      _$OfflineCopyWithImpl<$Res, Offline>;
  @useResult
  $Res call({String host});
}

/// @nodoc
class _$OfflineCopyWithImpl<$Res, $Val extends Offline>
    implements $OfflineCopyWith<$Res> {
  _$OfflineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Offline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfflineImplCopyWith<$Res> implements $OfflineCopyWith<$Res> {
  factory _$$OfflineImplCopyWith(
          _$OfflineImpl value, $Res Function(_$OfflineImpl) then) =
      __$$OfflineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String host});
}

/// @nodoc
class __$$OfflineImplCopyWithImpl<$Res>
    extends _$OfflineCopyWithImpl<$Res, _$OfflineImpl>
    implements _$$OfflineImplCopyWith<$Res> {
  __$$OfflineImplCopyWithImpl(
      _$OfflineImpl _value, $Res Function(_$OfflineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Offline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
  }) {
    return _then(_$OfflineImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfflineImpl extends _Offline {
  _$OfflineImpl({required this.host}) : super._();

  factory _$OfflineImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfflineImplFromJson(json);

  @override
  final String host;

  @override
  String toString() {
    return 'Offline(host: $host)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineImpl &&
            (identical(other.host, host) || other.host == host));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, host);

  /// Create a copy of Offline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineImplCopyWith<_$OfflineImpl> get copyWith =>
      __$$OfflineImplCopyWithImpl<_$OfflineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfflineImplToJson(
      this,
    );
  }
}

abstract class _Offline extends Offline {
  factory _Offline({required final String host}) = _$OfflineImpl;
  _Offline._() : super._();

  factory _Offline.fromJson(Map<String, dynamic> json) = _$OfflineImpl.fromJson;

  @override
  String get host;

  /// Create a copy of Offline
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfflineImplCopyWith<_$OfflineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
