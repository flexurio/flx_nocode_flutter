// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bank _$BankFromJson(Map<String, dynamic> json) {
  return _Bank.fromJson(json);
}

/// @nodoc
mixin _$Bank {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_transaction')
  String get noTransaction => throw _privateConstructorUsedError;
  String get invoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'rec_from')
  String get recForm => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_code')
  String get subCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
  DateTime get mutationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_fee')
  int get transferFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_transfer')
  int get totalTransfer => throw _privateConstructorUsedError;
  String get bank => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Bank to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankCopyWith<Bank> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankCopyWith<$Res> {
  factory $BankCopyWith(Bank value, $Res Function(Bank) then) =
      _$BankCopyWithImpl<$Res, Bank>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'no_transaction') String noTransaction,
      String invoice,
      @JsonKey(name: 'rec_from') String recForm,
      String description,
      int amount,
      String code,
      @JsonKey(name: 'sub_code') String subCode,
      @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
      DateTime mutationDate,
      @JsonKey(name: 'transfer_fee') int transferFee,
      @JsonKey(name: 'total_transfer') int totalTransfer,
      String bank,
      String status});
}

/// @nodoc
class _$BankCopyWithImpl<$Res, $Val extends Bank>
    implements $BankCopyWith<$Res> {
  _$BankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? noTransaction = null,
    Object? invoice = null,
    Object? recForm = null,
    Object? description = null,
    Object? amount = null,
    Object? code = null,
    Object? subCode = null,
    Object? mutationDate = null,
    Object? transferFee = null,
    Object? totalTransfer = null,
    Object? bank = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      noTransaction: null == noTransaction
          ? _value.noTransaction
          : noTransaction // ignore: cast_nullable_to_non_nullable
              as String,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      recForm: null == recForm
          ? _value.recForm
          : recForm // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      subCode: null == subCode
          ? _value.subCode
          : subCode // ignore: cast_nullable_to_non_nullable
              as String,
      mutationDate: null == mutationDate
          ? _value.mutationDate
          : mutationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transferFee: null == transferFee
          ? _value.transferFee
          : transferFee // ignore: cast_nullable_to_non_nullable
              as int,
      totalTransfer: null == totalTransfer
          ? _value.totalTransfer
          : totalTransfer // ignore: cast_nullable_to_non_nullable
              as int,
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankImplCopyWith<$Res> implements $BankCopyWith<$Res> {
  factory _$$BankImplCopyWith(
          _$BankImpl value, $Res Function(_$BankImpl) then) =
      __$$BankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'no_transaction') String noTransaction,
      String invoice,
      @JsonKey(name: 'rec_from') String recForm,
      String description,
      int amount,
      String code,
      @JsonKey(name: 'sub_code') String subCode,
      @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
      DateTime mutationDate,
      @JsonKey(name: 'transfer_fee') int transferFee,
      @JsonKey(name: 'total_transfer') int totalTransfer,
      String bank,
      String status});
}

/// @nodoc
class __$$BankImplCopyWithImpl<$Res>
    extends _$BankCopyWithImpl<$Res, _$BankImpl>
    implements _$$BankImplCopyWith<$Res> {
  __$$BankImplCopyWithImpl(_$BankImpl _value, $Res Function(_$BankImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? noTransaction = null,
    Object? invoice = null,
    Object? recForm = null,
    Object? description = null,
    Object? amount = null,
    Object? code = null,
    Object? subCode = null,
    Object? mutationDate = null,
    Object? transferFee = null,
    Object? totalTransfer = null,
    Object? bank = null,
    Object? status = null,
  }) {
    return _then(_$BankImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      noTransaction: null == noTransaction
          ? _value.noTransaction
          : noTransaction // ignore: cast_nullable_to_non_nullable
              as String,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String,
      recForm: null == recForm
          ? _value.recForm
          : recForm // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      subCode: null == subCode
          ? _value.subCode
          : subCode // ignore: cast_nullable_to_non_nullable
              as String,
      mutationDate: null == mutationDate
          ? _value.mutationDate
          : mutationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transferFee: null == transferFee
          ? _value.transferFee
          : transferFee // ignore: cast_nullable_to_non_nullable
              as int,
      totalTransfer: null == totalTransfer
          ? _value.totalTransfer
          : totalTransfer // ignore: cast_nullable_to_non_nullable
              as int,
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankImpl extends _Bank {
  const _$BankImpl(
      {required this.date,
      @JsonKey(name: 'no_transaction') required this.noTransaction,
      required this.invoice,
      @JsonKey(name: 'rec_from') required this.recForm,
      required this.description,
      required this.amount,
      required this.code,
      @JsonKey(name: 'sub_code') required this.subCode,
      @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
      required this.mutationDate,
      @JsonKey(name: 'transfer_fee') required this.transferFee,
      @JsonKey(name: 'total_transfer') required this.totalTransfer,
      required this.bank,
      required this.status})
      : super._();

  factory _$BankImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'no_transaction')
  final String noTransaction;
  @override
  final String invoice;
  @override
  @JsonKey(name: 'rec_from')
  final String recForm;
  @override
  final String description;
  @override
  final int amount;
  @override
  final String code;
  @override
  @JsonKey(name: 'sub_code')
  final String subCode;
  @override
  @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
  final DateTime mutationDate;
  @override
  @JsonKey(name: 'transfer_fee')
  final int transferFee;
  @override
  @JsonKey(name: 'total_transfer')
  final int totalTransfer;
  @override
  final String bank;
  @override
  final String status;

  @override
  String toString() {
    return 'Bank(date: $date, noTransaction: $noTransaction, invoice: $invoice, recForm: $recForm, description: $description, amount: $amount, code: $code, subCode: $subCode, mutationDate: $mutationDate, transferFee: $transferFee, totalTransfer: $totalTransfer, bank: $bank, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.noTransaction, noTransaction) ||
                other.noTransaction == noTransaction) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.recForm, recForm) || other.recForm == recForm) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.subCode, subCode) || other.subCode == subCode) &&
            (identical(other.mutationDate, mutationDate) ||
                other.mutationDate == mutationDate) &&
            (identical(other.transferFee, transferFee) ||
                other.transferFee == transferFee) &&
            (identical(other.totalTransfer, totalTransfer) ||
                other.totalTransfer == totalTransfer) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      noTransaction,
      invoice,
      recForm,
      description,
      amount,
      code,
      subCode,
      mutationDate,
      transferFee,
      totalTransfer,
      bank,
      status);

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankImplCopyWith<_$BankImpl> get copyWith =>
      __$$BankImplCopyWithImpl<_$BankImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankImplToJson(
      this,
    );
  }
}

abstract class _Bank extends Bank {
  const factory _Bank(
      {required final String date,
      @JsonKey(name: 'no_transaction') required final String noTransaction,
      required final String invoice,
      @JsonKey(name: 'rec_from') required final String recForm,
      required final String description,
      required final int amount,
      required final String code,
      @JsonKey(name: 'sub_code') required final String subCode,
      @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
      required final DateTime mutationDate,
      @JsonKey(name: 'transfer_fee') required final int transferFee,
      @JsonKey(name: 'total_transfer') required final int totalTransfer,
      required final String bank,
      required final String status}) = _$BankImpl;
  const _Bank._() : super._();

  factory _Bank.fromJson(Map<String, dynamic> json) = _$BankImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'no_transaction')
  String get noTransaction;
  @override
  String get invoice;
  @override
  @JsonKey(name: 'rec_from')
  String get recForm;
  @override
  String get description;
  @override
  int get amount;
  @override
  String get code;
  @override
  @JsonKey(name: 'sub_code')
  String get subCode;
  @override
  @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
  DateTime get mutationDate;
  @override
  @JsonKey(name: 'transfer_fee')
  int get transferFee;
  @override
  @JsonKey(name: 'total_transfer')
  int get totalTransfer;
  @override
  String get bank;
  @override
  String get status;

  /// Create a copy of Bank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankImplCopyWith<_$BankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
