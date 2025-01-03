// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_usage_batch_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialUsageBatchDetail _$MaterialUsageBatchDetailFromJson(
    Map<String, dynamic> json) {
  return _MaterialUsageBatchDetail.fromJson(json);
}

/// @nodoc
mixin _$MaterialUsageBatchDetail {
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String? get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group_id')
  String get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type_name')
  String get transactionTypeName => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price_summary')
  double get totalPriceSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price_material_group')
  double get totalPriceMaterialGroup => throw _privateConstructorUsedError;

  /// Serializes this MaterialUsageBatchDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialUsageBatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialUsageBatchDetailCopyWith<MaterialUsageBatchDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialUsageBatchDetailCopyWith<$Res> {
  factory $MaterialUsageBatchDetailCopyWith(MaterialUsageBatchDetail value,
          $Res Function(MaterialUsageBatchDetail) then) =
      _$MaterialUsageBatchDetailCopyWithImpl<$Res, MaterialUsageBatchDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'batch_no') String? batchNo,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'transaction_type_name') String transactionTypeName,
      double quantity,
      String? unit,
      double price,
      @JsonKey(name: 'total_price') double totalPrice,
      @JsonKey(name: 'total_price_summary') double totalPriceSummary,
      @JsonKey(name: 'total_price_material_group')
      double totalPriceMaterialGroup});
}

/// @nodoc
class _$MaterialUsageBatchDetailCopyWithImpl<$Res,
        $Val extends MaterialUsageBatchDetail>
    implements $MaterialUsageBatchDetailCopyWith<$Res> {
  _$MaterialUsageBatchDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialUsageBatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = freezed,
    Object? batchNo = freezed,
    Object? materialGroupId = null,
    Object? transactionNo = null,
    Object? materialName = null,
    Object? transactionTypeName = null,
    Object? quantity = null,
    Object? unit = freezed,
    Object? price = null,
    Object? totalPrice = null,
    Object? totalPriceSummary = null,
    Object? totalPriceMaterialGroup = null,
  }) {
    return _then(_value.copyWith(
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTypeName: null == transactionTypeName
          ? _value.transactionTypeName
          : transactionTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPriceSummary: null == totalPriceSummary
          ? _value.totalPriceSummary
          : totalPriceSummary // ignore: cast_nullable_to_non_nullable
              as double,
      totalPriceMaterialGroup: null == totalPriceMaterialGroup
          ? _value.totalPriceMaterialGroup
          : totalPriceMaterialGroup // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialUsageBatchDetailImplCopyWith<$Res>
    implements $MaterialUsageBatchDetailCopyWith<$Res> {
  factory _$$MaterialUsageBatchDetailImplCopyWith(
          _$MaterialUsageBatchDetailImpl value,
          $Res Function(_$MaterialUsageBatchDetailImpl) then) =
      __$$MaterialUsageBatchDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'batch_no') String? batchNo,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'transaction_type_name') String transactionTypeName,
      double quantity,
      String? unit,
      double price,
      @JsonKey(name: 'total_price') double totalPrice,
      @JsonKey(name: 'total_price_summary') double totalPriceSummary,
      @JsonKey(name: 'total_price_material_group')
      double totalPriceMaterialGroup});
}

/// @nodoc
class __$$MaterialUsageBatchDetailImplCopyWithImpl<$Res>
    extends _$MaterialUsageBatchDetailCopyWithImpl<$Res,
        _$MaterialUsageBatchDetailImpl>
    implements _$$MaterialUsageBatchDetailImplCopyWith<$Res> {
  __$$MaterialUsageBatchDetailImplCopyWithImpl(
      _$MaterialUsageBatchDetailImpl _value,
      $Res Function(_$MaterialUsageBatchDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialUsageBatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = freezed,
    Object? batchNo = freezed,
    Object? materialGroupId = null,
    Object? transactionNo = null,
    Object? materialName = null,
    Object? transactionTypeName = null,
    Object? quantity = null,
    Object? unit = freezed,
    Object? price = null,
    Object? totalPrice = null,
    Object? totalPriceSummary = null,
    Object? totalPriceMaterialGroup = null,
  }) {
    return _then(_$MaterialUsageBatchDetailImpl(
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTypeName: null == transactionTypeName
          ? _value.transactionTypeName
          : transactionTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPriceSummary: null == totalPriceSummary
          ? _value.totalPriceSummary
          : totalPriceSummary // ignore: cast_nullable_to_non_nullable
              as double,
      totalPriceMaterialGroup: null == totalPriceMaterialGroup
          ? _value.totalPriceMaterialGroup
          : totalPriceMaterialGroup // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialUsageBatchDetailImpl extends _MaterialUsageBatchDetail {
  const _$MaterialUsageBatchDetailImpl(
      {@JsonKey(name: 'product_name') this.productName,
      @JsonKey(name: 'batch_no') this.batchNo,
      @JsonKey(name: 'material_group_id') required this.materialGroupId,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'transaction_type_name') required this.transactionTypeName,
      required this.quantity,
      this.unit,
      required this.price,
      @JsonKey(name: 'total_price') required this.totalPrice,
      @JsonKey(name: 'total_price_summary') required this.totalPriceSummary,
      @JsonKey(name: 'total_price_material_group')
      required this.totalPriceMaterialGroup})
      : super._();

  factory _$MaterialUsageBatchDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialUsageBatchDetailImplFromJson(json);

  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  @JsonKey(name: 'batch_no')
  final String? batchNo;
  @override
  @JsonKey(name: 'material_group_id')
  final String materialGroupId;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'transaction_type_name')
  final String transactionTypeName;
  @override
  final double quantity;
  @override
  final String? unit;
  @override
  final double price;
  @override
  @JsonKey(name: 'total_price')
  final double totalPrice;
  @override
  @JsonKey(name: 'total_price_summary')
  final double totalPriceSummary;
  @override
  @JsonKey(name: 'total_price_material_group')
  final double totalPriceMaterialGroup;

  @override
  String toString() {
    return 'MaterialUsageBatchDetail(productName: $productName, batchNo: $batchNo, materialGroupId: $materialGroupId, transactionNo: $transactionNo, materialName: $materialName, transactionTypeName: $transactionTypeName, quantity: $quantity, unit: $unit, price: $price, totalPrice: $totalPrice, totalPriceSummary: $totalPriceSummary, totalPriceMaterialGroup: $totalPriceMaterialGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialUsageBatchDetailImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.transactionTypeName, transactionTypeName) ||
                other.transactionTypeName == transactionTypeName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalPriceSummary, totalPriceSummary) ||
                other.totalPriceSummary == totalPriceSummary) &&
            (identical(
                    other.totalPriceMaterialGroup, totalPriceMaterialGroup) ||
                other.totalPriceMaterialGroup == totalPriceMaterialGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productName,
      batchNo,
      materialGroupId,
      transactionNo,
      materialName,
      transactionTypeName,
      quantity,
      unit,
      price,
      totalPrice,
      totalPriceSummary,
      totalPriceMaterialGroup);

  /// Create a copy of MaterialUsageBatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialUsageBatchDetailImplCopyWith<_$MaterialUsageBatchDetailImpl>
      get copyWith => __$$MaterialUsageBatchDetailImplCopyWithImpl<
          _$MaterialUsageBatchDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialUsageBatchDetailImplToJson(
      this,
    );
  }
}

abstract class _MaterialUsageBatchDetail extends MaterialUsageBatchDetail {
  const factory _MaterialUsageBatchDetail(
      {@JsonKey(name: 'product_name') final String? productName,
      @JsonKey(name: 'batch_no') final String? batchNo,
      @JsonKey(name: 'material_group_id') required final String materialGroupId,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'material_name') required final String materialName,
      @JsonKey(name: 'transaction_type_name')
      required final String transactionTypeName,
      required final double quantity,
      final String? unit,
      required final double price,
      @JsonKey(name: 'total_price') required final double totalPrice,
      @JsonKey(name: 'total_price_summary')
      required final double totalPriceSummary,
      @JsonKey(name: 'total_price_material_group')
      required final double
          totalPriceMaterialGroup}) = _$MaterialUsageBatchDetailImpl;
  const _MaterialUsageBatchDetail._() : super._();

  factory _MaterialUsageBatchDetail.fromJson(Map<String, dynamic> json) =
      _$MaterialUsageBatchDetailImpl.fromJson;

  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  @JsonKey(name: 'batch_no')
  String? get batchNo;
  @override
  @JsonKey(name: 'material_group_id')
  String get materialGroupId;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'transaction_type_name')
  String get transactionTypeName;
  @override
  double get quantity;
  @override
  String? get unit;
  @override
  double get price;
  @override
  @JsonKey(name: 'total_price')
  double get totalPrice;
  @override
  @JsonKey(name: 'total_price_summary')
  double get totalPriceSummary;
  @override
  @JsonKey(name: 'total_price_material_group')
  double get totalPriceMaterialGroup;

  /// Create a copy of MaterialUsageBatchDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialUsageBatchDetailImplCopyWith<_$MaterialUsageBatchDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
