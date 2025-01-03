// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_issue_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductIssueGlobal _$ProductIssueGlobalFromJson(Map<String, dynamic> json) {
  return _ProductIssueGlobal.fromJson(json);
}

/// @nodoc
mixin _$ProductIssueGlobal {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  String get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;

  /// Serializes this ProductIssueGlobal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductIssueGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductIssueGlobalCopyWith<ProductIssueGlobal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductIssueGlobalCopyWith<$Res> {
  factory $ProductIssueGlobalCopyWith(
          ProductIssueGlobal value, $Res Function(ProductIssueGlobal) then) =
      _$ProductIssueGlobalCopyWithImpl<$Res, ProductIssueGlobal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      String warehouse,
      @JsonKey(name: 'unit_id') String unitId,
      int qty});
}

/// @nodoc
class _$ProductIssueGlobalCopyWithImpl<$Res, $Val extends ProductIssueGlobal>
    implements $ProductIssueGlobalCopyWith<$Res> {
  _$ProductIssueGlobalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductIssueGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? warehouse = null,
    Object? unitId = null,
    Object? qty = null,
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
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductIssueGlobalImplCopyWith<$Res>
    implements $ProductIssueGlobalCopyWith<$Res> {
  factory _$$ProductIssueGlobalImplCopyWith(_$ProductIssueGlobalImpl value,
          $Res Function(_$ProductIssueGlobalImpl) then) =
      __$$ProductIssueGlobalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      String warehouse,
      @JsonKey(name: 'unit_id') String unitId,
      int qty});
}

/// @nodoc
class __$$ProductIssueGlobalImplCopyWithImpl<$Res>
    extends _$ProductIssueGlobalCopyWithImpl<$Res, _$ProductIssueGlobalImpl>
    implements _$$ProductIssueGlobalImplCopyWith<$Res> {
  __$$ProductIssueGlobalImplCopyWithImpl(_$ProductIssueGlobalImpl _value,
      $Res Function(_$ProductIssueGlobalImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssueGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? warehouse = null,
    Object? unitId = null,
    Object? qty = null,
  }) {
    return _then(_$ProductIssueGlobalImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductIssueGlobalImpl extends _ProductIssueGlobal {
  _$ProductIssueGlobalImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      required this.warehouse,
      @JsonKey(name: 'unit_id') required this.unitId,
      required this.qty})
      : super._();

  factory _$ProductIssueGlobalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductIssueGlobalImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  final String warehouse;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  final int qty;

  @override
  String toString() {
    return 'ProductIssueGlobal(productId: $productId, productName: $productName, warehouse: $warehouse, unitId: $unitId, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductIssueGlobalImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, productName, warehouse, unitId, qty);

  /// Create a copy of ProductIssueGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductIssueGlobalImplCopyWith<_$ProductIssueGlobalImpl> get copyWith =>
      __$$ProductIssueGlobalImplCopyWithImpl<_$ProductIssueGlobalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductIssueGlobalImplToJson(
      this,
    );
  }
}

abstract class _ProductIssueGlobal extends ProductIssueGlobal {
  factory _ProductIssueGlobal(
      {@JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      required final String warehouse,
      @JsonKey(name: 'unit_id') required final String unitId,
      required final int qty}) = _$ProductIssueGlobalImpl;
  _ProductIssueGlobal._() : super._();

  factory _ProductIssueGlobal.fromJson(Map<String, dynamic> json) =
      _$ProductIssueGlobalImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  String get warehouse;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  int get qty;

  /// Create a copy of ProductIssueGlobal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductIssueGlobalImplCopyWith<_$ProductIssueGlobalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
