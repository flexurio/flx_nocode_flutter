// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_return_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReturnNote _$MaterialReturnNoteFromJson(Map<String, dynamic> json) {
  return _MaterialReturnNote.fromJson(json);
}

/// @nodoc
mixin _$MaterialReturnNote {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
  DateTime get returnDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_no')
  String get taxInvoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
  DateTime get taxInvoiceDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_received_document')
  bool get isReceivedDocument => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReturnNoteCopyWith<MaterialReturnNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReturnNoteCopyWith<$Res> {
  factory $MaterialReturnNoteCopyWith(
          MaterialReturnNote value, $Res Function(MaterialReturnNote) then) =
      _$MaterialReturnNoteCopyWithImpl<$Res, MaterialReturnNote>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String id,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
      DateTime returnDate,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'tax_invoice_no') String taxInvoiceNo,
      @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
      DateTime taxInvoiceDate,
      String description,
      @JsonKey(name: 'is_received_document') bool isReceivedDocument});

  $SupplierCopyWith<$Res> get supplier;
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class _$MaterialReturnNoteCopyWithImpl<$Res, $Val extends MaterialReturnNote>
    implements $MaterialReturnNoteCopyWith<$Res> {
  _$MaterialReturnNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? supplier = null,
    Object? purchaseOrder = null,
    Object? returnDate = null,
    Object? invoiceNo = null,
    Object? invoiceDate = null,
    Object? taxInvoiceNo = null,
    Object? taxInvoiceDate = null,
    Object? description = null,
    Object? isReceivedDocument = null,
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
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      returnDate: null == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceDate: null == taxInvoiceDate
          ? _value.taxInvoiceDate
          : taxInvoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isReceivedDocument: null == isReceivedDocument
          ? _value.isReceivedDocument
          : isReceivedDocument // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialReturnNoteImplCopyWith<$Res>
    implements $MaterialReturnNoteCopyWith<$Res> {
  factory _$$MaterialReturnNoteImplCopyWith(_$MaterialReturnNoteImpl value,
          $Res Function(_$MaterialReturnNoteImpl) then) =
      __$$MaterialReturnNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String id,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
      DateTime returnDate,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'tax_invoice_no') String taxInvoiceNo,
      @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
      DateTime taxInvoiceDate,
      String description,
      @JsonKey(name: 'is_received_document') bool isReceivedDocument});

  @override
  $SupplierCopyWith<$Res> get supplier;
  @override
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$MaterialReturnNoteImplCopyWithImpl<$Res>
    extends _$MaterialReturnNoteCopyWithImpl<$Res, _$MaterialReturnNoteImpl>
    implements _$$MaterialReturnNoteImplCopyWith<$Res> {
  __$$MaterialReturnNoteImplCopyWithImpl(_$MaterialReturnNoteImpl _value,
      $Res Function(_$MaterialReturnNoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? supplier = null,
    Object? purchaseOrder = null,
    Object? returnDate = null,
    Object? invoiceNo = null,
    Object? invoiceDate = null,
    Object? taxInvoiceNo = null,
    Object? taxInvoiceDate = null,
    Object? description = null,
    Object? isReceivedDocument = null,
  }) {
    return _then(_$MaterialReturnNoteImpl(
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
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      returnDate: null == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceDate: null == taxInvoiceDate
          ? _value.taxInvoiceDate
          : taxInvoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isReceivedDocument: null == isReceivedDocument
          ? _value.isReceivedDocument
          : isReceivedDocument // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReturnNoteImpl extends _MaterialReturnNote {
  _$MaterialReturnNoteImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      required this.id,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      required this.supplier,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required this.purchaseOrder,
      @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
      required this.returnDate,
      @JsonKey(name: 'invoice_no') required this.invoiceNo,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required this.invoiceDate,
      @JsonKey(name: 'tax_invoice_no') required this.taxInvoiceNo,
      @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
      required this.taxInvoiceDate,
      required this.description,
      @JsonKey(name: 'is_received_document') required this.isReceivedDocument})
      : super._();

  factory _$MaterialReturnNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReturnNoteImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final String id;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  final Supplier supplier;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  final PurchaseOrder purchaseOrder;
  @override
  @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
  final DateTime returnDate;
  @override
  @JsonKey(name: 'invoice_no')
  final String invoiceNo;
  @override
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  final DateTime invoiceDate;
  @override
  @JsonKey(name: 'tax_invoice_no')
  final String taxInvoiceNo;
  @override
  @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
  final DateTime taxInvoiceDate;
  @override
  final String description;
  @override
  @JsonKey(name: 'is_received_document')
  final bool isReceivedDocument;

  @override
  String toString() {
    return 'MaterialReturnNote(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, supplier: $supplier, purchaseOrder: $purchaseOrder, returnDate: $returnDate, invoiceNo: $invoiceNo, invoiceDate: $invoiceDate, taxInvoiceNo: $taxInvoiceNo, taxInvoiceDate: $taxInvoiceDate, description: $description, isReceivedDocument: $isReceivedDocument)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReturnNoteImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.returnDate, returnDate) ||
                other.returnDate == returnDate) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.taxInvoiceDate, taxInvoiceDate) ||
                other.taxInvoiceDate == taxInvoiceDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isReceivedDocument, isReceivedDocument) ||
                other.isReceivedDocument == isReceivedDocument));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      id,
      supplier,
      purchaseOrder,
      returnDate,
      invoiceNo,
      invoiceDate,
      taxInvoiceNo,
      taxInvoiceDate,
      description,
      isReceivedDocument);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReturnNoteImplCopyWith<_$MaterialReturnNoteImpl> get copyWith =>
      __$$MaterialReturnNoteImplCopyWithImpl<_$MaterialReturnNoteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReturnNoteImplToJson(
      this,
    );
  }
}

abstract class _MaterialReturnNote extends MaterialReturnNote {
  factory _MaterialReturnNote(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      required final String id,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      required final Supplier supplier,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required final PurchaseOrder purchaseOrder,
      @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
      required final DateTime returnDate,
      @JsonKey(name: 'invoice_no') required final String invoiceNo,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required final DateTime invoiceDate,
      @JsonKey(name: 'tax_invoice_no') required final String taxInvoiceNo,
      @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
      required final DateTime taxInvoiceDate,
      required final String description,
      @JsonKey(name: 'is_received_document')
      required final bool isReceivedDocument}) = _$MaterialReturnNoteImpl;
  _MaterialReturnNote._() : super._();

  factory _MaterialReturnNote.fromJson(Map<String, dynamic> json) =
      _$MaterialReturnNoteImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  String get id;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder;
  @override
  @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
  DateTime get returnDate;
  @override
  @JsonKey(name: 'invoice_no')
  String get invoiceNo;
  @override
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate;
  @override
  @JsonKey(name: 'tax_invoice_no')
  String get taxInvoiceNo;
  @override
  @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
  DateTime get taxInvoiceDate;
  @override
  String get description;
  @override
  @JsonKey(name: 'is_received_document')
  bool get isReceivedDocument;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReturnNoteImplCopyWith<_$MaterialReturnNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
