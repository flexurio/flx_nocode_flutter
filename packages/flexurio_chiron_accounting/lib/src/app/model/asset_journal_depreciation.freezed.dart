// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_journal_depreciation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetJournalDepreciation _$AssetJournalDepreciationFromJson(
    Map<String, dynamic> json) {
  return _AssetJournalDepreciation.fromJson(json);
}

/// @nodoc
mixin _$AssetJournalDepreciation {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_start', fromJson: isoDateToDateTime)
  DateTime get periodStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_end', fromJson: isoDateToDateTime)
  DateTime get periodEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  int get debit => throw _privateConstructorUsedError;
  int get credit => throw _privateConstructorUsedError;

  /// Serializes this AssetJournalDepreciation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetJournalDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetJournalDepreciationCopyWith<AssetJournalDepreciation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetJournalDepreciationCopyWith<$Res> {
  factory $AssetJournalDepreciationCopyWith(AssetJournalDepreciation value,
          $Res Function(AssetJournalDepreciation) then) =
      _$AssetJournalDepreciationCopyWithImpl<$Res, AssetJournalDepreciation>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'period_start', fromJson: isoDateToDateTime)
      DateTime periodStart,
      @JsonKey(name: 'period_end', fromJson: isoDateToDateTime)
      DateTime periodEnd,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'transaction_id') String transactionId,
      int debit,
      int credit});
}

/// @nodoc
class _$AssetJournalDepreciationCopyWithImpl<$Res,
        $Val extends AssetJournalDepreciation>
    implements $AssetJournalDepreciationCopyWith<$Res> {
  _$AssetJournalDepreciationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetJournalDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? transactionDate = null,
    Object? transactionId = null,
    Object? debit = null,
    Object? credit = null,
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
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as int,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetJournalDepreciationImplCopyWith<$Res>
    implements $AssetJournalDepreciationCopyWith<$Res> {
  factory _$$AssetJournalDepreciationImplCopyWith(
          _$AssetJournalDepreciationImpl value,
          $Res Function(_$AssetJournalDepreciationImpl) then) =
      __$$AssetJournalDepreciationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'period_start', fromJson: isoDateToDateTime)
      DateTime periodStart,
      @JsonKey(name: 'period_end', fromJson: isoDateToDateTime)
      DateTime periodEnd,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'transaction_id') String transactionId,
      int debit,
      int credit});
}

/// @nodoc
class __$$AssetJournalDepreciationImplCopyWithImpl<$Res>
    extends _$AssetJournalDepreciationCopyWithImpl<$Res,
        _$AssetJournalDepreciationImpl>
    implements _$$AssetJournalDepreciationImplCopyWith<$Res> {
  __$$AssetJournalDepreciationImplCopyWithImpl(
      _$AssetJournalDepreciationImpl _value,
      $Res Function(_$AssetJournalDepreciationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetJournalDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? transactionDate = null,
    Object? transactionId = null,
    Object? debit = null,
    Object? credit = null,
  }) {
    return _then(_$AssetJournalDepreciationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as int,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetJournalDepreciationImpl extends _AssetJournalDepreciation {
  _$AssetJournalDepreciationImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'period_start', fromJson: isoDateToDateTime)
      required this.periodStart,
      @JsonKey(name: 'period_end', fromJson: isoDateToDateTime)
      required this.periodEnd,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      required this.debit,
      required this.credit})
      : super._();

  factory _$AssetJournalDepreciationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetJournalDepreciationImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'period_start', fromJson: isoDateToDateTime)
  final DateTime periodStart;
  @override
  @JsonKey(name: 'period_end', fromJson: isoDateToDateTime)
  final DateTime periodEnd;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  final int debit;
  @override
  final int credit;

  @override
  String toString() {
    return 'AssetJournalDepreciation(id: $id, createdAt: $createdAt, createdById: $createdById, periodStart: $periodStart, periodEnd: $periodEnd, transactionDate: $transactionDate, transactionId: $transactionId, debit: $debit, credit: $credit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetJournalDepreciationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.credit, credit) || other.credit == credit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, createdById,
      periodStart, periodEnd, transactionDate, transactionId, debit, credit);

  /// Create a copy of AssetJournalDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetJournalDepreciationImplCopyWith<_$AssetJournalDepreciationImpl>
      get copyWith => __$$AssetJournalDepreciationImplCopyWithImpl<
          _$AssetJournalDepreciationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetJournalDepreciationImplToJson(
      this,
    );
  }
}

abstract class _AssetJournalDepreciation extends AssetJournalDepreciation {
  factory _AssetJournalDepreciation(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'period_start', fromJson: isoDateToDateTime)
      required final DateTime periodStart,
      @JsonKey(name: 'period_end', fromJson: isoDateToDateTime)
      required final DateTime periodEnd,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'transaction_id') required final String transactionId,
      required final int debit,
      required final int credit}) = _$AssetJournalDepreciationImpl;
  _AssetJournalDepreciation._() : super._();

  factory _AssetJournalDepreciation.fromJson(Map<String, dynamic> json) =
      _$AssetJournalDepreciationImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'period_start', fromJson: isoDateToDateTime)
  DateTime get periodStart;
  @override
  @JsonKey(name: 'period_end', fromJson: isoDateToDateTime)
  DateTime get periodEnd;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  int get debit;
  @override
  int get credit;

  /// Create a copy of AssetJournalDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetJournalDepreciationImplCopyWith<_$AssetJournalDepreciationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
