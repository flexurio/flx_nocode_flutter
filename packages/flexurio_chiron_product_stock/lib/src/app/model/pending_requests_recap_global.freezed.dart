// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_requests_recap_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PendingRequestsRecapGlobal _$PendingRequestsRecapGlobalFromJson(
    Map<String, dynamic> json) {
  return _PendingRequestsRecapGlobal.fromJson(json);
}

/// @nodoc
mixin _$PendingRequestsRecapGlobal {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_remaining')
  int get quantityRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_stock')
  int get quantityStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_remaining_product')
  int? get quantityRemainingProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price_product')
  int? get totalPriceProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_remaining_summary')
  int get quantityRemainingSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price_summary')
  int get totalPriceSummary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingRequestsRecapGlobalCopyWith<PendingRequestsRecapGlobal>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingRequestsRecapGlobalCopyWith<$Res> {
  factory $PendingRequestsRecapGlobalCopyWith(PendingRequestsRecapGlobal value,
          $Res Function(PendingRequestsRecapGlobal) then) =
      _$PendingRequestsRecapGlobalCopyWithImpl<$Res,
          PendingRequestsRecapGlobal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'quantity_remaining') int quantityRemaining,
      @JsonKey(name: 'quantity_stock') int quantityStock,
      @JsonKey(name: 'total_price') int totalPrice,
      @JsonKey(name: 'quantity_remaining_product')
      int? quantityRemainingProduct,
      @JsonKey(name: 'total_price_product') int? totalPriceProduct,
      @JsonKey(name: 'quantity_remaining_summary') int quantityRemainingSummary,
      @JsonKey(name: 'total_price_summary') int totalPriceSummary});
}

/// @nodoc
class _$PendingRequestsRecapGlobalCopyWithImpl<$Res,
        $Val extends PendingRequestsRecapGlobal>
    implements $PendingRequestsRecapGlobalCopyWith<$Res> {
  _$PendingRequestsRecapGlobalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? customerName = null,
    Object? customerId = null,
    Object? quantityRemaining = null,
    Object? quantityStock = null,
    Object? totalPrice = null,
    Object? quantityRemainingProduct = freezed,
    Object? totalPriceProduct = freezed,
    Object? quantityRemainingSummary = null,
    Object? totalPriceSummary = null,
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
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      quantityStock: null == quantityStock
          ? _value.quantityStock
          : quantityStock // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRemainingProduct: freezed == quantityRemainingProduct
          ? _value.quantityRemainingProduct
          : quantityRemainingProduct // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPriceProduct: freezed == totalPriceProduct
          ? _value.totalPriceProduct
          : totalPriceProduct // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityRemainingSummary: null == quantityRemainingSummary
          ? _value.quantityRemainingSummary
          : quantityRemainingSummary // ignore: cast_nullable_to_non_nullable
              as int,
      totalPriceSummary: null == totalPriceSummary
          ? _value.totalPriceSummary
          : totalPriceSummary // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingRequestsRecapGlobalImplCopyWith<$Res>
    implements $PendingRequestsRecapGlobalCopyWith<$Res> {
  factory _$$PendingRequestsRecapGlobalImplCopyWith(
          _$PendingRequestsRecapGlobalImpl value,
          $Res Function(_$PendingRequestsRecapGlobalImpl) then) =
      __$$PendingRequestsRecapGlobalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'quantity_remaining') int quantityRemaining,
      @JsonKey(name: 'quantity_stock') int quantityStock,
      @JsonKey(name: 'total_price') int totalPrice,
      @JsonKey(name: 'quantity_remaining_product')
      int? quantityRemainingProduct,
      @JsonKey(name: 'total_price_product') int? totalPriceProduct,
      @JsonKey(name: 'quantity_remaining_summary') int quantityRemainingSummary,
      @JsonKey(name: 'total_price_summary') int totalPriceSummary});
}

/// @nodoc
class __$$PendingRequestsRecapGlobalImplCopyWithImpl<$Res>
    extends _$PendingRequestsRecapGlobalCopyWithImpl<$Res,
        _$PendingRequestsRecapGlobalImpl>
    implements _$$PendingRequestsRecapGlobalImplCopyWith<$Res> {
  __$$PendingRequestsRecapGlobalImplCopyWithImpl(
      _$PendingRequestsRecapGlobalImpl _value,
      $Res Function(_$PendingRequestsRecapGlobalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? customerName = null,
    Object? customerId = null,
    Object? quantityRemaining = null,
    Object? quantityStock = null,
    Object? totalPrice = null,
    Object? quantityRemainingProduct = freezed,
    Object? totalPriceProduct = freezed,
    Object? quantityRemainingSummary = null,
    Object? totalPriceSummary = null,
  }) {
    return _then(_$PendingRequestsRecapGlobalImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      quantityStock: null == quantityStock
          ? _value.quantityStock
          : quantityStock // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRemainingProduct: freezed == quantityRemainingProduct
          ? _value.quantityRemainingProduct
          : quantityRemainingProduct // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPriceProduct: freezed == totalPriceProduct
          ? _value.totalPriceProduct
          : totalPriceProduct // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityRemainingSummary: null == quantityRemainingSummary
          ? _value.quantityRemainingSummary
          : quantityRemainingSummary // ignore: cast_nullable_to_non_nullable
              as int,
      totalPriceSummary: null == totalPriceSummary
          ? _value.totalPriceSummary
          : totalPriceSummary // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingRequestsRecapGlobalImpl extends _PendingRequestsRecapGlobal {
  const _$PendingRequestsRecapGlobalImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'quantity_remaining') required this.quantityRemaining,
      @JsonKey(name: 'quantity_stock') required this.quantityStock,
      @JsonKey(name: 'total_price') required this.totalPrice,
      @JsonKey(name: 'quantity_remaining_product')
      this.quantityRemainingProduct,
      @JsonKey(name: 'total_price_product') this.totalPriceProduct,
      @JsonKey(name: 'quantity_remaining_summary')
      required this.quantityRemainingSummary,
      @JsonKey(name: 'total_price_summary') required this.totalPriceSummary})
      : super._();

  factory _$PendingRequestsRecapGlobalImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PendingRequestsRecapGlobalImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'quantity_remaining')
  final int quantityRemaining;
  @override
  @JsonKey(name: 'quantity_stock')
  final int quantityStock;
  @override
  @JsonKey(name: 'total_price')
  final int totalPrice;
  @override
  @JsonKey(name: 'quantity_remaining_product')
  final int? quantityRemainingProduct;
  @override
  @JsonKey(name: 'total_price_product')
  final int? totalPriceProduct;
  @override
  @JsonKey(name: 'quantity_remaining_summary')
  final int quantityRemainingSummary;
  @override
  @JsonKey(name: 'total_price_summary')
  final int totalPriceSummary;

  @override
  String toString() {
    return 'PendingRequestsRecapGlobal(productId: $productId, productName: $productName, customerName: $customerName, customerId: $customerId, quantityRemaining: $quantityRemaining, quantityStock: $quantityStock, totalPrice: $totalPrice, quantityRemainingProduct: $quantityRemainingProduct, totalPriceProduct: $totalPriceProduct, quantityRemainingSummary: $quantityRemainingSummary, totalPriceSummary: $totalPriceSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingRequestsRecapGlobalImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.quantityRemaining, quantityRemaining) ||
                other.quantityRemaining == quantityRemaining) &&
            (identical(other.quantityStock, quantityStock) ||
                other.quantityStock == quantityStock) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(
                    other.quantityRemainingProduct, quantityRemainingProduct) ||
                other.quantityRemainingProduct == quantityRemainingProduct) &&
            (identical(other.totalPriceProduct, totalPriceProduct) ||
                other.totalPriceProduct == totalPriceProduct) &&
            (identical(
                    other.quantityRemainingSummary, quantityRemainingSummary) ||
                other.quantityRemainingSummary == quantityRemainingSummary) &&
            (identical(other.totalPriceSummary, totalPriceSummary) ||
                other.totalPriceSummary == totalPriceSummary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productName,
      customerName,
      customerId,
      quantityRemaining,
      quantityStock,
      totalPrice,
      quantityRemainingProduct,
      totalPriceProduct,
      quantityRemainingSummary,
      totalPriceSummary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingRequestsRecapGlobalImplCopyWith<_$PendingRequestsRecapGlobalImpl>
      get copyWith => __$$PendingRequestsRecapGlobalImplCopyWithImpl<
          _$PendingRequestsRecapGlobalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingRequestsRecapGlobalImplToJson(
      this,
    );
  }
}

abstract class _PendingRequestsRecapGlobal extends PendingRequestsRecapGlobal {
  const factory _PendingRequestsRecapGlobal(
      {@JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'quantity_remaining') required final int quantityRemaining,
      @JsonKey(name: 'quantity_stock') required final int quantityStock,
      @JsonKey(name: 'total_price') required final int totalPrice,
      @JsonKey(name: 'quantity_remaining_product')
      final int? quantityRemainingProduct,
      @JsonKey(name: 'total_price_product') final int? totalPriceProduct,
      @JsonKey(name: 'quantity_remaining_summary')
      required final int quantityRemainingSummary,
      @JsonKey(name: 'total_price_summary')
      required final int totalPriceSummary}) = _$PendingRequestsRecapGlobalImpl;
  const _PendingRequestsRecapGlobal._() : super._();

  factory _PendingRequestsRecapGlobal.fromJson(Map<String, dynamic> json) =
      _$PendingRequestsRecapGlobalImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'quantity_remaining')
  int get quantityRemaining;
  @override
  @JsonKey(name: 'quantity_stock')
  int get quantityStock;
  @override
  @JsonKey(name: 'total_price')
  int get totalPrice;
  @override
  @JsonKey(name: 'quantity_remaining_product')
  int? get quantityRemainingProduct;
  @override
  @JsonKey(name: 'total_price_product')
  int? get totalPriceProduct;
  @override
  @JsonKey(name: 'quantity_remaining_summary')
  int get quantityRemainingSummary;
  @override
  @JsonKey(name: 'total_price_summary')
  int get totalPriceSummary;
  @override
  @JsonKey(ignore: true)
  _$$PendingRequestsRecapGlobalImplCopyWith<_$PendingRequestsRecapGlobalImpl>
      get copyWith => throw _privateConstructorUsedError;
}
