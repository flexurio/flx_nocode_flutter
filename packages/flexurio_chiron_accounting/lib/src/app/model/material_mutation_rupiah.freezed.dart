// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_mutation_rupiah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialMutationRupiah _$MaterialMutationRupiahFromJson(
    Map<String, dynamic> json) {
  return _MaterialMutationRupiah.fromJson(json);
}

/// @nodoc
mixin _$MaterialMutationRupiah {
  String get year => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  String get dk => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group_id')
  String get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_product')
  String get batchProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'process_date', fromJson: isoDateToDateTime)
  DateTime get processDate => throw _privateConstructorUsedError;

  /// Serializes this MaterialMutationRupiah to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialMutationRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialMutationRupiahCopyWith<MaterialMutationRupiah> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialMutationRupiahCopyWith<$Res> {
  factory $MaterialMutationRupiahCopyWith(MaterialMutationRupiah value,
          $Res Function(MaterialMutationRupiah) then) =
      _$MaterialMutationRupiahCopyWithImpl<$Res, MaterialMutationRupiah>;
  @useResult
  $Res call(
      {String year,
      String month,
      String na,
      int quantity,
      String unit,
      double price,
      int value,
      String dk,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'batch_product') String batchProduct,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'process_date', fromJson: isoDateToDateTime)
      DateTime processDate});
}

/// @nodoc
class _$MaterialMutationRupiahCopyWithImpl<$Res,
        $Val extends MaterialMutationRupiah>
    implements $MaterialMutationRupiahCopyWith<$Res> {
  _$MaterialMutationRupiahCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialMutationRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? na = null,
    Object? quantity = null,
    Object? unit = null,
    Object? price = null,
    Object? value = null,
    Object? dk = null,
    Object? transactionId = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? materialGroupId = null,
    Object? batchProduct = null,
    Object? date = null,
    Object? processDate = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      dk: null == dk
          ? _value.dk
          : dk // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      batchProduct: null == batchProduct
          ? _value.batchProduct
          : batchProduct // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      processDate: null == processDate
          ? _value.processDate
          : processDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialMutationRupiahImplCopyWith<$Res>
    implements $MaterialMutationRupiahCopyWith<$Res> {
  factory _$$MaterialMutationRupiahImplCopyWith(
          _$MaterialMutationRupiahImpl value,
          $Res Function(_$MaterialMutationRupiahImpl) then) =
      __$$MaterialMutationRupiahImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String year,
      String month,
      String na,
      int quantity,
      String unit,
      double price,
      int value,
      String dk,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'batch_product') String batchProduct,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'process_date', fromJson: isoDateToDateTime)
      DateTime processDate});
}

/// @nodoc
class __$$MaterialMutationRupiahImplCopyWithImpl<$Res>
    extends _$MaterialMutationRupiahCopyWithImpl<$Res,
        _$MaterialMutationRupiahImpl>
    implements _$$MaterialMutationRupiahImplCopyWith<$Res> {
  __$$MaterialMutationRupiahImplCopyWithImpl(
      _$MaterialMutationRupiahImpl _value,
      $Res Function(_$MaterialMutationRupiahImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialMutationRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? na = null,
    Object? quantity = null,
    Object? unit = null,
    Object? price = null,
    Object? value = null,
    Object? dk = null,
    Object? transactionId = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? materialGroupId = null,
    Object? batchProduct = null,
    Object? date = null,
    Object? processDate = null,
  }) {
    return _then(_$MaterialMutationRupiahImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      dk: null == dk
          ? _value.dk
          : dk // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      batchProduct: null == batchProduct
          ? _value.batchProduct
          : batchProduct // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      processDate: null == processDate
          ? _value.processDate
          : processDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialMutationRupiahImpl extends _MaterialMutationRupiah {
  const _$MaterialMutationRupiahImpl(
      {required this.year,
      required this.month,
      required this.na,
      required this.quantity,
      required this.unit,
      required this.price,
      required this.value,
      required this.dk,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'material_group_id') required this.materialGroupId,
      @JsonKey(name: 'batch_product') required this.batchProduct,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) required this.date,
      @JsonKey(name: 'process_date', fromJson: isoDateToDateTime)
      required this.processDate})
      : super._();

  factory _$MaterialMutationRupiahImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialMutationRupiahImplFromJson(json);

  @override
  final String year;
  @override
  final String month;
  @override
  final String na;
  @override
  final int quantity;
  @override
  final String unit;
  @override
  final double price;
  @override
  final int value;
  @override
  final String dk;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'material_group_id')
  final String materialGroupId;
  @override
  @JsonKey(name: 'batch_product')
  final String batchProduct;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  final DateTime date;
  @override
  @JsonKey(name: 'process_date', fromJson: isoDateToDateTime)
  final DateTime processDate;

  @override
  String toString() {
    return 'MaterialMutationRupiah(year: $year, month: $month, na: $na, quantity: $quantity, unit: $unit, price: $price, value: $value, dk: $dk, transactionId: $transactionId, materialId: $materialId, materialName: $materialName, materialGroupId: $materialGroupId, batchProduct: $batchProduct, date: $date, processDate: $processDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialMutationRupiahImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.dk, dk) || other.dk == dk) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.batchProduct, batchProduct) ||
                other.batchProduct == batchProduct) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.processDate, processDate) ||
                other.processDate == processDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      year,
      month,
      na,
      quantity,
      unit,
      price,
      value,
      dk,
      transactionId,
      materialId,
      materialName,
      materialGroupId,
      batchProduct,
      date,
      processDate);

  /// Create a copy of MaterialMutationRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialMutationRupiahImplCopyWith<_$MaterialMutationRupiahImpl>
      get copyWith => __$$MaterialMutationRupiahImplCopyWithImpl<
          _$MaterialMutationRupiahImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialMutationRupiahImplToJson(
      this,
    );
  }
}

abstract class _MaterialMutationRupiah extends MaterialMutationRupiah {
  const factory _MaterialMutationRupiah(
      {required final String year,
      required final String month,
      required final String na,
      required final int quantity,
      required final String unit,
      required final double price,
      required final int value,
      required final String dk,
      @JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_name') required final String materialName,
      @JsonKey(name: 'material_group_id') required final String materialGroupId,
      @JsonKey(name: 'batch_product') required final String batchProduct,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime)
      required final DateTime date,
      @JsonKey(name: 'process_date', fromJson: isoDateToDateTime)
      required final DateTime processDate}) = _$MaterialMutationRupiahImpl;
  const _MaterialMutationRupiah._() : super._();

  factory _MaterialMutationRupiah.fromJson(Map<String, dynamic> json) =
      _$MaterialMutationRupiahImpl.fromJson;

  @override
  String get year;
  @override
  String get month;
  @override
  String get na;
  @override
  int get quantity;
  @override
  String get unit;
  @override
  double get price;
  @override
  int get value;
  @override
  String get dk;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'material_group_id')
  String get materialGroupId;
  @override
  @JsonKey(name: 'batch_product')
  String get batchProduct;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date;
  @override
  @JsonKey(name: 'process_date', fromJson: isoDateToDateTime)
  DateTime get processDate;

  /// Create a copy of MaterialMutationRupiah
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialMutationRupiahImplCopyWith<_$MaterialMutationRupiahImpl>
      get copyWith => throw _privateConstructorUsedError;
}
