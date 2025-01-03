// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_receive_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvoiceReceiveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
abstract class $InvoiceReceiveStateCopyWith<$Res> {
  factory $InvoiceReceiveStateCopyWith(
          InvoiceReceiveState value, $Res Function(InvoiceReceiveState) then) =
      _$InvoiceReceiveStateCopyWithImpl<$Res, InvoiceReceiveState>;
}

/// @nodoc
class _$InvoiceReceiveStateCopyWithImpl<$Res, $Val extends InvoiceReceiveState>
    implements $InvoiceReceiveStateCopyWith<$Res> {
  _$InvoiceReceiveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceReceiveState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'InvoiceReceiveState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
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

abstract class _Initial implements InvoiceReceiveState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'InvoiceReceiveState.loading()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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

abstract class _Loading implements InvoiceReceiveState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'InvoiceReceiveState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
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

abstract class _Success implements InvoiceReceiveState {
  const factory _Success() = _$SuccessImpl;
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
    extends _$InvoiceReceiveStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveState
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
    return 'InvoiceReceiveState.error(error: $error)';
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

  /// Create a copy of InvoiceReceiveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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

abstract class _Error implements InvoiceReceiveState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of InvoiceReceiveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InvoiceReceiveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceReceiveEventCopyWith<$Res> {
  factory $InvoiceReceiveEventCopyWith(
          InvoiceReceiveEvent value, $Res Function(InvoiceReceiveEvent) then) =
      _$InvoiceReceiveEventCopyWithImpl<$Res, InvoiceReceiveEvent>;
}

/// @nodoc
class _$InvoiceReceiveEventCopyWithImpl<$Res, $Val extends InvoiceReceiveEvent>
    implements $InvoiceReceiveEventCopyWith<$Res> {
  _$InvoiceReceiveEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String invoiceNo,
      PurchaseOrder purchaseOrder,
      Supplier supplier,
      double rate,
      DateTime invoiceDate,
      String deliveryOrderId,
      DateTime deliveryOrderDate,
      String taxInvoiceNo,
      DateTime taxInvoiceDate,
      double subtotal,
      Ppn ppn,
      TaxType taxType,
      double total,
      int termOfPayment,
      DateTime dueDate});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  $SupplierCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNo = null,
    Object? purchaseOrder = null,
    Object? supplier = null,
    Object? rate = null,
    Object? invoiceDate = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? taxInvoiceNo = null,
    Object? taxInvoiceDate = null,
    Object? subtotal = null,
    Object? ppn = null,
    Object? taxType = null,
    Object? total = null,
    Object? termOfPayment = null,
    Object? dueDate = null,
  }) {
    return _then(_$CreateImpl(
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceDate: null == taxInvoiceDate
          ? _value.taxInvoiceDate
          : taxInvoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as Ppn,
      taxType: null == taxType
          ? _value.taxType
          : taxType // ignore: cast_nullable_to_non_nullable
              as TaxType,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value));
    });
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value));
    });
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      {required this.invoiceNo,
      required this.purchaseOrder,
      required this.supplier,
      required this.rate,
      required this.invoiceDate,
      required this.deliveryOrderId,
      required this.deliveryOrderDate,
      required this.taxInvoiceNo,
      required this.taxInvoiceDate,
      required this.subtotal,
      required this.ppn,
      required this.taxType,
      required this.total,
      required this.termOfPayment,
      required this.dueDate});

  @override
  final String invoiceNo;
  @override
  final PurchaseOrder purchaseOrder;
  @override
  final Supplier supplier;
  @override
  final double rate;
  @override
  final DateTime invoiceDate;
  @override
  final String deliveryOrderId;
  @override
  final DateTime deliveryOrderDate;
  @override
  final String taxInvoiceNo;
  @override
  final DateTime taxInvoiceDate;
  @override
  final double subtotal;
  @override
  final Ppn ppn;
  @override
  final TaxType taxType;
  @override
  final double total;
  @override
  final int termOfPayment;
  @override
  final DateTime dueDate;

  @override
  String toString() {
    return 'InvoiceReceiveEvent.create(invoiceNo: $invoiceNo, purchaseOrder: $purchaseOrder, supplier: $supplier, rate: $rate, invoiceDate: $invoiceDate, deliveryOrderId: $deliveryOrderId, deliveryOrderDate: $deliveryOrderDate, taxInvoiceNo: $taxInvoiceNo, taxInvoiceDate: $taxInvoiceDate, subtotal: $subtotal, ppn: $ppn, taxType: $taxType, total: $total, termOfPayment: $termOfPayment, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.taxInvoiceDate, taxInvoiceDate) ||
                other.taxInvoiceDate == taxInvoiceDate) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.taxType, taxType) || other.taxType == taxType) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceNo,
      purchaseOrder,
      supplier,
      rate,
      invoiceDate,
      deliveryOrderId,
      deliveryOrderDate,
      taxInvoiceNo,
      taxInvoiceDate,
      subtotal,
      ppn,
      taxType,
      total,
      termOfPayment,
      dueDate);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) {
    return create(
        invoiceNo,
        purchaseOrder,
        supplier,
        rate,
        invoiceDate,
        deliveryOrderId,
        deliveryOrderDate,
        taxInvoiceNo,
        taxInvoiceDate,
        subtotal,
        ppn,
        taxType,
        total,
        termOfPayment,
        dueDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) {
    return create?.call(
        invoiceNo,
        purchaseOrder,
        supplier,
        rate,
        invoiceDate,
        deliveryOrderId,
        deliveryOrderDate,
        taxInvoiceNo,
        taxInvoiceDate,
        subtotal,
        ppn,
        taxType,
        total,
        termOfPayment,
        dueDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(
          invoiceNo,
          purchaseOrder,
          supplier,
          rate,
          invoiceDate,
          deliveryOrderId,
          deliveryOrderDate,
          taxInvoiceNo,
          taxInvoiceDate,
          subtotal,
          ppn,
          taxType,
          total,
          termOfPayment,
          dueDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements InvoiceReceiveEvent {
  const factory _Create(
      {required final String invoiceNo,
      required final PurchaseOrder purchaseOrder,
      required final Supplier supplier,
      required final double rate,
      required final DateTime invoiceDate,
      required final String deliveryOrderId,
      required final DateTime deliveryOrderDate,
      required final String taxInvoiceNo,
      required final DateTime taxInvoiceDate,
      required final double subtotal,
      required final Ppn ppn,
      required final TaxType taxType,
      required final double total,
      required final int termOfPayment,
      required final DateTime dueDate}) = _$CreateImpl;

  String get invoiceNo;
  PurchaseOrder get purchaseOrder;
  Supplier get supplier;
  double get rate;
  DateTime get invoiceDate;
  String get deliveryOrderId;
  DateTime get deliveryOrderDate;
  String get taxInvoiceNo;
  DateTime get taxInvoiceDate;
  double get subtotal;
  Ppn get ppn;
  TaxType get taxType;
  double get total;
  int get termOfPayment;
  DateTime get dueDate;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateWithDetailImplCopyWith<$Res> {
  factory _$$CreateWithDetailImplCopyWith(_$CreateWithDetailImpl value,
          $Res Function(_$CreateWithDetailImpl) then) =
      __$$CreateWithDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String invoiceNo,
      PurchaseOrder purchaseOrder,
      Supplier supplier,
      double rate,
      DateTime invoiceDate,
      String deliveryOrderId,
      DateTime deliveryOrderDate,
      String taxInvoiceNo,
      DateTime taxInvoiceDate,
      double subtotal,
      Ppn ppn,
      TaxType taxType,
      double total,
      int termOfPayment,
      DateTime dueDate,
      List<InvoiceReceiveDetailRequest> invoiceReceiveDetails});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  $SupplierCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$CreateWithDetailImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveEventCopyWithImpl<$Res, _$CreateWithDetailImpl>
    implements _$$CreateWithDetailImplCopyWith<$Res> {
  __$$CreateWithDetailImplCopyWithImpl(_$CreateWithDetailImpl _value,
      $Res Function(_$CreateWithDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNo = null,
    Object? purchaseOrder = null,
    Object? supplier = null,
    Object? rate = null,
    Object? invoiceDate = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? taxInvoiceNo = null,
    Object? taxInvoiceDate = null,
    Object? subtotal = null,
    Object? ppn = null,
    Object? taxType = null,
    Object? total = null,
    Object? termOfPayment = null,
    Object? dueDate = null,
    Object? invoiceReceiveDetails = null,
  }) {
    return _then(_$CreateWithDetailImpl(
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceDate: null == taxInvoiceDate
          ? _value.taxInvoiceDate
          : taxInvoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as Ppn,
      taxType: null == taxType
          ? _value.taxType
          : taxType // ignore: cast_nullable_to_non_nullable
              as TaxType,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceReceiveDetails: null == invoiceReceiveDetails
          ? _value._invoiceReceiveDetails
          : invoiceReceiveDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceReceiveDetailRequest>,
    ));
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value));
    });
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value));
    });
  }
}

/// @nodoc

class _$CreateWithDetailImpl implements _CreateWithDetail {
  const _$CreateWithDetailImpl(
      {required this.invoiceNo,
      required this.purchaseOrder,
      required this.supplier,
      required this.rate,
      required this.invoiceDate,
      required this.deliveryOrderId,
      required this.deliveryOrderDate,
      required this.taxInvoiceNo,
      required this.taxInvoiceDate,
      required this.subtotal,
      required this.ppn,
      required this.taxType,
      required this.total,
      required this.termOfPayment,
      required this.dueDate,
      required final List<InvoiceReceiveDetailRequest> invoiceReceiveDetails})
      : _invoiceReceiveDetails = invoiceReceiveDetails;

  @override
  final String invoiceNo;
  @override
  final PurchaseOrder purchaseOrder;
  @override
  final Supplier supplier;
  @override
  final double rate;
  @override
  final DateTime invoiceDate;
  @override
  final String deliveryOrderId;
  @override
  final DateTime deliveryOrderDate;
  @override
  final String taxInvoiceNo;
  @override
  final DateTime taxInvoiceDate;
  @override
  final double subtotal;
  @override
  final Ppn ppn;
  @override
  final TaxType taxType;
  @override
  final double total;
  @override
  final int termOfPayment;
  @override
  final DateTime dueDate;
  final List<InvoiceReceiveDetailRequest> _invoiceReceiveDetails;
  @override
  List<InvoiceReceiveDetailRequest> get invoiceReceiveDetails {
    if (_invoiceReceiveDetails is EqualUnmodifiableListView)
      return _invoiceReceiveDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceReceiveDetails);
  }

  @override
  String toString() {
    return 'InvoiceReceiveEvent.createWithDetail(invoiceNo: $invoiceNo, purchaseOrder: $purchaseOrder, supplier: $supplier, rate: $rate, invoiceDate: $invoiceDate, deliveryOrderId: $deliveryOrderId, deliveryOrderDate: $deliveryOrderDate, taxInvoiceNo: $taxInvoiceNo, taxInvoiceDate: $taxInvoiceDate, subtotal: $subtotal, ppn: $ppn, taxType: $taxType, total: $total, termOfPayment: $termOfPayment, dueDate: $dueDate, invoiceReceiveDetails: $invoiceReceiveDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWithDetailImpl &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.taxInvoiceDate, taxInvoiceDate) ||
                other.taxInvoiceDate == taxInvoiceDate) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.taxType, taxType) || other.taxType == taxType) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality()
                .equals(other._invoiceReceiveDetails, _invoiceReceiveDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceNo,
      purchaseOrder,
      supplier,
      rate,
      invoiceDate,
      deliveryOrderId,
      deliveryOrderDate,
      taxInvoiceNo,
      taxInvoiceDate,
      subtotal,
      ppn,
      taxType,
      total,
      termOfPayment,
      dueDate,
      const DeepCollectionEquality().hash(_invoiceReceiveDetails));

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWithDetailImplCopyWith<_$CreateWithDetailImpl> get copyWith =>
      __$$CreateWithDetailImplCopyWithImpl<_$CreateWithDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) {
    return createWithDetail(
        invoiceNo,
        purchaseOrder,
        supplier,
        rate,
        invoiceDate,
        deliveryOrderId,
        deliveryOrderDate,
        taxInvoiceNo,
        taxInvoiceDate,
        subtotal,
        ppn,
        taxType,
        total,
        termOfPayment,
        dueDate,
        invoiceReceiveDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) {
    return createWithDetail?.call(
        invoiceNo,
        purchaseOrder,
        supplier,
        rate,
        invoiceDate,
        deliveryOrderId,
        deliveryOrderDate,
        taxInvoiceNo,
        taxInvoiceDate,
        subtotal,
        ppn,
        taxType,
        total,
        termOfPayment,
        dueDate,
        invoiceReceiveDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (createWithDetail != null) {
      return createWithDetail(
          invoiceNo,
          purchaseOrder,
          supplier,
          rate,
          invoiceDate,
          deliveryOrderId,
          deliveryOrderDate,
          taxInvoiceNo,
          taxInvoiceDate,
          subtotal,
          ppn,
          taxType,
          total,
          termOfPayment,
          dueDate,
          invoiceReceiveDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return createWithDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return createWithDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (createWithDetail != null) {
      return createWithDetail(this);
    }
    return orElse();
  }
}

abstract class _CreateWithDetail implements InvoiceReceiveEvent {
  const factory _CreateWithDetail(
      {required final String invoiceNo,
      required final PurchaseOrder purchaseOrder,
      required final Supplier supplier,
      required final double rate,
      required final DateTime invoiceDate,
      required final String deliveryOrderId,
      required final DateTime deliveryOrderDate,
      required final String taxInvoiceNo,
      required final DateTime taxInvoiceDate,
      required final double subtotal,
      required final Ppn ppn,
      required final TaxType taxType,
      required final double total,
      required final int termOfPayment,
      required final DateTime dueDate,
      required final List<InvoiceReceiveDetailRequest>
          invoiceReceiveDetails}) = _$CreateWithDetailImpl;

  String get invoiceNo;
  PurchaseOrder get purchaseOrder;
  Supplier get supplier;
  double get rate;
  DateTime get invoiceDate;
  String get deliveryOrderId;
  DateTime get deliveryOrderDate;
  String get taxInvoiceNo;
  DateTime get taxInvoiceDate;
  double get subtotal;
  Ppn get ppn;
  TaxType get taxType;
  double get total;
  int get termOfPayment;
  DateTime get dueDate;
  List<InvoiceReceiveDetailRequest> get invoiceReceiveDetails;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateWithDetailImplCopyWith<_$CreateWithDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {InvoiceReceive invoiceReceive,
      double subtotal,
      Ppn ppn,
      TaxType taxType,
      double total,
      int termOfPayment,
      DateTime dueDate});

  $InvoiceReceiveCopyWith<$Res> get invoiceReceive;
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceReceive = null,
    Object? subtotal = null,
    Object? ppn = null,
    Object? taxType = null,
    Object? total = null,
    Object? termOfPayment = null,
    Object? dueDate = null,
  }) {
    return _then(_$EditImpl(
      invoiceReceive: null == invoiceReceive
          ? _value.invoiceReceive
          : invoiceReceive // ignore: cast_nullable_to_non_nullable
              as InvoiceReceive,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as Ppn,
      taxType: null == taxType
          ? _value.taxType
          : taxType // ignore: cast_nullable_to_non_nullable
              as TaxType,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceReceiveCopyWith<$Res> get invoiceReceive {
    return $InvoiceReceiveCopyWith<$Res>(_value.invoiceReceive, (value) {
      return _then(_value.copyWith(invoiceReceive: value));
    });
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(
      {required this.invoiceReceive,
      required this.subtotal,
      required this.ppn,
      required this.taxType,
      required this.total,
      required this.termOfPayment,
      required this.dueDate});

  @override
  final InvoiceReceive invoiceReceive;
  @override
  final double subtotal;
  @override
  final Ppn ppn;
  @override
  final TaxType taxType;
  @override
  final double total;
  @override
  final int termOfPayment;
  @override
  final DateTime dueDate;

  @override
  String toString() {
    return 'InvoiceReceiveEvent.edit(invoiceReceive: $invoiceReceive, subtotal: $subtotal, ppn: $ppn, taxType: $taxType, total: $total, termOfPayment: $termOfPayment, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.invoiceReceive, invoiceReceive) ||
                other.invoiceReceive == invoiceReceive) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.taxType, taxType) || other.taxType == taxType) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceReceive, subtotal, ppn,
      taxType, total, termOfPayment, dueDate);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) {
    return edit(
        invoiceReceive, subtotal, ppn, taxType, total, termOfPayment, dueDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) {
    return edit?.call(
        invoiceReceive, subtotal, ppn, taxType, total, termOfPayment, dueDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(invoiceReceive, subtotal, ppn, taxType, total, termOfPayment,
          dueDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements InvoiceReceiveEvent {
  const factory _Edit(
      {required final InvoiceReceive invoiceReceive,
      required final double subtotal,
      required final Ppn ppn,
      required final TaxType taxType,
      required final double total,
      required final int termOfPayment,
      required final DateTime dueDate}) = _$EditImpl;

  InvoiceReceive get invoiceReceive;
  double get subtotal;
  Ppn get ppn;
  TaxType get taxType;
  double get total;
  int get termOfPayment;
  DateTime get dueDate;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InvoiceReceive invoiceReceive});

  $InvoiceReceiveCopyWith<$Res> get invoiceReceive;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceReceive = null,
  }) {
    return _then(_$DeleteImpl(
      invoiceReceive: null == invoiceReceive
          ? _value.invoiceReceive
          : invoiceReceive // ignore: cast_nullable_to_non_nullable
              as InvoiceReceive,
    ));
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceReceiveCopyWith<$Res> get invoiceReceive {
    return $InvoiceReceiveCopyWith<$Res>(_value.invoiceReceive, (value) {
      return _then(_value.copyWith(invoiceReceive: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({required this.invoiceReceive});

  @override
  final InvoiceReceive invoiceReceive;

  @override
  String toString() {
    return 'InvoiceReceiveEvent.delete(invoiceReceive: $invoiceReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.invoiceReceive, invoiceReceive) ||
                other.invoiceReceive == invoiceReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceReceive);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) {
    return delete(invoiceReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) {
    return delete?.call(invoiceReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(invoiceReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements InvoiceReceiveEvent {
  const factory _Delete({required final InvoiceReceive invoiceReceive}) =
      _$DeleteImpl;

  InvoiceReceive get invoiceReceive;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmFinanceImplCopyWith<$Res> {
  factory _$$ConfirmFinanceImplCopyWith(_$ConfirmFinanceImpl value,
          $Res Function(_$ConfirmFinanceImpl) then) =
      __$$ConfirmFinanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InvoiceReceive invoiceReceive});

  $InvoiceReceiveCopyWith<$Res> get invoiceReceive;
}

/// @nodoc
class __$$ConfirmFinanceImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveEventCopyWithImpl<$Res, _$ConfirmFinanceImpl>
    implements _$$ConfirmFinanceImplCopyWith<$Res> {
  __$$ConfirmFinanceImplCopyWithImpl(
      _$ConfirmFinanceImpl _value, $Res Function(_$ConfirmFinanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceReceive = null,
  }) {
    return _then(_$ConfirmFinanceImpl(
      invoiceReceive: null == invoiceReceive
          ? _value.invoiceReceive
          : invoiceReceive // ignore: cast_nullable_to_non_nullable
              as InvoiceReceive,
    ));
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceReceiveCopyWith<$Res> get invoiceReceive {
    return $InvoiceReceiveCopyWith<$Res>(_value.invoiceReceive, (value) {
      return _then(_value.copyWith(invoiceReceive: value));
    });
  }
}

/// @nodoc

class _$ConfirmFinanceImpl implements _ConfirmFinance {
  const _$ConfirmFinanceImpl({required this.invoiceReceive});

  @override
  final InvoiceReceive invoiceReceive;

  @override
  String toString() {
    return 'InvoiceReceiveEvent.confirmFinance(invoiceReceive: $invoiceReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmFinanceImpl &&
            (identical(other.invoiceReceive, invoiceReceive) ||
                other.invoiceReceive == invoiceReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceReceive);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmFinanceImplCopyWith<_$ConfirmFinanceImpl> get copyWith =>
      __$$ConfirmFinanceImplCopyWithImpl<_$ConfirmFinanceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) {
    return confirmFinance(invoiceReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) {
    return confirmFinance?.call(invoiceReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (confirmFinance != null) {
      return confirmFinance(invoiceReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return confirmFinance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return confirmFinance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (confirmFinance != null) {
      return confirmFinance(this);
    }
    return orElse();
  }
}

abstract class _ConfirmFinance implements InvoiceReceiveEvent {
  const factory _ConfirmFinance(
      {required final InvoiceReceive invoiceReceive}) = _$ConfirmFinanceImpl;

  InvoiceReceive get invoiceReceive;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmFinanceImplCopyWith<_$ConfirmFinanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveHeadAccountingImplCopyWith<$Res> {
  factory _$$ApproveHeadAccountingImplCopyWith(
          _$ApproveHeadAccountingImpl value,
          $Res Function(_$ApproveHeadAccountingImpl) then) =
      __$$ApproveHeadAccountingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InvoiceReceive invoiceReceive});

  $InvoiceReceiveCopyWith<$Res> get invoiceReceive;
}

/// @nodoc
class __$$ApproveHeadAccountingImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveEventCopyWithImpl<$Res, _$ApproveHeadAccountingImpl>
    implements _$$ApproveHeadAccountingImplCopyWith<$Res> {
  __$$ApproveHeadAccountingImplCopyWithImpl(_$ApproveHeadAccountingImpl _value,
      $Res Function(_$ApproveHeadAccountingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceReceive = null,
  }) {
    return _then(_$ApproveHeadAccountingImpl(
      invoiceReceive: null == invoiceReceive
          ? _value.invoiceReceive
          : invoiceReceive // ignore: cast_nullable_to_non_nullable
              as InvoiceReceive,
    ));
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceReceiveCopyWith<$Res> get invoiceReceive {
    return $InvoiceReceiveCopyWith<$Res>(_value.invoiceReceive, (value) {
      return _then(_value.copyWith(invoiceReceive: value));
    });
  }
}

/// @nodoc

class _$ApproveHeadAccountingImpl implements _ApproveHeadAccounting {
  const _$ApproveHeadAccountingImpl({required this.invoiceReceive});

  @override
  final InvoiceReceive invoiceReceive;

  @override
  String toString() {
    return 'InvoiceReceiveEvent.approveHeadAccounting(invoiceReceive: $invoiceReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveHeadAccountingImpl &&
            (identical(other.invoiceReceive, invoiceReceive) ||
                other.invoiceReceive == invoiceReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceReceive);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveHeadAccountingImplCopyWith<_$ApproveHeadAccountingImpl>
      get copyWith => __$$ApproveHeadAccountingImplCopyWithImpl<
          _$ApproveHeadAccountingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) {
    return approveHeadAccounting(invoiceReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) {
    return approveHeadAccounting?.call(invoiceReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (approveHeadAccounting != null) {
      return approveHeadAccounting(invoiceReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return approveHeadAccounting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return approveHeadAccounting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (approveHeadAccounting != null) {
      return approveHeadAccounting(this);
    }
    return orElse();
  }
}

abstract class _ApproveHeadAccounting implements InvoiceReceiveEvent {
  const factory _ApproveHeadAccounting(
          {required final InvoiceReceive invoiceReceive}) =
      _$ApproveHeadAccountingImpl;

  InvoiceReceive get invoiceReceive;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveHeadAccountingImplCopyWith<_$ApproveHeadAccountingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadDocumentImplCopyWith<$Res> {
  factory _$$UploadDocumentImplCopyWith(_$UploadDocumentImpl value,
          $Res Function(_$UploadDocumentImpl) then) =
      __$$UploadDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PlatformFile file,
      InvoiceReceive invoiceReceive,
      String name,
      String description});

  $InvoiceReceiveCopyWith<$Res> get invoiceReceive;
}

/// @nodoc
class __$$UploadDocumentImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveEventCopyWithImpl<$Res, _$UploadDocumentImpl>
    implements _$$UploadDocumentImplCopyWith<$Res> {
  __$$UploadDocumentImplCopyWithImpl(
      _$UploadDocumentImpl _value, $Res Function(_$UploadDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? invoiceReceive = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$UploadDocumentImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
      invoiceReceive: null == invoiceReceive
          ? _value.invoiceReceive
          : invoiceReceive // ignore: cast_nullable_to_non_nullable
              as InvoiceReceive,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceReceiveCopyWith<$Res> get invoiceReceive {
    return $InvoiceReceiveCopyWith<$Res>(_value.invoiceReceive, (value) {
      return _then(_value.copyWith(invoiceReceive: value));
    });
  }
}

/// @nodoc

class _$UploadDocumentImpl implements _UploadDocument {
  const _$UploadDocumentImpl(
      {required this.file,
      required this.invoiceReceive,
      required this.name,
      required this.description});

  @override
  final PlatformFile file;
  @override
  final InvoiceReceive invoiceReceive;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'InvoiceReceiveEvent.uploadDocument(file: $file, invoiceReceive: $invoiceReceive, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadDocumentImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.invoiceReceive, invoiceReceive) ||
                other.invoiceReceive == invoiceReceive) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, file, invoiceReceive, name, description);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadDocumentImplCopyWith<_$UploadDocumentImpl> get copyWith =>
      __$$UploadDocumentImplCopyWithImpl<_$UploadDocumentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) {
    return uploadDocument(file, invoiceReceive, name, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) {
    return uploadDocument?.call(file, invoiceReceive, name, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (uploadDocument != null) {
      return uploadDocument(file, invoiceReceive, name, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return uploadDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return uploadDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (uploadDocument != null) {
      return uploadDocument(this);
    }
    return orElse();
  }
}

abstract class _UploadDocument implements InvoiceReceiveEvent {
  const factory _UploadDocument(
      {required final PlatformFile file,
      required final InvoiceReceive invoiceReceive,
      required final String name,
      required final String description}) = _$UploadDocumentImpl;

  PlatformFile get file;
  InvoiceReceive get invoiceReceive;
  String get name;
  String get description;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadDocumentImplCopyWith<_$UploadDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentDeleteImplCopyWith<$Res> {
  factory _$$DocumentDeleteImplCopyWith(_$DocumentDeleteImpl value,
          $Res Function(_$DocumentDeleteImpl) then) =
      __$$DocumentDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InvoiceReceiveDocument document});

  $InvoiceReceiveDocumentCopyWith<$Res> get document;
}

/// @nodoc
class __$$DocumentDeleteImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveEventCopyWithImpl<$Res, _$DocumentDeleteImpl>
    implements _$$DocumentDeleteImplCopyWith<$Res> {
  __$$DocumentDeleteImplCopyWithImpl(
      _$DocumentDeleteImpl _value, $Res Function(_$DocumentDeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
  }) {
    return _then(_$DocumentDeleteImpl(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as InvoiceReceiveDocument,
    ));
  }

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceReceiveDocumentCopyWith<$Res> get document {
    return $InvoiceReceiveDocumentCopyWith<$Res>(_value.document, (value) {
      return _then(_value.copyWith(document: value));
    });
  }
}

/// @nodoc

class _$DocumentDeleteImpl implements _DocumentDelete {
  const _$DocumentDeleteImpl({required this.document});

  @override
  final InvoiceReceiveDocument document;

  @override
  String toString() {
    return 'InvoiceReceiveEvent.documentDelete(document: $document)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentDeleteImpl &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @override
  int get hashCode => Object.hash(runtimeType, document);

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDeleteImplCopyWith<_$DocumentDeleteImpl> get copyWith =>
      __$$DocumentDeleteImplCopyWithImpl<_$DocumentDeleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        create,
    required TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)
        createWithDetail,
    required TResult Function(
            InvoiceReceive invoiceReceive,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)
        edit,
    required TResult Function(InvoiceReceive invoiceReceive) delete,
    required TResult Function(InvoiceReceive invoiceReceive) confirmFinance,
    required TResult Function(InvoiceReceive invoiceReceive)
        approveHeadAccounting,
    required TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)
        uploadDocument,
    required TResult Function(InvoiceReceiveDocument document) documentDelete,
  }) {
    return documentDelete(document);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult? Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult? Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult? Function(InvoiceReceive invoiceReceive)? delete,
    TResult? Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult? Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult? Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult? Function(InvoiceReceiveDocument document)? documentDelete,
  }) {
    return documentDelete?.call(document);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate)?
        create,
    TResult Function(
            String invoiceNo,
            PurchaseOrder purchaseOrder,
            Supplier supplier,
            double rate,
            DateTime invoiceDate,
            String deliveryOrderId,
            DateTime deliveryOrderDate,
            String taxInvoiceNo,
            DateTime taxInvoiceDate,
            double subtotal,
            Ppn ppn,
            TaxType taxType,
            double total,
            int termOfPayment,
            DateTime dueDate,
            List<InvoiceReceiveDetailRequest> invoiceReceiveDetails)?
        createWithDetail,
    TResult Function(InvoiceReceive invoiceReceive, double subtotal, Ppn ppn,
            TaxType taxType, double total, int termOfPayment, DateTime dueDate)?
        edit,
    TResult Function(InvoiceReceive invoiceReceive)? delete,
    TResult Function(InvoiceReceive invoiceReceive)? confirmFinance,
    TResult Function(InvoiceReceive invoiceReceive)? approveHeadAccounting,
    TResult Function(PlatformFile file, InvoiceReceive invoiceReceive,
            String name, String description)?
        uploadDocument,
    TResult Function(InvoiceReceiveDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (documentDelete != null) {
      return documentDelete(document);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateWithDetail value) createWithDetail,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_ConfirmFinance value) confirmFinance,
    required TResult Function(_ApproveHeadAccounting value)
        approveHeadAccounting,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return documentDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateWithDetail value)? createWithDetail,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_ConfirmFinance value)? confirmFinance,
    TResult? Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return documentDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateWithDetail value)? createWithDetail,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_ConfirmFinance value)? confirmFinance,
    TResult Function(_ApproveHeadAccounting value)? approveHeadAccounting,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (documentDelete != null) {
      return documentDelete(this);
    }
    return orElse();
  }
}

abstract class _DocumentDelete implements InvoiceReceiveEvent {
  const factory _DocumentDelete(
      {required final InvoiceReceiveDocument document}) = _$DocumentDeleteImpl;

  InvoiceReceiveDocument get document;

  /// Create a copy of InvoiceReceiveEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentDeleteImplCopyWith<_$DocumentDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
