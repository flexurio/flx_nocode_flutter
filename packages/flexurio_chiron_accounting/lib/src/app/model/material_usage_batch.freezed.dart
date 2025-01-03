// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_usage_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialUsageBatch _$MaterialUsageBatchFromJson(Map<String, dynamic> json) {
  return _MaterialUsageBatch.fromJson(json);
}

/// @nodoc
mixin _$MaterialUsageBatch {
  @JsonKey(name: 'batch_no')
  String? get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group_id')
  String? get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_id')
  String? get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String? get materialName => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double? get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price_summary')
  double? get totalPriceSummary => throw _privateConstructorUsedError;

  /// Serializes this MaterialUsageBatch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialUsageBatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialUsageBatchCopyWith<MaterialUsageBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialUsageBatchCopyWith<$Res> {
  factory $MaterialUsageBatchCopyWith(
          MaterialUsageBatch value, $Res Function(MaterialUsageBatch) then) =
      _$MaterialUsageBatchCopyWithImpl<$Res, MaterialUsageBatch>;
  @useResult
  $Res call(
      {@JsonKey(name: 'batch_no') String? batchNo,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'material_group_id') String? materialGroupId,
      @JsonKey(name: 'material_id') String? materialId,
      @JsonKey(name: 'material_name') String? materialName,
      double? quantity,
      String? unit,
      int? price,
      @JsonKey(name: 'total_price') double? totalPrice,
      @JsonKey(name: 'total_price_summary') double? totalPriceSummary});
}

/// @nodoc
class _$MaterialUsageBatchCopyWithImpl<$Res, $Val extends MaterialUsageBatch>
    implements $MaterialUsageBatchCopyWith<$Res> {
  _$MaterialUsageBatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialUsageBatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchNo = freezed,
    Object? productName = freezed,
    Object? materialGroupId = freezed,
    Object? materialId = freezed,
    Object? materialName = freezed,
    Object? quantity = freezed,
    Object? unit = freezed,
    Object? price = freezed,
    Object? totalPrice = freezed,
    Object? totalPriceSummary = freezed,
  }) {
    return _then(_value.copyWith(
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      materialGroupId: freezed == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      materialId: freezed == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String?,
      materialName: freezed == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPriceSummary: freezed == totalPriceSummary
          ? _value.totalPriceSummary
          : totalPriceSummary // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialUsageBatchImplCopyWith<$Res>
    implements $MaterialUsageBatchCopyWith<$Res> {
  factory _$$MaterialUsageBatchImplCopyWith(_$MaterialUsageBatchImpl value,
          $Res Function(_$MaterialUsageBatchImpl) then) =
      __$$MaterialUsageBatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'batch_no') String? batchNo,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'material_group_id') String? materialGroupId,
      @JsonKey(name: 'material_id') String? materialId,
      @JsonKey(name: 'material_name') String? materialName,
      double? quantity,
      String? unit,
      int? price,
      @JsonKey(name: 'total_price') double? totalPrice,
      @JsonKey(name: 'total_price_summary') double? totalPriceSummary});
}

/// @nodoc
class __$$MaterialUsageBatchImplCopyWithImpl<$Res>
    extends _$MaterialUsageBatchCopyWithImpl<$Res, _$MaterialUsageBatchImpl>
    implements _$$MaterialUsageBatchImplCopyWith<$Res> {
  __$$MaterialUsageBatchImplCopyWithImpl(_$MaterialUsageBatchImpl _value,
      $Res Function(_$MaterialUsageBatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialUsageBatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchNo = freezed,
    Object? productName = freezed,
    Object? materialGroupId = freezed,
    Object? materialId = freezed,
    Object? materialName = freezed,
    Object? quantity = freezed,
    Object? unit = freezed,
    Object? price = freezed,
    Object? totalPrice = freezed,
    Object? totalPriceSummary = freezed,
  }) {
    return _then(_$MaterialUsageBatchImpl(
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      materialGroupId: freezed == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      materialId: freezed == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String?,
      materialName: freezed == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPriceSummary: freezed == totalPriceSummary
          ? _value.totalPriceSummary
          : totalPriceSummary // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialUsageBatchImpl extends _MaterialUsageBatch {
  const _$MaterialUsageBatchImpl(
      {@JsonKey(name: 'batch_no') this.batchNo,
      @JsonKey(name: 'product_name') this.productName,
      @JsonKey(name: 'material_group_id') this.materialGroupId,
      @JsonKey(name: 'material_id') this.materialId,
      @JsonKey(name: 'material_name') this.materialName,
      this.quantity,
      this.unit,
      this.price,
      @JsonKey(name: 'total_price') this.totalPrice,
      @JsonKey(name: 'total_price_summary') this.totalPriceSummary})
      : super._();

  factory _$MaterialUsageBatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialUsageBatchImplFromJson(json);

  @override
  @JsonKey(name: 'batch_no')
  final String? batchNo;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  @JsonKey(name: 'material_group_id')
  final String? materialGroupId;
  @override
  @JsonKey(name: 'material_id')
  final String? materialId;
  @override
  @JsonKey(name: 'material_name')
  final String? materialName;
  @override
  final double? quantity;
  @override
  final String? unit;
  @override
  final int? price;
  @override
  @JsonKey(name: 'total_price')
  final double? totalPrice;
  @override
  @JsonKey(name: 'total_price_summary')
  final double? totalPriceSummary;

  @override
  String toString() {
    return 'MaterialUsageBatch(batchNo: $batchNo, productName: $productName, materialGroupId: $materialGroupId, materialId: $materialId, materialName: $materialName, quantity: $quantity, unit: $unit, price: $price, totalPrice: $totalPrice, totalPriceSummary: $totalPriceSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialUsageBatchImpl &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalPriceSummary, totalPriceSummary) ||
                other.totalPriceSummary == totalPriceSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      batchNo,
      productName,
      materialGroupId,
      materialId,
      materialName,
      quantity,
      unit,
      price,
      totalPrice,
      totalPriceSummary);

  /// Create a copy of MaterialUsageBatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialUsageBatchImplCopyWith<_$MaterialUsageBatchImpl> get copyWith =>
      __$$MaterialUsageBatchImplCopyWithImpl<_$MaterialUsageBatchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialUsageBatchImplToJson(
      this,
    );
  }
}

abstract class _MaterialUsageBatch extends MaterialUsageBatch {
  const factory _MaterialUsageBatch(
      {@JsonKey(name: 'batch_no') final String? batchNo,
      @JsonKey(name: 'product_name') final String? productName,
      @JsonKey(name: 'material_group_id') final String? materialGroupId,
      @JsonKey(name: 'material_id') final String? materialId,
      @JsonKey(name: 'material_name') final String? materialName,
      final double? quantity,
      final String? unit,
      final int? price,
      @JsonKey(name: 'total_price') final double? totalPrice,
      @JsonKey(name: 'total_price_summary')
      final double? totalPriceSummary}) = _$MaterialUsageBatchImpl;
  const _MaterialUsageBatch._() : super._();

  factory _MaterialUsageBatch.fromJson(Map<String, dynamic> json) =
      _$MaterialUsageBatchImpl.fromJson;

  @override
  @JsonKey(name: 'batch_no')
  String? get batchNo;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  @JsonKey(name: 'material_group_id')
  String? get materialGroupId;
  @override
  @JsonKey(name: 'material_id')
  String? get materialId;
  @override
  @JsonKey(name: 'material_name')
  String? get materialName;
  @override
  double? get quantity;
  @override
  String? get unit;
  @override
  int? get price;
  @override
  @JsonKey(name: 'total_price')
  double? get totalPrice;
  @override
  @JsonKey(name: 'total_price_summary')
  double? get totalPriceSummary;

  /// Create a copy of MaterialUsageBatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialUsageBatchImplCopyWith<_$MaterialUsageBatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
