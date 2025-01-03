// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_journal_accounting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionJournalAccounting _$TransactionJournalAccountingFromJson(
    Map<String, dynamic> json) {
  return _TransactionJournalAccounting.fromJson(json);
}

/// @nodoc
mixin _$TransactionJournalAccounting {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_name')
  String get chartOfAccountName => throw _privateConstructorUsedError;
  double get debit => throw _privateConstructorUsedError;
  double get credit => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get unique => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'save_date', fromJson: isoDateToDateTime)
  DateTime get saveDate => throw _privateConstructorUsedError;
  double get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'journal_name')
  String get journalName => throw _privateConstructorUsedError;
  String get trans => throw _privateConstructorUsedError;
  bool get tb => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_type')
  int get budgetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  DateTime get releaseDate => throw _privateConstructorUsedError;

  /// Serializes this TransactionJournalAccounting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionJournalAccounting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionJournalAccountingCopyWith<TransactionJournalAccounting>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionJournalAccountingCopyWith<$Res> {
  factory $TransactionJournalAccountingCopyWith(
          TransactionJournalAccounting value,
          $Res Function(TransactionJournalAccounting) then) =
      _$TransactionJournalAccountingCopyWithImpl<$Res,
          TransactionJournalAccounting>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'chart_of_account_id') String chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') String chartOfAccountName,
      double debit,
      double credit,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      String reference,
      String unique,
      String value,
      String username,
      String description,
      @JsonKey(name: 'save_date', fromJson: isoDateToDateTime)
      DateTime saveDate,
      double count,
      @JsonKey(name: 'journal_name') String journalName,
      String trans,
      bool tb,
      @JsonKey(name: 'budget_type') int budgetType,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      DateTime releaseDate});

  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class _$TransactionJournalAccountingCopyWithImpl<$Res,
        $Val extends TransactionJournalAccounting>
    implements $TransactionJournalAccountingCopyWith<$Res> {
  _$TransactionJournalAccountingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionJournalAccounting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? department = null,
    Object? chartOfAccountId = null,
    Object? chartOfAccountName = null,
    Object? debit = null,
    Object? credit = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? reference = null,
    Object? unique = null,
    Object? value = null,
    Object? username = null,
    Object? description = null,
    Object? saveDate = null,
    Object? count = null,
    Object? journalName = null,
    Object? trans = null,
    Object? tb = null,
    Object? budgetType = null,
    Object? releaseDate = null,
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
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      chartOfAccountId: null == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountName: null == chartOfAccountName
          ? _value.chartOfAccountName
          : chartOfAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      saveDate: null == saveDate
          ? _value.saveDate
          : saveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      journalName: null == journalName
          ? _value.journalName
          : journalName // ignore: cast_nullable_to_non_nullable
              as String,
      trans: null == trans
          ? _value.trans
          : trans // ignore: cast_nullable_to_non_nullable
              as String,
      tb: null == tb
          ? _value.tb
          : tb // ignore: cast_nullable_to_non_nullable
              as bool,
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of TransactionJournalAccounting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionJournalAccountingImplCopyWith<$Res>
    implements $TransactionJournalAccountingCopyWith<$Res> {
  factory _$$TransactionJournalAccountingImplCopyWith(
          _$TransactionJournalAccountingImpl value,
          $Res Function(_$TransactionJournalAccountingImpl) then) =
      __$$TransactionJournalAccountingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'chart_of_account_id') String chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') String chartOfAccountName,
      double debit,
      double credit,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      String reference,
      String unique,
      String value,
      String username,
      String description,
      @JsonKey(name: 'save_date', fromJson: isoDateToDateTime)
      DateTime saveDate,
      double count,
      @JsonKey(name: 'journal_name') String journalName,
      String trans,
      bool tb,
      @JsonKey(name: 'budget_type') int budgetType,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      DateTime releaseDate});

  @override
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class __$$TransactionJournalAccountingImplCopyWithImpl<$Res>
    extends _$TransactionJournalAccountingCopyWithImpl<$Res,
        _$TransactionJournalAccountingImpl>
    implements _$$TransactionJournalAccountingImplCopyWith<$Res> {
  __$$TransactionJournalAccountingImplCopyWithImpl(
      _$TransactionJournalAccountingImpl _value,
      $Res Function(_$TransactionJournalAccountingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionJournalAccounting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? department = null,
    Object? chartOfAccountId = null,
    Object? chartOfAccountName = null,
    Object? debit = null,
    Object? credit = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? reference = null,
    Object? unique = null,
    Object? value = null,
    Object? username = null,
    Object? description = null,
    Object? saveDate = null,
    Object? count = null,
    Object? journalName = null,
    Object? trans = null,
    Object? tb = null,
    Object? budgetType = null,
    Object? releaseDate = null,
  }) {
    return _then(_$TransactionJournalAccountingImpl(
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
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      chartOfAccountId: null == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountName: null == chartOfAccountName
          ? _value.chartOfAccountName
          : chartOfAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      saveDate: null == saveDate
          ? _value.saveDate
          : saveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      journalName: null == journalName
          ? _value.journalName
          : journalName // ignore: cast_nullable_to_non_nullable
              as String,
      trans: null == trans
          ? _value.trans
          : trans // ignore: cast_nullable_to_non_nullable
              as String,
      tb: null == tb
          ? _value.tb
          : tb // ignore: cast_nullable_to_non_nullable
              as bool,
      budgetType: null == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionJournalAccountingImpl extends _TransactionJournalAccounting {
  _$TransactionJournalAccountingImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      required this.department,
      @JsonKey(name: 'chart_of_account_id') required this.chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') required this.chartOfAccountName,
      required this.debit,
      required this.credit,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      required this.reference,
      required this.unique,
      required this.value,
      required this.username,
      required this.description,
      @JsonKey(name: 'save_date', fromJson: isoDateToDateTime)
      required this.saveDate,
      required this.count,
      @JsonKey(name: 'journal_name') required this.journalName,
      required this.trans,
      required this.tb,
      @JsonKey(name: 'budget_type') required this.budgetType,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      required this.releaseDate})
      : super._();

  factory _$TransactionJournalAccountingImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionJournalAccountingImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(name: 'chart_of_account_id')
  final String chartOfAccountId;
  @override
  @JsonKey(name: 'chart_of_account_name')
  final String chartOfAccountName;
  @override
  final double debit;
  @override
  final double credit;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  final String reference;
  @override
  final String unique;
  @override
  final String value;
  @override
  final String username;
  @override
  final String description;
  @override
  @JsonKey(name: 'save_date', fromJson: isoDateToDateTime)
  final DateTime saveDate;
  @override
  final double count;
  @override
  @JsonKey(name: 'journal_name')
  final String journalName;
  @override
  final String trans;
  @override
  final bool tb;
  @override
  @JsonKey(name: 'budget_type')
  final int budgetType;
  @override
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  final DateTime releaseDate;

  @override
  String toString() {
    return 'TransactionJournalAccounting(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, department: $department, chartOfAccountId: $chartOfAccountId, chartOfAccountName: $chartOfAccountName, debit: $debit, credit: $credit, transactionNo: $transactionNo, transactionDate: $transactionDate, reference: $reference, unique: $unique, value: $value, username: $username, description: $description, saveDate: $saveDate, count: $count, journalName: $journalName, trans: $trans, tb: $tb, budgetType: $budgetType, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionJournalAccountingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.chartOfAccountId, chartOfAccountId) ||
                other.chartOfAccountId == chartOfAccountId) &&
            (identical(other.chartOfAccountName, chartOfAccountName) ||
                other.chartOfAccountName == chartOfAccountName) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.saveDate, saveDate) ||
                other.saveDate == saveDate) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.journalName, journalName) ||
                other.journalName == journalName) &&
            (identical(other.trans, trans) || other.trans == trans) &&
            (identical(other.tb, tb) || other.tb == tb) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        department,
        chartOfAccountId,
        chartOfAccountName,
        debit,
        credit,
        transactionNo,
        transactionDate,
        reference,
        unique,
        value,
        username,
        description,
        saveDate,
        count,
        journalName,
        trans,
        tb,
        budgetType,
        releaseDate
      ]);

  /// Create a copy of TransactionJournalAccounting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionJournalAccountingImplCopyWith<
          _$TransactionJournalAccountingImpl>
      get copyWith => __$$TransactionJournalAccountingImplCopyWithImpl<
          _$TransactionJournalAccountingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionJournalAccountingImplToJson(
      this,
    );
  }
}

abstract class _TransactionJournalAccounting
    extends TransactionJournalAccounting {
  factory _TransactionJournalAccounting(
          {required final int id,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'department', fromJson: Department.fromJson)
          required final Department department,
          @JsonKey(name: 'chart_of_account_id')
          required final String chartOfAccountId,
          @JsonKey(name: 'chart_of_account_name')
          required final String chartOfAccountName,
          required final double debit,
          required final double credit,
          @JsonKey(name: 'transaction_no') required final String transactionNo,
          @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
          required final DateTime transactionDate,
          required final String reference,
          required final String unique,
          required final String value,
          required final String username,
          required final String description,
          @JsonKey(name: 'save_date', fromJson: isoDateToDateTime)
          required final DateTime saveDate,
          required final double count,
          @JsonKey(name: 'journal_name') required final String journalName,
          required final String trans,
          required final bool tb,
          @JsonKey(name: 'budget_type') required final int budgetType,
          @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
          required final DateTime releaseDate}) =
      _$TransactionJournalAccountingImpl;
  _TransactionJournalAccounting._() : super._();

  factory _TransactionJournalAccounting.fromJson(Map<String, dynamic> json) =
      _$TransactionJournalAccountingImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountId;
  @override
  @JsonKey(name: 'chart_of_account_name')
  String get chartOfAccountName;
  @override
  double get debit;
  @override
  double get credit;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  String get reference;
  @override
  String get unique;
  @override
  String get value;
  @override
  String get username;
  @override
  String get description;
  @override
  @JsonKey(name: 'save_date', fromJson: isoDateToDateTime)
  DateTime get saveDate;
  @override
  double get count;
  @override
  @JsonKey(name: 'journal_name')
  String get journalName;
  @override
  String get trans;
  @override
  bool get tb;
  @override
  @JsonKey(name: 'budget_type')
  int get budgetType;
  @override
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  DateTime get releaseDate;

  /// Create a copy of TransactionJournalAccounting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionJournalAccountingImplCopyWith<
          _$TransactionJournalAccountingImpl>
      get copyWith => throw _privateConstructorUsedError;
}
