// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_receive_recap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReceiveRecap _$ProductReceiveRecapFromJson(Map<String, dynamic> json) {
  return _ProductReceiveRecap.fromJson(json);
}

/// @nodoc
mixin _$ProductReceiveRecap {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'barcode_no')
  String get barcodeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'barcode_origin_no')
  String get barcodeOriginNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'barcode_result_no')
  String get barcodeResultNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_no')
  int get vatNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_total')
  int get vatTotal => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  int get totalPrice => throw _privateConstructorUsedError;
  String get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_document_complete')
  bool get isDocumentComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  DateTime get releaseAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_by_id')
  int get releaseById => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_partial')
  bool get isPartial => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
  ProductReceive get productReceive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_doc_acc')
  bool? get isDocAcc => throw _privateConstructorUsedError;
  @JsonKey(name: 'doc_acc_date', fromJson: dateTimeNullableFromJson)
  DateTime? get docAccDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_document_complete_at', fromJson: dateTimeNullableFromJson)
  DateTime? get isDocumentCompleteAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_document_complete_by_id')
  int? get isDocumentCompleteById => throw _privateConstructorUsedError;
  @JsonKey(name: 'reject_at', fromJson: dateTimeNullableFromJson)
  DateTime? get rejectAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'reject_by_id')
  int? get rejectById => throw _privateConstructorUsedError;
  @JsonKey(name: 'reject_reason')
  String? get rejectReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReceiveRecapCopyWith<ProductReceiveRecap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReceiveRecapCopyWith<$Res> {
  factory $ProductReceiveRecapCopyWith(
          ProductReceiveRecap value, $Res Function(ProductReceiveRecap) then) =
      _$ProductReceiveRecapCopyWithImpl<$Res, ProductReceiveRecap>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'barcode_no') String barcodeNo,
      @JsonKey(name: 'barcode_origin_no') String barcodeOriginNo,
      @JsonKey(name: 'barcode_result_no') String barcodeResultNo,
      @JsonKey(name: 'vat_no') int vatNo,
      @JsonKey(name: 'vat_total') int vatTotal,
      int qty,
      String na,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      String status,
      int price,
      @JsonKey(name: 'total_price') int totalPrice,
      String warehouse,
      @JsonKey(name: 'is_document_complete') bool isDocumentComplete,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      DateTime releaseAt,
      @JsonKey(name: 'release_by_id') int releaseById,
      @JsonKey(name: 'is_partial') bool isPartial,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder batchNo,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
      ProductReceive productReceive,
      @JsonKey(name: 'is_doc_acc') bool? isDocAcc,
      @JsonKey(name: 'doc_acc_date', fromJson: dateTimeNullableFromJson)
      DateTime? docAccDate,
      @JsonKey(
          name: 'is_document_complete_at', fromJson: dateTimeNullableFromJson)
      DateTime? isDocumentCompleteAt,
      @JsonKey(name: 'is_document_complete_by_id') int? isDocumentCompleteById,
      @JsonKey(name: 'reject_at', fromJson: dateTimeNullableFromJson)
      DateTime? rejectAt,
      @JsonKey(name: 'reject_by_id') int? rejectById,
      @JsonKey(name: 'reject_reason') String? rejectReason});

  $MaterialUnitCopyWith<$Res> get unit;
  $ProductionOrderCopyWith<$Res> get batchNo;
  $ProductCopyWith<$Res> get product;
  $ProductReceiveCopyWith<$Res> get productReceive;
}

/// @nodoc
class _$ProductReceiveRecapCopyWithImpl<$Res, $Val extends ProductReceiveRecap>
    implements $ProductReceiveRecapCopyWith<$Res> {
  _$ProductReceiveRecapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? barcodeNo = null,
    Object? barcodeOriginNo = null,
    Object? barcodeResultNo = null,
    Object? vatNo = null,
    Object? vatTotal = null,
    Object? qty = null,
    Object? na = null,
    Object? expiredDate = null,
    Object? status = null,
    Object? price = null,
    Object? totalPrice = null,
    Object? warehouse = null,
    Object? isDocumentComplete = null,
    Object? releaseAt = null,
    Object? releaseById = null,
    Object? isPartial = null,
    Object? unit = null,
    Object? batchNo = null,
    Object? product = null,
    Object? productReceive = null,
    Object? isDocAcc = freezed,
    Object? docAccDate = freezed,
    Object? isDocumentCompleteAt = freezed,
    Object? isDocumentCompleteById = freezed,
    Object? rejectAt = freezed,
    Object? rejectById = freezed,
    Object? rejectReason = freezed,
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      barcodeNo: null == barcodeNo
          ? _value.barcodeNo
          : barcodeNo // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeOriginNo: null == barcodeOriginNo
          ? _value.barcodeOriginNo
          : barcodeOriginNo // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeResultNo: null == barcodeResultNo
          ? _value.barcodeResultNo
          : barcodeResultNo // ignore: cast_nullable_to_non_nullable
              as String,
      vatNo: null == vatNo
          ? _value.vatNo
          : vatNo // ignore: cast_nullable_to_non_nullable
              as int,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      isDocumentComplete: null == isDocumentComplete
          ? _value.isDocumentComplete
          : isDocumentComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      releaseAt: null == releaseAt
          ? _value.releaseAt
          : releaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      releaseById: null == releaseById
          ? _value.releaseById
          : releaseById // ignore: cast_nullable_to_non_nullable
              as int,
      isPartial: null == isPartial
          ? _value.isPartial
          : isPartial // ignore: cast_nullable_to_non_nullable
              as bool,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productReceive: null == productReceive
          ? _value.productReceive
          : productReceive // ignore: cast_nullable_to_non_nullable
              as ProductReceive,
      isDocAcc: freezed == isDocAcc
          ? _value.isDocAcc
          : isDocAcc // ignore: cast_nullable_to_non_nullable
              as bool?,
      docAccDate: freezed == docAccDate
          ? _value.docAccDate
          : docAccDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDocumentCompleteAt: freezed == isDocumentCompleteAt
          ? _value.isDocumentCompleteAt
          : isDocumentCompleteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDocumentCompleteById: freezed == isDocumentCompleteById
          ? _value.isDocumentCompleteById
          : isDocumentCompleteById // ignore: cast_nullable_to_non_nullable
              as int?,
      rejectAt: freezed == rejectAt
          ? _value.rejectAt
          : rejectAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectById: freezed == rejectById
          ? _value.rejectById
          : rejectById // ignore: cast_nullable_to_non_nullable
              as int?,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get batchNo {
    return $ProductionOrderCopyWith<$Res>(_value.batchNo, (value) {
      return _then(_value.copyWith(batchNo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveCopyWith<$Res> get productReceive {
    return $ProductReceiveCopyWith<$Res>(_value.productReceive, (value) {
      return _then(_value.copyWith(productReceive: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReceiveRecapImplCopyWith<$Res>
    implements $ProductReceiveRecapCopyWith<$Res> {
  factory _$$ProductReceiveRecapImplCopyWith(_$ProductReceiveRecapImpl value,
          $Res Function(_$ProductReceiveRecapImpl) then) =
      __$$ProductReceiveRecapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'barcode_no') String barcodeNo,
      @JsonKey(name: 'barcode_origin_no') String barcodeOriginNo,
      @JsonKey(name: 'barcode_result_no') String barcodeResultNo,
      @JsonKey(name: 'vat_no') int vatNo,
      @JsonKey(name: 'vat_total') int vatTotal,
      int qty,
      String na,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      String status,
      int price,
      @JsonKey(name: 'total_price') int totalPrice,
      String warehouse,
      @JsonKey(name: 'is_document_complete') bool isDocumentComplete,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      DateTime releaseAt,
      @JsonKey(name: 'release_by_id') int releaseById,
      @JsonKey(name: 'is_partial') bool isPartial,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder batchNo,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
      ProductReceive productReceive,
      @JsonKey(name: 'is_doc_acc') bool? isDocAcc,
      @JsonKey(name: 'doc_acc_date', fromJson: dateTimeNullableFromJson)
      DateTime? docAccDate,
      @JsonKey(
          name: 'is_document_complete_at', fromJson: dateTimeNullableFromJson)
      DateTime? isDocumentCompleteAt,
      @JsonKey(name: 'is_document_complete_by_id') int? isDocumentCompleteById,
      @JsonKey(name: 'reject_at', fromJson: dateTimeNullableFromJson)
      DateTime? rejectAt,
      @JsonKey(name: 'reject_by_id') int? rejectById,
      @JsonKey(name: 'reject_reason') String? rejectReason});

  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $ProductionOrderCopyWith<$Res> get batchNo;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductReceiveCopyWith<$Res> get productReceive;
}

/// @nodoc
class __$$ProductReceiveRecapImplCopyWithImpl<$Res>
    extends _$ProductReceiveRecapCopyWithImpl<$Res, _$ProductReceiveRecapImpl>
    implements _$$ProductReceiveRecapImplCopyWith<$Res> {
  __$$ProductReceiveRecapImplCopyWithImpl(_$ProductReceiveRecapImpl _value,
      $Res Function(_$ProductReceiveRecapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? barcodeNo = null,
    Object? barcodeOriginNo = null,
    Object? barcodeResultNo = null,
    Object? vatNo = null,
    Object? vatTotal = null,
    Object? qty = null,
    Object? na = null,
    Object? expiredDate = null,
    Object? status = null,
    Object? price = null,
    Object? totalPrice = null,
    Object? warehouse = null,
    Object? isDocumentComplete = null,
    Object? releaseAt = null,
    Object? releaseById = null,
    Object? isPartial = null,
    Object? unit = null,
    Object? batchNo = null,
    Object? product = null,
    Object? productReceive = null,
    Object? isDocAcc = freezed,
    Object? docAccDate = freezed,
    Object? isDocumentCompleteAt = freezed,
    Object? isDocumentCompleteById = freezed,
    Object? rejectAt = freezed,
    Object? rejectById = freezed,
    Object? rejectReason = freezed,
  }) {
    return _then(_$ProductReceiveRecapImpl(
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      barcodeNo: null == barcodeNo
          ? _value.barcodeNo
          : barcodeNo // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeOriginNo: null == barcodeOriginNo
          ? _value.barcodeOriginNo
          : barcodeOriginNo // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeResultNo: null == barcodeResultNo
          ? _value.barcodeResultNo
          : barcodeResultNo // ignore: cast_nullable_to_non_nullable
              as String,
      vatNo: null == vatNo
          ? _value.vatNo
          : vatNo // ignore: cast_nullable_to_non_nullable
              as int,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      isDocumentComplete: null == isDocumentComplete
          ? _value.isDocumentComplete
          : isDocumentComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      releaseAt: null == releaseAt
          ? _value.releaseAt
          : releaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      releaseById: null == releaseById
          ? _value.releaseById
          : releaseById // ignore: cast_nullable_to_non_nullable
              as int,
      isPartial: null == isPartial
          ? _value.isPartial
          : isPartial // ignore: cast_nullable_to_non_nullable
              as bool,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productReceive: null == productReceive
          ? _value.productReceive
          : productReceive // ignore: cast_nullable_to_non_nullable
              as ProductReceive,
      isDocAcc: freezed == isDocAcc
          ? _value.isDocAcc
          : isDocAcc // ignore: cast_nullable_to_non_nullable
              as bool?,
      docAccDate: freezed == docAccDate
          ? _value.docAccDate
          : docAccDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDocumentCompleteAt: freezed == isDocumentCompleteAt
          ? _value.isDocumentCompleteAt
          : isDocumentCompleteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDocumentCompleteById: freezed == isDocumentCompleteById
          ? _value.isDocumentCompleteById
          : isDocumentCompleteById // ignore: cast_nullable_to_non_nullable
              as int?,
      rejectAt: freezed == rejectAt
          ? _value.rejectAt
          : rejectAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectById: freezed == rejectById
          ? _value.rejectById
          : rejectById // ignore: cast_nullable_to_non_nullable
              as int?,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReceiveRecapImpl extends _ProductReceiveRecap {
  _$ProductReceiveRecapImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'barcode_no') required this.barcodeNo,
      @JsonKey(name: 'barcode_origin_no') required this.barcodeOriginNo,
      @JsonKey(name: 'barcode_result_no') required this.barcodeResultNo,
      @JsonKey(name: 'vat_no') required this.vatNo,
      @JsonKey(name: 'vat_total') required this.vatTotal,
      required this.qty,
      required this.na,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      required this.status,
      required this.price,
      @JsonKey(name: 'total_price') required this.totalPrice,
      required this.warehouse,
      @JsonKey(name: 'is_document_complete') required this.isDocumentComplete,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      required this.releaseAt,
      @JsonKey(name: 'release_by_id') required this.releaseById,
      @JsonKey(name: 'is_partial') required this.isPartial,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      required this.unit,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      required this.batchNo,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
      required this.productReceive,
      @JsonKey(name: 'is_doc_acc') this.isDocAcc,
      @JsonKey(name: 'doc_acc_date', fromJson: dateTimeNullableFromJson)
      this.docAccDate,
      @JsonKey(
          name: 'is_document_complete_at', fromJson: dateTimeNullableFromJson)
      this.isDocumentCompleteAt,
      @JsonKey(name: 'is_document_complete_by_id') this.isDocumentCompleteById,
      @JsonKey(name: 'reject_at', fromJson: dateTimeNullableFromJson)
      this.rejectAt,
      @JsonKey(name: 'reject_by_id') this.rejectById,
      @JsonKey(name: 'reject_reason') this.rejectReason})
      : super._();

  factory _$ProductReceiveRecapImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReceiveRecapImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'barcode_no')
  final String barcodeNo;
  @override
  @JsonKey(name: 'barcode_origin_no')
  final String barcodeOriginNo;
  @override
  @JsonKey(name: 'barcode_result_no')
  final String barcodeResultNo;
  @override
  @JsonKey(name: 'vat_no')
  final int vatNo;
  @override
  @JsonKey(name: 'vat_total')
  final int vatTotal;
  @override
  final int qty;
  @override
  final String na;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  final String status;
  @override
  final int price;
  @override
  @JsonKey(name: 'total_price')
  final int totalPrice;
  @override
  final String warehouse;
  @override
  @JsonKey(name: 'is_document_complete')
  final bool isDocumentComplete;
  @override
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  final DateTime releaseAt;
  @override
  @JsonKey(name: 'release_by_id')
  final int releaseById;
  @override
  @JsonKey(name: 'is_partial')
  final bool isPartial;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  final ProductionOrder batchNo;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
  final ProductReceive productReceive;
  @override
  @JsonKey(name: 'is_doc_acc')
  final bool? isDocAcc;
  @override
  @JsonKey(name: 'doc_acc_date', fromJson: dateTimeNullableFromJson)
  final DateTime? docAccDate;
  @override
  @JsonKey(name: 'is_document_complete_at', fromJson: dateTimeNullableFromJson)
  final DateTime? isDocumentCompleteAt;
  @override
  @JsonKey(name: 'is_document_complete_by_id')
  final int? isDocumentCompleteById;
  @override
  @JsonKey(name: 'reject_at', fromJson: dateTimeNullableFromJson)
  final DateTime? rejectAt;
  @override
  @JsonKey(name: 'reject_by_id')
  final int? rejectById;
  @override
  @JsonKey(name: 'reject_reason')
  final String? rejectReason;

  @override
  String toString() {
    return 'ProductReceiveRecap(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, barcodeNo: $barcodeNo, barcodeOriginNo: $barcodeOriginNo, barcodeResultNo: $barcodeResultNo, vatNo: $vatNo, vatTotal: $vatTotal, qty: $qty, na: $na, expiredDate: $expiredDate, status: $status, price: $price, totalPrice: $totalPrice, warehouse: $warehouse, isDocumentComplete: $isDocumentComplete, releaseAt: $releaseAt, releaseById: $releaseById, isPartial: $isPartial, unit: $unit, batchNo: $batchNo, product: $product, productReceive: $productReceive, isDocAcc: $isDocAcc, docAccDate: $docAccDate, isDocumentCompleteAt: $isDocumentCompleteAt, isDocumentCompleteById: $isDocumentCompleteById, rejectAt: $rejectAt, rejectById: $rejectById, rejectReason: $rejectReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReceiveRecapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.barcodeNo, barcodeNo) ||
                other.barcodeNo == barcodeNo) &&
            (identical(other.barcodeOriginNo, barcodeOriginNo) ||
                other.barcodeOriginNo == barcodeOriginNo) &&
            (identical(other.barcodeResultNo, barcodeResultNo) ||
                other.barcodeResultNo == barcodeResultNo) &&
            (identical(other.vatNo, vatNo) || other.vatNo == vatNo) &&
            (identical(other.vatTotal, vatTotal) ||
                other.vatTotal == vatTotal) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.isDocumentComplete, isDocumentComplete) ||
                other.isDocumentComplete == isDocumentComplete) &&
            (identical(other.releaseAt, releaseAt) ||
                other.releaseAt == releaseAt) &&
            (identical(other.releaseById, releaseById) ||
                other.releaseById == releaseById) &&
            (identical(other.isPartial, isPartial) ||
                other.isPartial == isPartial) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productReceive, productReceive) ||
                other.productReceive == productReceive) &&
            (identical(other.isDocAcc, isDocAcc) ||
                other.isDocAcc == isDocAcc) &&
            (identical(other.docAccDate, docAccDate) ||
                other.docAccDate == docAccDate) &&
            (identical(other.isDocumentCompleteAt, isDocumentCompleteAt) ||
                other.isDocumentCompleteAt == isDocumentCompleteAt) &&
            (identical(other.isDocumentCompleteById, isDocumentCompleteById) ||
                other.isDocumentCompleteById == isDocumentCompleteById) &&
            (identical(other.rejectAt, rejectAt) ||
                other.rejectAt == rejectAt) &&
            (identical(other.rejectById, rejectById) ||
                other.rejectById == rejectById) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        createdById,
        updatedAt,
        updatedById,
        barcodeNo,
        barcodeOriginNo,
        barcodeResultNo,
        vatNo,
        vatTotal,
        qty,
        na,
        expiredDate,
        status,
        price,
        totalPrice,
        warehouse,
        isDocumentComplete,
        releaseAt,
        releaseById,
        isPartial,
        unit,
        batchNo,
        product,
        productReceive,
        isDocAcc,
        docAccDate,
        isDocumentCompleteAt,
        isDocumentCompleteById,
        rejectAt,
        rejectById,
        rejectReason
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReceiveRecapImplCopyWith<_$ProductReceiveRecapImpl> get copyWith =>
      __$$ProductReceiveRecapImplCopyWithImpl<_$ProductReceiveRecapImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReceiveRecapImplToJson(
      this,
    );
  }
}

abstract class _ProductReceiveRecap extends ProductReceiveRecap {
  factory _ProductReceiveRecap(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'barcode_no') required final String barcodeNo,
      @JsonKey(name: 'barcode_origin_no') required final String barcodeOriginNo,
      @JsonKey(name: 'barcode_result_no') required final String barcodeResultNo,
      @JsonKey(name: 'vat_no') required final int vatNo,
      @JsonKey(name: 'vat_total') required final int vatTotal,
      required final int qty,
      required final String na,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      required final String status,
      required final int price,
      @JsonKey(name: 'total_price') required final int totalPrice,
      required final String warehouse,
      @JsonKey(name: 'is_document_complete')
      required final bool isDocumentComplete,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      required final DateTime releaseAt,
      @JsonKey(name: 'release_by_id') required final int releaseById,
      @JsonKey(name: 'is_partial') required final bool isPartial,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unit,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      required final ProductionOrder batchNo,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required final Product product,
      @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
      required final ProductReceive productReceive,
      @JsonKey(name: 'is_doc_acc') final bool? isDocAcc,
      @JsonKey(name: 'doc_acc_date', fromJson: dateTimeNullableFromJson)
      final DateTime? docAccDate,
      @JsonKey(
          name: 'is_document_complete_at', fromJson: dateTimeNullableFromJson)
      final DateTime? isDocumentCompleteAt,
      @JsonKey(name: 'is_document_complete_by_id')
      final int? isDocumentCompleteById,
      @JsonKey(name: 'reject_at', fromJson: dateTimeNullableFromJson)
      final DateTime? rejectAt,
      @JsonKey(name: 'reject_by_id') final int? rejectById,
      @JsonKey(name: 'reject_reason')
      final String? rejectReason}) = _$ProductReceiveRecapImpl;
  _ProductReceiveRecap._() : super._();

  factory _ProductReceiveRecap.fromJson(Map<String, dynamic> json) =
      _$ProductReceiveRecapImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'barcode_no')
  String get barcodeNo;
  @override
  @JsonKey(name: 'barcode_origin_no')
  String get barcodeOriginNo;
  @override
  @JsonKey(name: 'barcode_result_no')
  String get barcodeResultNo;
  @override
  @JsonKey(name: 'vat_no')
  int get vatNo;
  @override
  @JsonKey(name: 'vat_total')
  int get vatTotal;
  @override
  int get qty;
  @override
  String get na;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  String get status;
  @override
  int get price;
  @override
  @JsonKey(name: 'total_price')
  int get totalPrice;
  @override
  String get warehouse;
  @override
  @JsonKey(name: 'is_document_complete')
  bool get isDocumentComplete;
  @override
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  DateTime get releaseAt;
  @override
  @JsonKey(name: 'release_by_id')
  int get releaseById;
  @override
  @JsonKey(name: 'is_partial')
  bool get isPartial;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batchNo;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
  ProductReceive get productReceive;
  @override
  @JsonKey(name: 'is_doc_acc')
  bool? get isDocAcc;
  @override
  @JsonKey(name: 'doc_acc_date', fromJson: dateTimeNullableFromJson)
  DateTime? get docAccDate;
  @override
  @JsonKey(name: 'is_document_complete_at', fromJson: dateTimeNullableFromJson)
  DateTime? get isDocumentCompleteAt;
  @override
  @JsonKey(name: 'is_document_complete_by_id')
  int? get isDocumentCompleteById;
  @override
  @JsonKey(name: 'reject_at', fromJson: dateTimeNullableFromJson)
  DateTime? get rejectAt;
  @override
  @JsonKey(name: 'reject_by_id')
  int? get rejectById;
  @override
  @JsonKey(name: 'reject_reason')
  String? get rejectReason;
  @override
  @JsonKey(ignore: true)
  _$$ProductReceiveRecapImplCopyWith<_$ProductReceiveRecapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
