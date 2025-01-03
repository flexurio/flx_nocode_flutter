// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_return_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinanceReturnNote _$FinanceReturnNoteFromJson(Map<String, dynamic> json) {
  return _FinanceReturnNote.fromJson(json);
}

/// @nodoc
mixin _$FinanceReturnNote {
  @JsonKey(name: 'no_cnj')
  String get cnjNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_srp')
  String get srpNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'nota_return')
  String get returnNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_sj')
  String get deliveryNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'tgl_no_sj', fromJson: dateTimeFromJson)
  DateTime get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_faktur_pajak')
  String get taxInvoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_customer')
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_ref')
  String get referenceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'divisi_name')
  String get division => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit')
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'harsat')
  double get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'harga')
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'persen_disc')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'dpp')
  double get dpp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn')
  double get ppn => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'ex_date', fromJson: dateTimeFromJson)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_batch')
  String get batch => throw _privateConstructorUsedError;

  /// Serializes this FinanceReturnNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinanceReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceReturnNoteCopyWith<FinanceReturnNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceReturnNoteCopyWith<$Res> {
  factory $FinanceReturnNoteCopyWith(
          FinanceReturnNote value, $Res Function(FinanceReturnNote) then) =
      _$FinanceReturnNoteCopyWithImpl<$Res, FinanceReturnNote>;
  @useResult
  $Res call(
      {@JsonKey(name: 'no_cnj') String cnjNo,
      @JsonKey(name: 'no_srp') String srpNo,
      @JsonKey(name: 'nota_return') String returnNote,
      @JsonKey(name: 'no_sj') String deliveryNo,
      @JsonKey(name: 'tgl_no_sj', fromJson: dateTimeFromJson)
      DateTime deliveryDate,
      @JsonKey(name: 'no_faktur_pajak') String taxInvoiceNo,
      @JsonKey(name: 'nama_customer') String customer,
      @JsonKey(name: 'no_ref') String referenceNo,
      @JsonKey(name: 'divisi_name') String division,
      @JsonKey(name: 'product_name') String product,
      @JsonKey(name: 'qty') int quantity,
      @JsonKey(name: 'unit') String unit,
      @JsonKey(name: 'harsat') double unitPrice,
      @JsonKey(name: 'harga') double price,
      @JsonKey(name: 'persen_disc') double discountPercent,
      @JsonKey(name: 'dpp') double dpp,
      @JsonKey(name: 'ppn') double ppn,
      @JsonKey(name: 'total') double total,
      @JsonKey(name: 'ex_date', fromJson: dateTimeFromJson)
      DateTime expiredDate,
      @JsonKey(name: 'no_batch') String batch});
}

/// @nodoc
class _$FinanceReturnNoteCopyWithImpl<$Res, $Val extends FinanceReturnNote>
    implements $FinanceReturnNoteCopyWith<$Res> {
  _$FinanceReturnNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cnjNo = null,
    Object? srpNo = null,
    Object? returnNote = null,
    Object? deliveryNo = null,
    Object? deliveryDate = null,
    Object? taxInvoiceNo = null,
    Object? customer = null,
    Object? referenceNo = null,
    Object? division = null,
    Object? product = null,
    Object? quantity = null,
    Object? unit = null,
    Object? unitPrice = null,
    Object? price = null,
    Object? discountPercent = null,
    Object? dpp = null,
    Object? ppn = null,
    Object? total = null,
    Object? expiredDate = null,
    Object? batch = null,
  }) {
    return _then(_value.copyWith(
      cnjNo: null == cnjNo
          ? _value.cnjNo
          : cnjNo // ignore: cast_nullable_to_non_nullable
              as String,
      srpNo: null == srpNo
          ? _value.srpNo
          : srpNo // ignore: cast_nullable_to_non_nullable
              as String,
      returnNote: null == returnNote
          ? _value.returnNote
          : returnNote // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNo: null == deliveryNo
          ? _value.deliveryNo
          : deliveryNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNo: null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      dpp: null == dpp
          ? _value.dpp
          : dpp // ignore: cast_nullable_to_non_nullable
              as double,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinanceReturnNoteImplCopyWith<$Res>
    implements $FinanceReturnNoteCopyWith<$Res> {
  factory _$$FinanceReturnNoteImplCopyWith(_$FinanceReturnNoteImpl value,
          $Res Function(_$FinanceReturnNoteImpl) then) =
      __$$FinanceReturnNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'no_cnj') String cnjNo,
      @JsonKey(name: 'no_srp') String srpNo,
      @JsonKey(name: 'nota_return') String returnNote,
      @JsonKey(name: 'no_sj') String deliveryNo,
      @JsonKey(name: 'tgl_no_sj', fromJson: dateTimeFromJson)
      DateTime deliveryDate,
      @JsonKey(name: 'no_faktur_pajak') String taxInvoiceNo,
      @JsonKey(name: 'nama_customer') String customer,
      @JsonKey(name: 'no_ref') String referenceNo,
      @JsonKey(name: 'divisi_name') String division,
      @JsonKey(name: 'product_name') String product,
      @JsonKey(name: 'qty') int quantity,
      @JsonKey(name: 'unit') String unit,
      @JsonKey(name: 'harsat') double unitPrice,
      @JsonKey(name: 'harga') double price,
      @JsonKey(name: 'persen_disc') double discountPercent,
      @JsonKey(name: 'dpp') double dpp,
      @JsonKey(name: 'ppn') double ppn,
      @JsonKey(name: 'total') double total,
      @JsonKey(name: 'ex_date', fromJson: dateTimeFromJson)
      DateTime expiredDate,
      @JsonKey(name: 'no_batch') String batch});
}

/// @nodoc
class __$$FinanceReturnNoteImplCopyWithImpl<$Res>
    extends _$FinanceReturnNoteCopyWithImpl<$Res, _$FinanceReturnNoteImpl>
    implements _$$FinanceReturnNoteImplCopyWith<$Res> {
  __$$FinanceReturnNoteImplCopyWithImpl(_$FinanceReturnNoteImpl _value,
      $Res Function(_$FinanceReturnNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cnjNo = null,
    Object? srpNo = null,
    Object? returnNote = null,
    Object? deliveryNo = null,
    Object? deliveryDate = null,
    Object? taxInvoiceNo = null,
    Object? customer = null,
    Object? referenceNo = null,
    Object? division = null,
    Object? product = null,
    Object? quantity = null,
    Object? unit = null,
    Object? unitPrice = null,
    Object? price = null,
    Object? discountPercent = null,
    Object? dpp = null,
    Object? ppn = null,
    Object? total = null,
    Object? expiredDate = null,
    Object? batch = null,
  }) {
    return _then(_$FinanceReturnNoteImpl(
      null == cnjNo
          ? _value.cnjNo
          : cnjNo // ignore: cast_nullable_to_non_nullable
              as String,
      null == srpNo
          ? _value.srpNo
          : srpNo // ignore: cast_nullable_to_non_nullable
              as String,
      null == returnNote
          ? _value.returnNote
          : returnNote // ignore: cast_nullable_to_non_nullable
              as String,
      null == deliveryNo
          ? _value.deliveryNo
          : deliveryNo // ignore: cast_nullable_to_non_nullable
              as String,
      null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
      null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      null == dpp
          ? _value.dpp
          : dpp // ignore: cast_nullable_to_non_nullable
              as double,
      null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as double,
      null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinanceReturnNoteImpl extends _FinanceReturnNote {
  const _$FinanceReturnNoteImpl(
      @JsonKey(name: 'no_cnj') this.cnjNo,
      @JsonKey(name: 'no_srp') this.srpNo,
      @JsonKey(name: 'nota_return') this.returnNote,
      @JsonKey(name: 'no_sj') this.deliveryNo,
      @JsonKey(name: 'tgl_no_sj', fromJson: dateTimeFromJson) this.deliveryDate,
      @JsonKey(name: 'no_faktur_pajak') this.taxInvoiceNo,
      @JsonKey(name: 'nama_customer') this.customer,
      @JsonKey(name: 'no_ref') this.referenceNo,
      @JsonKey(name: 'divisi_name') this.division,
      @JsonKey(name: 'product_name') this.product,
      @JsonKey(name: 'qty') this.quantity,
      @JsonKey(name: 'unit') this.unit,
      @JsonKey(name: 'harsat') this.unitPrice,
      @JsonKey(name: 'harga') this.price,
      @JsonKey(name: 'persen_disc') this.discountPercent,
      @JsonKey(name: 'dpp') this.dpp,
      @JsonKey(name: 'ppn') this.ppn,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'ex_date', fromJson: dateTimeFromJson) this.expiredDate,
      @JsonKey(name: 'no_batch') this.batch)
      : super._();

  factory _$FinanceReturnNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceReturnNoteImplFromJson(json);

  @override
  @JsonKey(name: 'no_cnj')
  final String cnjNo;
  @override
  @JsonKey(name: 'no_srp')
  final String srpNo;
  @override
  @JsonKey(name: 'nota_return')
  final String returnNote;
  @override
  @JsonKey(name: 'no_sj')
  final String deliveryNo;
  @override
  @JsonKey(name: 'tgl_no_sj', fromJson: dateTimeFromJson)
  final DateTime deliveryDate;
  @override
  @JsonKey(name: 'no_faktur_pajak')
  final String taxInvoiceNo;
  @override
  @JsonKey(name: 'nama_customer')
  final String customer;
  @override
  @JsonKey(name: 'no_ref')
  final String referenceNo;
  @override
  @JsonKey(name: 'divisi_name')
  final String division;
  @override
  @JsonKey(name: 'product_name')
  final String product;
  @override
  @JsonKey(name: 'qty')
  final int quantity;
  @override
  @JsonKey(name: 'unit')
  final String unit;
  @override
  @JsonKey(name: 'harsat')
  final double unitPrice;
  @override
  @JsonKey(name: 'harga')
  final double price;
  @override
  @JsonKey(name: 'persen_disc')
  final double discountPercent;
  @override
  @JsonKey(name: 'dpp')
  final double dpp;
  @override
  @JsonKey(name: 'ppn')
  final double ppn;
  @override
  @JsonKey(name: 'total')
  final double total;
  @override
  @JsonKey(name: 'ex_date', fromJson: dateTimeFromJson)
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'no_batch')
  final String batch;

  @override
  String toString() {
    return 'FinanceReturnNote(cnjNo: $cnjNo, srpNo: $srpNo, returnNote: $returnNote, deliveryNo: $deliveryNo, deliveryDate: $deliveryDate, taxInvoiceNo: $taxInvoiceNo, customer: $customer, referenceNo: $referenceNo, division: $division, product: $product, quantity: $quantity, unit: $unit, unitPrice: $unitPrice, price: $price, discountPercent: $discountPercent, dpp: $dpp, ppn: $ppn, total: $total, expiredDate: $expiredDate, batch: $batch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceReturnNoteImpl &&
            (identical(other.cnjNo, cnjNo) || other.cnjNo == cnjNo) &&
            (identical(other.srpNo, srpNo) || other.srpNo == srpNo) &&
            (identical(other.returnNote, returnNote) ||
                other.returnNote == returnNote) &&
            (identical(other.deliveryNo, deliveryNo) ||
                other.deliveryNo == deliveryNo) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.division, division) ||
                other.division == division) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.dpp, dpp) || other.dpp == dpp) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.batch, batch) || other.batch == batch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        cnjNo,
        srpNo,
        returnNote,
        deliveryNo,
        deliveryDate,
        taxInvoiceNo,
        customer,
        referenceNo,
        division,
        product,
        quantity,
        unit,
        unitPrice,
        price,
        discountPercent,
        dpp,
        ppn,
        total,
        expiredDate,
        batch
      ]);

  /// Create a copy of FinanceReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceReturnNoteImplCopyWith<_$FinanceReturnNoteImpl> get copyWith =>
      __$$FinanceReturnNoteImplCopyWithImpl<_$FinanceReturnNoteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinanceReturnNoteImplToJson(
      this,
    );
  }
}

abstract class _FinanceReturnNote extends FinanceReturnNote {
  const factory _FinanceReturnNote(
      @JsonKey(name: 'no_cnj') final String cnjNo,
      @JsonKey(name: 'no_srp') final String srpNo,
      @JsonKey(name: 'nota_return') final String returnNote,
      @JsonKey(name: 'no_sj') final String deliveryNo,
      @JsonKey(name: 'tgl_no_sj', fromJson: dateTimeFromJson)
      final DateTime deliveryDate,
      @JsonKey(name: 'no_faktur_pajak') final String taxInvoiceNo,
      @JsonKey(name: 'nama_customer') final String customer,
      @JsonKey(name: 'no_ref') final String referenceNo,
      @JsonKey(name: 'divisi_name') final String division,
      @JsonKey(name: 'product_name') final String product,
      @JsonKey(name: 'qty') final int quantity,
      @JsonKey(name: 'unit') final String unit,
      @JsonKey(name: 'harsat') final double unitPrice,
      @JsonKey(name: 'harga') final double price,
      @JsonKey(name: 'persen_disc') final double discountPercent,
      @JsonKey(name: 'dpp') final double dpp,
      @JsonKey(name: 'ppn') final double ppn,
      @JsonKey(name: 'total') final double total,
      @JsonKey(name: 'ex_date', fromJson: dateTimeFromJson)
      final DateTime expiredDate,
      @JsonKey(name: 'no_batch') final String batch) = _$FinanceReturnNoteImpl;
  const _FinanceReturnNote._() : super._();

  factory _FinanceReturnNote.fromJson(Map<String, dynamic> json) =
      _$FinanceReturnNoteImpl.fromJson;

  @override
  @JsonKey(name: 'no_cnj')
  String get cnjNo;
  @override
  @JsonKey(name: 'no_srp')
  String get srpNo;
  @override
  @JsonKey(name: 'nota_return')
  String get returnNote;
  @override
  @JsonKey(name: 'no_sj')
  String get deliveryNo;
  @override
  @JsonKey(name: 'tgl_no_sj', fromJson: dateTimeFromJson)
  DateTime get deliveryDate;
  @override
  @JsonKey(name: 'no_faktur_pajak')
  String get taxInvoiceNo;
  @override
  @JsonKey(name: 'nama_customer')
  String get customer;
  @override
  @JsonKey(name: 'no_ref')
  String get referenceNo;
  @override
  @JsonKey(name: 'divisi_name')
  String get division;
  @override
  @JsonKey(name: 'product_name')
  String get product;
  @override
  @JsonKey(name: 'qty')
  int get quantity;
  @override
  @JsonKey(name: 'unit')
  String get unit;
  @override
  @JsonKey(name: 'harsat')
  double get unitPrice;
  @override
  @JsonKey(name: 'harga')
  double get price;
  @override
  @JsonKey(name: 'persen_disc')
  double get discountPercent;
  @override
  @JsonKey(name: 'dpp')
  double get dpp;
  @override
  @JsonKey(name: 'ppn')
  double get ppn;
  @override
  @JsonKey(name: 'total')
  double get total;
  @override
  @JsonKey(name: 'ex_date', fromJson: dateTimeFromJson)
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'no_batch')
  String get batch;

  /// Create a copy of FinanceReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceReturnNoteImplCopyWith<_$FinanceReturnNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
