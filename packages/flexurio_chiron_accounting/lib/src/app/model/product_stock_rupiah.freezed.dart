// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stock_rupiah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStockRupiah _$ProductStockRupiahFromJson(Map<String, dynamic> json) {
  return _ProductStockRupiah.fromJson(json);
}

/// @nodoc
mixin _$ProductStockRupiah {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_price')
  int get primaryPrice => throw _privateConstructorUsedError;

  /// Serializes this ProductStockRupiah to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductStockRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStockRupiahCopyWith<ProductStockRupiah> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockRupiahCopyWith<$Res> {
  factory $ProductStockRupiahCopyWith(
          ProductStockRupiah value, $Res Function(ProductStockRupiah) then) =
      _$ProductStockRupiahCopyWithImpl<$Res, ProductStockRupiah>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'unit_id') String unitId,
      int qty,
      @JsonKey(name: 'primary_price') int primaryPrice});
}

/// @nodoc
class _$ProductStockRupiahCopyWithImpl<$Res, $Val extends ProductStockRupiah>
    implements $ProductStockRupiahCopyWith<$Res> {
  _$ProductStockRupiahCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductStockRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? unitId = null,
    Object? qty = null,
    Object? primaryPrice = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      primaryPrice: null == primaryPrice
          ? _value.primaryPrice
          : primaryPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStockRupiahImplCopyWith<$Res>
    implements $ProductStockRupiahCopyWith<$Res> {
  factory _$$ProductStockRupiahImplCopyWith(_$ProductStockRupiahImpl value,
          $Res Function(_$ProductStockRupiahImpl) then) =
      __$$ProductStockRupiahImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'unit_id') String unitId,
      int qty,
      @JsonKey(name: 'primary_price') int primaryPrice});
}

/// @nodoc
class __$$ProductStockRupiahImplCopyWithImpl<$Res>
    extends _$ProductStockRupiahCopyWithImpl<$Res, _$ProductStockRupiahImpl>
    implements _$$ProductStockRupiahImplCopyWith<$Res> {
  __$$ProductStockRupiahImplCopyWithImpl(_$ProductStockRupiahImpl _value,
      $Res Function(_$ProductStockRupiahImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductStockRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? unitId = null,
    Object? qty = null,
    Object? primaryPrice = null,
  }) {
    return _then(_$ProductStockRupiahImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      primaryPrice: null == primaryPrice
          ? _value.primaryPrice
          : primaryPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStockRupiahImpl extends _ProductStockRupiah {
  const _$ProductStockRupiahImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'unit_id') required this.unitId,
      required this.qty,
      @JsonKey(name: 'primary_price') required this.primaryPrice})
      : super._();

  factory _$ProductStockRupiahImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockRupiahImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  final int qty;
  @override
  @JsonKey(name: 'primary_price')
  final int primaryPrice;

  @override
  String toString() {
    return 'ProductStockRupiah(productId: $productId, productName: $productName, unitId: $unitId, qty: $qty, primaryPrice: $primaryPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockRupiahImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.primaryPrice, primaryPrice) ||
                other.primaryPrice == primaryPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, productName, unitId, qty, primaryPrice);

  /// Create a copy of ProductStockRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockRupiahImplCopyWith<_$ProductStockRupiahImpl> get copyWith =>
      __$$ProductStockRupiahImplCopyWithImpl<_$ProductStockRupiahImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockRupiahImplToJson(
      this,
    );
  }
}

abstract class _ProductStockRupiah extends ProductStockRupiah {
  const factory _ProductStockRupiah(
          {@JsonKey(name: 'product_id') required final String productId,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'unit_id') required final String unitId,
          required final int qty,
          @JsonKey(name: 'primary_price') required final int primaryPrice}) =
      _$ProductStockRupiahImpl;
  const _ProductStockRupiah._() : super._();

  factory _ProductStockRupiah.fromJson(Map<String, dynamic> json) =
      _$ProductStockRupiahImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  int get qty;
  @override
  @JsonKey(name: 'primary_price')
  int get primaryPrice;

  /// Create a copy of ProductStockRupiah
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStockRupiahImplCopyWith<_$ProductStockRupiahImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
