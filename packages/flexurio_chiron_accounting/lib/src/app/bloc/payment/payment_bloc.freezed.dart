// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)
        initial,
    required TResult Function() loading,
    required TResult Function(String? id) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? id)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult Function()? loading,
    TResult Function(String? id)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Transaction>? transaction,
      Payment? payment,
      ChartOfAccountNumber? chartOfAccountNumber,
      Department? department});

  $PaymentCopyWith<$Res>? get payment;
  $ChartOfAccountNumberCopyWith<$Res>? get chartOfAccountNumber;
  $DepartmentCopyWith<$Res>? get department;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = freezed,
    Object? payment = freezed,
    Object? chartOfAccountNumber = freezed,
    Object? department = freezed,
  }) {
    return _then(_$InitialImpl(
      transaction: freezed == transaction
          ? _value._transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment?,
      chartOfAccountNumber: freezed == chartOfAccountNumber
          ? _value.chartOfAccountNumber
          : chartOfAccountNumber // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department?,
    ));
  }

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<$Res>? get payment {
    if (_value.payment == null) {
      return null;
    }

    return $PaymentCopyWith<$Res>(_value.payment!, (value) {
      return _then(_value.copyWith(payment: value));
    });
  }

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartOfAccountNumberCopyWith<$Res>? get chartOfAccountNumber {
    if (_value.chartOfAccountNumber == null) {
      return null;
    }

    return $ChartOfAccountNumberCopyWith<$Res>(_value.chartOfAccountNumber!,
        (value) {
      return _then(_value.copyWith(chartOfAccountNumber: value));
    });
  }

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res>? get department {
    if (_value.department == null) {
      return null;
    }

    return $DepartmentCopyWith<$Res>(_value.department!, (value) {
      return _then(_value.copyWith(department: value));
    });
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<Transaction>? transaction,
      this.payment,
      this.chartOfAccountNumber,
      this.department})
      : _transaction = transaction;

  final List<Transaction>? _transaction;
  @override
  List<Transaction>? get transaction {
    final value = _transaction;
    if (value == null) return null;
    if (_transaction is EqualUnmodifiableListView) return _transaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Payment? payment;
  @override
  final ChartOfAccountNumber? chartOfAccountNumber;
  @override
  final Department? department;

  @override
  String toString() {
    return 'PaymentState.initial(transaction: $transaction, payment: $payment, chartOfAccountNumber: $chartOfAccountNumber, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._transaction, _transaction) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.chartOfAccountNumber, chartOfAccountNumber) ||
                other.chartOfAccountNumber == chartOfAccountNumber) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transaction),
      payment,
      chartOfAccountNumber,
      department);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)
        initial,
    required TResult Function() loading,
    required TResult Function(String? id) success,
    required TResult Function(String error) error,
  }) {
    return initial(transaction, payment, chartOfAccountNumber, department);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? id)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(
        transaction, payment, chartOfAccountNumber, department);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult Function()? loading,
    TResult Function(String? id)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(transaction, payment, chartOfAccountNumber, department);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PaymentState {
  const factory _Initial(
      {final List<Transaction>? transaction,
      final Payment? payment,
      final ChartOfAccountNumber? chartOfAccountNumber,
      final Department? department}) = _$InitialImpl;

  List<Transaction>? get transaction;
  Payment? get payment;
  ChartOfAccountNumber? get chartOfAccountNumber;
  Department? get department;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PaymentState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)
        initial,
    required TResult Function() loading,
    required TResult Function(String? id) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? id)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult Function()? loading,
    TResult Function(String? id)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PaymentState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.id);

  @override
  final String? id;

  @override
  String toString() {
    return 'PaymentState.success(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)
        initial,
    required TResult Function() loading,
    required TResult Function(String? id) success,
    required TResult Function(String error) error,
  }) {
    return success(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? id)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult Function()? loading,
    TResult Function(String? id)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements PaymentState {
  const factory _Success(final String? id) = _$SuccessImpl;

  String? get id;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PaymentState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)
        initial,
    required TResult Function() loading,
    required TResult Function(String? id) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? id)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Transaction>? transaction, Payment? payment,
            ChartOfAccountNumber? chartOfAccountNumber, Department? department)?
        initial,
    TResult Function()? loading,
    TResult Function(String? id)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PaymentState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Payment payment, Transaction? transaction)
        initialize,
    required TResult Function(List<Transaction> transactions, String customerId)
        createFormTransaction,
    required TResult Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)
        createFormPayment,
    required TResult Function(TransactionPayment? transactionPayment) submit,
    required TResult Function(
            PlatformFile file, String registerNo, DateTime date)
        uploadSalaries,
    required TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)
        edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Payment payment, Transaction? transaction)? initialize,
    TResult? Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult? Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)?
        createFormPayment,
    TResult? Function(TransactionPayment? transactionPayment)? submit,
    TResult? Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult? Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Payment payment, Transaction? transaction)? initialize,
    TResult Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult Function(Payment payment, ChartOfAccountNumber chartOfAccountNumber,
            Department department)?
        createFormPayment,
    TResult Function(TransactionPayment? transactionPayment)? submit,
    TResult Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateFormTransaction value)
        createFormTransaction,
    required TResult Function(_CreateFormPayment value) createFormPayment,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UploadSalaries value) uploadSalaries,
    required TResult Function(_Edit value) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateFormTransaction value)? createFormTransaction,
    TResult? Function(_CreateFormPayment value)? createFormPayment,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UploadSalaries value)? uploadSalaries,
    TResult? Function(_Edit value)? edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateFormTransaction value)? createFormTransaction,
    TResult Function(_CreateFormPayment value)? createFormPayment,
    TResult Function(_Submit value)? submit,
    TResult Function(_UploadSalaries value)? uploadSalaries,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res, PaymentEvent>;
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res, $Val extends PaymentEvent>
    implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Payment payment, Transaction? transaction});

  $PaymentCopyWith<$Res> get payment;
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? transaction = freezed,
  }) {
    return _then(_$InitializeImpl(
      null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
    ));
  }

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<$Res> get payment {
    return $PaymentCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value));
    });
  }

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.payment, this.transaction);

  @override
  final Payment payment;
  @override
  final Transaction? transaction;

  @override
  String toString() {
    return 'PaymentEvent.initialize(payment: $payment, transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payment, transaction);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Payment payment, Transaction? transaction)
        initialize,
    required TResult Function(List<Transaction> transactions, String customerId)
        createFormTransaction,
    required TResult Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)
        createFormPayment,
    required TResult Function(TransactionPayment? transactionPayment) submit,
    required TResult Function(
            PlatformFile file, String registerNo, DateTime date)
        uploadSalaries,
    required TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)
        edit,
  }) {
    return initialize(payment, transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Payment payment, Transaction? transaction)? initialize,
    TResult? Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult? Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)?
        createFormPayment,
    TResult? Function(TransactionPayment? transactionPayment)? submit,
    TResult? Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult? Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
  }) {
    return initialize?.call(payment, transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Payment payment, Transaction? transaction)? initialize,
    TResult Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult Function(Payment payment, ChartOfAccountNumber chartOfAccountNumber,
            Department department)?
        createFormPayment,
    TResult Function(TransactionPayment? transactionPayment)? submit,
    TResult Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(payment, transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateFormTransaction value)
        createFormTransaction,
    required TResult Function(_CreateFormPayment value) createFormPayment,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UploadSalaries value) uploadSalaries,
    required TResult Function(_Edit value) edit,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateFormTransaction value)? createFormTransaction,
    TResult? Function(_CreateFormPayment value)? createFormPayment,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UploadSalaries value)? uploadSalaries,
    TResult? Function(_Edit value)? edit,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateFormTransaction value)? createFormTransaction,
    TResult Function(_CreateFormPayment value)? createFormPayment,
    TResult Function(_Submit value)? submit,
    TResult Function(_UploadSalaries value)? uploadSalaries,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements PaymentEvent {
  const factory _Initialize(
      final Payment payment, final Transaction? transaction) = _$InitializeImpl;

  Payment get payment;
  Transaction? get transaction;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFormTransactionImplCopyWith<$Res> {
  factory _$$CreateFormTransactionImplCopyWith(
          _$CreateFormTransactionImpl value,
          $Res Function(_$CreateFormTransactionImpl) then) =
      __$$CreateFormTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Transaction> transactions, String customerId});
}

/// @nodoc
class __$$CreateFormTransactionImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$CreateFormTransactionImpl>
    implements _$$CreateFormTransactionImplCopyWith<$Res> {
  __$$CreateFormTransactionImplCopyWithImpl(_$CreateFormTransactionImpl _value,
      $Res Function(_$CreateFormTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? customerId = null,
  }) {
    return _then(_$CreateFormTransactionImpl(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateFormTransactionImpl implements _CreateFormTransaction {
  const _$CreateFormTransactionImpl(
      final List<Transaction> transactions, this.customerId)
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final String customerId;

  @override
  String toString() {
    return 'PaymentEvent.createFormTransaction(transactions: $transactions, customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFormTransactionImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactions), customerId);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFormTransactionImplCopyWith<_$CreateFormTransactionImpl>
      get copyWith => __$$CreateFormTransactionImplCopyWithImpl<
          _$CreateFormTransactionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Payment payment, Transaction? transaction)
        initialize,
    required TResult Function(List<Transaction> transactions, String customerId)
        createFormTransaction,
    required TResult Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)
        createFormPayment,
    required TResult Function(TransactionPayment? transactionPayment) submit,
    required TResult Function(
            PlatformFile file, String registerNo, DateTime date)
        uploadSalaries,
    required TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)
        edit,
  }) {
    return createFormTransaction(transactions, customerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Payment payment, Transaction? transaction)? initialize,
    TResult? Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult? Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)?
        createFormPayment,
    TResult? Function(TransactionPayment? transactionPayment)? submit,
    TResult? Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult? Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
  }) {
    return createFormTransaction?.call(transactions, customerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Payment payment, Transaction? transaction)? initialize,
    TResult Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult Function(Payment payment, ChartOfAccountNumber chartOfAccountNumber,
            Department department)?
        createFormPayment,
    TResult Function(TransactionPayment? transactionPayment)? submit,
    TResult Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
    required TResult orElse(),
  }) {
    if (createFormTransaction != null) {
      return createFormTransaction(transactions, customerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateFormTransaction value)
        createFormTransaction,
    required TResult Function(_CreateFormPayment value) createFormPayment,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UploadSalaries value) uploadSalaries,
    required TResult Function(_Edit value) edit,
  }) {
    return createFormTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateFormTransaction value)? createFormTransaction,
    TResult? Function(_CreateFormPayment value)? createFormPayment,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UploadSalaries value)? uploadSalaries,
    TResult? Function(_Edit value)? edit,
  }) {
    return createFormTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateFormTransaction value)? createFormTransaction,
    TResult Function(_CreateFormPayment value)? createFormPayment,
    TResult Function(_Submit value)? submit,
    TResult Function(_UploadSalaries value)? uploadSalaries,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (createFormTransaction != null) {
      return createFormTransaction(this);
    }
    return orElse();
  }
}

abstract class _CreateFormTransaction implements PaymentEvent {
  const factory _CreateFormTransaction(
          final List<Transaction> transactions, final String customerId) =
      _$CreateFormTransactionImpl;

  List<Transaction> get transactions;
  String get customerId;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFormTransactionImplCopyWith<_$CreateFormTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFormPaymentImplCopyWith<$Res> {
  factory _$$CreateFormPaymentImplCopyWith(_$CreateFormPaymentImpl value,
          $Res Function(_$CreateFormPaymentImpl) then) =
      __$$CreateFormPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Payment payment,
      ChartOfAccountNumber chartOfAccountNumber,
      Department department});

  $PaymentCopyWith<$Res> get payment;
  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccountNumber;
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class __$$CreateFormPaymentImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$CreateFormPaymentImpl>
    implements _$$CreateFormPaymentImplCopyWith<$Res> {
  __$$CreateFormPaymentImplCopyWithImpl(_$CreateFormPaymentImpl _value,
      $Res Function(_$CreateFormPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? chartOfAccountNumber = null,
    Object? department = null,
  }) {
    return _then(_$CreateFormPaymentImpl(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      chartOfAccountNumber: null == chartOfAccountNumber
          ? _value.chartOfAccountNumber
          : chartOfAccountNumber // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
    ));
  }

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<$Res> get payment {
    return $PaymentCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value));
    });
  }

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccountNumber {
    return $ChartOfAccountNumberCopyWith<$Res>(_value.chartOfAccountNumber,
        (value) {
      return _then(_value.copyWith(chartOfAccountNumber: value));
    });
  }

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value));
    });
  }
}

/// @nodoc

class _$CreateFormPaymentImpl implements _CreateFormPayment {
  const _$CreateFormPaymentImpl(
      {required this.payment,
      required this.chartOfAccountNumber,
      required this.department});

  @override
  final Payment payment;
  @override
  final ChartOfAccountNumber chartOfAccountNumber;
  @override
  final Department department;

  @override
  String toString() {
    return 'PaymentEvent.createFormPayment(payment: $payment, chartOfAccountNumber: $chartOfAccountNumber, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFormPaymentImpl &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.chartOfAccountNumber, chartOfAccountNumber) ||
                other.chartOfAccountNumber == chartOfAccountNumber) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, payment, chartOfAccountNumber, department);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFormPaymentImplCopyWith<_$CreateFormPaymentImpl> get copyWith =>
      __$$CreateFormPaymentImplCopyWithImpl<_$CreateFormPaymentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Payment payment, Transaction? transaction)
        initialize,
    required TResult Function(List<Transaction> transactions, String customerId)
        createFormTransaction,
    required TResult Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)
        createFormPayment,
    required TResult Function(TransactionPayment? transactionPayment) submit,
    required TResult Function(
            PlatformFile file, String registerNo, DateTime date)
        uploadSalaries,
    required TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)
        edit,
  }) {
    return createFormPayment(payment, chartOfAccountNumber, department);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Payment payment, Transaction? transaction)? initialize,
    TResult? Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult? Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)?
        createFormPayment,
    TResult? Function(TransactionPayment? transactionPayment)? submit,
    TResult? Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult? Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
  }) {
    return createFormPayment?.call(payment, chartOfAccountNumber, department);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Payment payment, Transaction? transaction)? initialize,
    TResult Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult Function(Payment payment, ChartOfAccountNumber chartOfAccountNumber,
            Department department)?
        createFormPayment,
    TResult Function(TransactionPayment? transactionPayment)? submit,
    TResult Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
    required TResult orElse(),
  }) {
    if (createFormPayment != null) {
      return createFormPayment(payment, chartOfAccountNumber, department);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateFormTransaction value)
        createFormTransaction,
    required TResult Function(_CreateFormPayment value) createFormPayment,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UploadSalaries value) uploadSalaries,
    required TResult Function(_Edit value) edit,
  }) {
    return createFormPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateFormTransaction value)? createFormTransaction,
    TResult? Function(_CreateFormPayment value)? createFormPayment,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UploadSalaries value)? uploadSalaries,
    TResult? Function(_Edit value)? edit,
  }) {
    return createFormPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateFormTransaction value)? createFormTransaction,
    TResult Function(_CreateFormPayment value)? createFormPayment,
    TResult Function(_Submit value)? submit,
    TResult Function(_UploadSalaries value)? uploadSalaries,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (createFormPayment != null) {
      return createFormPayment(this);
    }
    return orElse();
  }
}

abstract class _CreateFormPayment implements PaymentEvent {
  const factory _CreateFormPayment(
      {required final Payment payment,
      required final ChartOfAccountNumber chartOfAccountNumber,
      required final Department department}) = _$CreateFormPaymentImpl;

  Payment get payment;
  ChartOfAccountNumber get chartOfAccountNumber;
  Department get department;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFormPaymentImplCopyWith<_$CreateFormPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionPayment? transactionPayment});

  $TransactionPaymentCopyWith<$Res>? get transactionPayment;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionPayment = freezed,
  }) {
    return _then(_$SubmitImpl(
      transactionPayment: freezed == transactionPayment
          ? _value.transactionPayment
          : transactionPayment // ignore: cast_nullable_to_non_nullable
              as TransactionPayment?,
    ));
  }

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionPaymentCopyWith<$Res>? get transactionPayment {
    if (_value.transactionPayment == null) {
      return null;
    }

    return $TransactionPaymentCopyWith<$Res>(_value.transactionPayment!,
        (value) {
      return _then(_value.copyWith(transactionPayment: value));
    });
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl({this.transactionPayment});

  @override
  final TransactionPayment? transactionPayment;

  @override
  String toString() {
    return 'PaymentEvent.submit(transactionPayment: $transactionPayment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.transactionPayment, transactionPayment) ||
                other.transactionPayment == transactionPayment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionPayment);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Payment payment, Transaction? transaction)
        initialize,
    required TResult Function(List<Transaction> transactions, String customerId)
        createFormTransaction,
    required TResult Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)
        createFormPayment,
    required TResult Function(TransactionPayment? transactionPayment) submit,
    required TResult Function(
            PlatformFile file, String registerNo, DateTime date)
        uploadSalaries,
    required TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)
        edit,
  }) {
    return submit(transactionPayment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Payment payment, Transaction? transaction)? initialize,
    TResult? Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult? Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)?
        createFormPayment,
    TResult? Function(TransactionPayment? transactionPayment)? submit,
    TResult? Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult? Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
  }) {
    return submit?.call(transactionPayment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Payment payment, Transaction? transaction)? initialize,
    TResult Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult Function(Payment payment, ChartOfAccountNumber chartOfAccountNumber,
            Department department)?
        createFormPayment,
    TResult Function(TransactionPayment? transactionPayment)? submit,
    TResult Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(transactionPayment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateFormTransaction value)
        createFormTransaction,
    required TResult Function(_CreateFormPayment value) createFormPayment,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UploadSalaries value) uploadSalaries,
    required TResult Function(_Edit value) edit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateFormTransaction value)? createFormTransaction,
    TResult? Function(_CreateFormPayment value)? createFormPayment,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UploadSalaries value)? uploadSalaries,
    TResult? Function(_Edit value)? edit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateFormTransaction value)? createFormTransaction,
    TResult Function(_CreateFormPayment value)? createFormPayment,
    TResult Function(_Submit value)? submit,
    TResult Function(_UploadSalaries value)? uploadSalaries,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements PaymentEvent {
  const factory _Submit({final TransactionPayment? transactionPayment}) =
      _$SubmitImpl;

  TransactionPayment? get transactionPayment;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadSalariesImplCopyWith<$Res> {
  factory _$$UploadSalariesImplCopyWith(_$UploadSalariesImpl value,
          $Res Function(_$UploadSalariesImpl) then) =
      __$$UploadSalariesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlatformFile file, String registerNo, DateTime date});
}

/// @nodoc
class __$$UploadSalariesImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$UploadSalariesImpl>
    implements _$$UploadSalariesImplCopyWith<$Res> {
  __$$UploadSalariesImplCopyWithImpl(
      _$UploadSalariesImpl _value, $Res Function(_$UploadSalariesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? registerNo = null,
    Object? date = null,
  }) {
    return _then(_$UploadSalariesImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
      registerNo: null == registerNo
          ? _value.registerNo
          : registerNo // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$UploadSalariesImpl implements _UploadSalaries {
  const _$UploadSalariesImpl(
      {required this.file, required this.registerNo, required this.date});

  @override
  final PlatformFile file;
  @override
  final String registerNo;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'PaymentEvent.uploadSalaries(file: $file, registerNo: $registerNo, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadSalariesImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.registerNo, registerNo) ||
                other.registerNo == registerNo) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, registerNo, date);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadSalariesImplCopyWith<_$UploadSalariesImpl> get copyWith =>
      __$$UploadSalariesImplCopyWithImpl<_$UploadSalariesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Payment payment, Transaction? transaction)
        initialize,
    required TResult Function(List<Transaction> transactions, String customerId)
        createFormTransaction,
    required TResult Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)
        createFormPayment,
    required TResult Function(TransactionPayment? transactionPayment) submit,
    required TResult Function(
            PlatformFile file, String registerNo, DateTime date)
        uploadSalaries,
    required TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)
        edit,
  }) {
    return uploadSalaries(file, registerNo, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Payment payment, Transaction? transaction)? initialize,
    TResult? Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult? Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)?
        createFormPayment,
    TResult? Function(TransactionPayment? transactionPayment)? submit,
    TResult? Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult? Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
  }) {
    return uploadSalaries?.call(file, registerNo, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Payment payment, Transaction? transaction)? initialize,
    TResult Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult Function(Payment payment, ChartOfAccountNumber chartOfAccountNumber,
            Department department)?
        createFormPayment,
    TResult Function(TransactionPayment? transactionPayment)? submit,
    TResult Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
    required TResult orElse(),
  }) {
    if (uploadSalaries != null) {
      return uploadSalaries(file, registerNo, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateFormTransaction value)
        createFormTransaction,
    required TResult Function(_CreateFormPayment value) createFormPayment,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UploadSalaries value) uploadSalaries,
    required TResult Function(_Edit value) edit,
  }) {
    return uploadSalaries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateFormTransaction value)? createFormTransaction,
    TResult? Function(_CreateFormPayment value)? createFormPayment,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UploadSalaries value)? uploadSalaries,
    TResult? Function(_Edit value)? edit,
  }) {
    return uploadSalaries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateFormTransaction value)? createFormTransaction,
    TResult Function(_CreateFormPayment value)? createFormPayment,
    TResult Function(_Submit value)? submit,
    TResult Function(_UploadSalaries value)? uploadSalaries,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (uploadSalaries != null) {
      return uploadSalaries(this);
    }
    return orElse();
  }
}

abstract class _UploadSalaries implements PaymentEvent {
  const factory _UploadSalaries(
      {required final PlatformFile file,
      required final String registerNo,
      required final DateTime date}) = _$UploadSalariesImpl;

  PlatformFile get file;
  String get registerNo;
  DateTime get date;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadSalariesImplCopyWith<_$UploadSalariesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Transaction> transactions,
      double rate,
      double kuCost,
      double stampCost,
      double roundingCost,
      double artCost,
      double otherCost,
      double rateGap,
      String chartOfAccountId,
      String departmentId,
      String description,
      String paymentNo});
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? rate = null,
    Object? kuCost = null,
    Object? stampCost = null,
    Object? roundingCost = null,
    Object? artCost = null,
    Object? otherCost = null,
    Object? rateGap = null,
    Object? chartOfAccountId = null,
    Object? departmentId = null,
    Object? description = null,
    Object? paymentNo = null,
  }) {
    return _then(_$EditImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      kuCost: null == kuCost
          ? _value.kuCost
          : kuCost // ignore: cast_nullable_to_non_nullable
              as double,
      stampCost: null == stampCost
          ? _value.stampCost
          : stampCost // ignore: cast_nullable_to_non_nullable
              as double,
      roundingCost: null == roundingCost
          ? _value.roundingCost
          : roundingCost // ignore: cast_nullable_to_non_nullable
              as double,
      artCost: null == artCost
          ? _value.artCost
          : artCost // ignore: cast_nullable_to_non_nullable
              as double,
      otherCost: null == otherCost
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as double,
      rateGap: null == rateGap
          ? _value.rateGap
          : rateGap // ignore: cast_nullable_to_non_nullable
              as double,
      chartOfAccountId: null == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: null == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(
      {required final List<Transaction> transactions,
      required this.rate,
      required this.kuCost,
      required this.stampCost,
      required this.roundingCost,
      required this.artCost,
      required this.otherCost,
      required this.rateGap,
      required this.chartOfAccountId,
      required this.departmentId,
      required this.description,
      required this.paymentNo})
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final double rate;
  @override
  final double kuCost;
  @override
  final double stampCost;
  @override
  final double roundingCost;
  @override
  final double artCost;
  @override
  final double otherCost;
  @override
  final double rateGap;
  @override
  final String chartOfAccountId;
  @override
  final String departmentId;
  @override
  final String description;
  @override
  final String paymentNo;

  @override
  String toString() {
    return 'PaymentEvent.edit(transactions: $transactions, rate: $rate, kuCost: $kuCost, stampCost: $stampCost, roundingCost: $roundingCost, artCost: $artCost, otherCost: $otherCost, rateGap: $rateGap, chartOfAccountId: $chartOfAccountId, departmentId: $departmentId, description: $description, paymentNo: $paymentNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.kuCost, kuCost) || other.kuCost == kuCost) &&
            (identical(other.stampCost, stampCost) ||
                other.stampCost == stampCost) &&
            (identical(other.roundingCost, roundingCost) ||
                other.roundingCost == roundingCost) &&
            (identical(other.artCost, artCost) || other.artCost == artCost) &&
            (identical(other.otherCost, otherCost) ||
                other.otherCost == otherCost) &&
            (identical(other.rateGap, rateGap) || other.rateGap == rateGap) &&
            (identical(other.chartOfAccountId, chartOfAccountId) ||
                other.chartOfAccountId == chartOfAccountId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paymentNo, paymentNo) ||
                other.paymentNo == paymentNo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactions),
      rate,
      kuCost,
      stampCost,
      roundingCost,
      artCost,
      otherCost,
      rateGap,
      chartOfAccountId,
      departmentId,
      description,
      paymentNo);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Payment payment, Transaction? transaction)
        initialize,
    required TResult Function(List<Transaction> transactions, String customerId)
        createFormTransaction,
    required TResult Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)
        createFormPayment,
    required TResult Function(TransactionPayment? transactionPayment) submit,
    required TResult Function(
            PlatformFile file, String registerNo, DateTime date)
        uploadSalaries,
    required TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)
        edit,
  }) {
    return edit(
        transactions,
        rate,
        kuCost,
        stampCost,
        roundingCost,
        artCost,
        otherCost,
        rateGap,
        chartOfAccountId,
        departmentId,
        description,
        paymentNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Payment payment, Transaction? transaction)? initialize,
    TResult? Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult? Function(Payment payment,
            ChartOfAccountNumber chartOfAccountNumber, Department department)?
        createFormPayment,
    TResult? Function(TransactionPayment? transactionPayment)? submit,
    TResult? Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult? Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
  }) {
    return edit?.call(
        transactions,
        rate,
        kuCost,
        stampCost,
        roundingCost,
        artCost,
        otherCost,
        rateGap,
        chartOfAccountId,
        departmentId,
        description,
        paymentNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Payment payment, Transaction? transaction)? initialize,
    TResult Function(List<Transaction> transactions, String customerId)?
        createFormTransaction,
    TResult Function(Payment payment, ChartOfAccountNumber chartOfAccountNumber,
            Department department)?
        createFormPayment,
    TResult Function(TransactionPayment? transactionPayment)? submit,
    TResult Function(PlatformFile file, String registerNo, DateTime date)?
        uploadSalaries,
    TResult Function(
            List<Transaction> transactions,
            double rate,
            double kuCost,
            double stampCost,
            double roundingCost,
            double artCost,
            double otherCost,
            double rateGap,
            String chartOfAccountId,
            String departmentId,
            String description,
            String paymentNo)?
        edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(
          transactions,
          rate,
          kuCost,
          stampCost,
          roundingCost,
          artCost,
          otherCost,
          rateGap,
          chartOfAccountId,
          departmentId,
          description,
          paymentNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateFormTransaction value)
        createFormTransaction,
    required TResult Function(_CreateFormPayment value) createFormPayment,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UploadSalaries value) uploadSalaries,
    required TResult Function(_Edit value) edit,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateFormTransaction value)? createFormTransaction,
    TResult? Function(_CreateFormPayment value)? createFormPayment,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UploadSalaries value)? uploadSalaries,
    TResult? Function(_Edit value)? edit,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateFormTransaction value)? createFormTransaction,
    TResult Function(_CreateFormPayment value)? createFormPayment,
    TResult Function(_Submit value)? submit,
    TResult Function(_UploadSalaries value)? uploadSalaries,
    TResult Function(_Edit value)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements PaymentEvent {
  const factory _Edit(
      {required final List<Transaction> transactions,
      required final double rate,
      required final double kuCost,
      required final double stampCost,
      required final double roundingCost,
      required final double artCost,
      required final double otherCost,
      required final double rateGap,
      required final String chartOfAccountId,
      required final String departmentId,
      required final String description,
      required final String paymentNo}) = _$EditImpl;

  List<Transaction> get transactions;
  double get rate;
  double get kuCost;
  double get stampCost;
  double get roundingCost;
  double get artCost;
  double get otherCost;
  double get rateGap;
  String get chartOfAccountId;
  String get departmentId;
  String get description;
  String get paymentNo;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
