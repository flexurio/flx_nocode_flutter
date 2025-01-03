// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_usage_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialUsageDetail _$MaterialUsageDetailFromJson(Map<String, dynamic> json) {
  return _MaterialUsageDetail.fromJson(json);
}

/// @nodoc
mixin _$MaterialUsageDetail {
  @JsonKey(name: 'material_issue_id')
  String get materialIssueId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'mi_type')
  String get miType => throw _privateConstructorUsedError;
  @JsonKey(name: 'mi_type_name')
  String get miTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_summary')
  double get subtotalSummary => throw _privateConstructorUsedError;

  /// Serializes this MaterialUsageDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialUsageDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialUsageDetailCopyWith<MaterialUsageDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialUsageDetailCopyWith<$Res> {
  factory $MaterialUsageDetailCopyWith(
          MaterialUsageDetail value, $Res Function(MaterialUsageDetail) then) =
      _$MaterialUsageDetailCopyWithImpl<$Res, MaterialUsageDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_issue_id') String materialIssueId,
      String description,
      @JsonKey(name: 'material_name') String materialName,
      int quantity,
      int price,
      @JsonKey(name: 'total_price') int totalPrice,
      @JsonKey(name: 'mi_type') String miType,
      @JsonKey(name: 'mi_type_name') String miTypeName,
      @JsonKey(name: 'subtotal_summary') double subtotalSummary});
}

/// @nodoc
class _$MaterialUsageDetailCopyWithImpl<$Res, $Val extends MaterialUsageDetail>
    implements $MaterialUsageDetailCopyWith<$Res> {
  _$MaterialUsageDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialUsageDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialIssueId = null,
    Object? description = null,
    Object? materialName = null,
    Object? quantity = null,
    Object? price = null,
    Object? totalPrice = null,
    Object? miType = null,
    Object? miTypeName = null,
    Object? subtotalSummary = null,
  }) {
    return _then(_value.copyWith(
      materialIssueId: null == materialIssueId
          ? _value.materialIssueId
          : materialIssueId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      miType: null == miType
          ? _value.miType
          : miType // ignore: cast_nullable_to_non_nullable
              as String,
      miTypeName: null == miTypeName
          ? _value.miTypeName
          : miTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      subtotalSummary: null == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialUsageDetailImplCopyWith<$Res>
    implements $MaterialUsageDetailCopyWith<$Res> {
  factory _$$MaterialUsageDetailImplCopyWith(_$MaterialUsageDetailImpl value,
          $Res Function(_$MaterialUsageDetailImpl) then) =
      __$$MaterialUsageDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_issue_id') String materialIssueId,
      String description,
      @JsonKey(name: 'material_name') String materialName,
      int quantity,
      int price,
      @JsonKey(name: 'total_price') int totalPrice,
      @JsonKey(name: 'mi_type') String miType,
      @JsonKey(name: 'mi_type_name') String miTypeName,
      @JsonKey(name: 'subtotal_summary') double subtotalSummary});
}

/// @nodoc
class __$$MaterialUsageDetailImplCopyWithImpl<$Res>
    extends _$MaterialUsageDetailCopyWithImpl<$Res, _$MaterialUsageDetailImpl>
    implements _$$MaterialUsageDetailImplCopyWith<$Res> {
  __$$MaterialUsageDetailImplCopyWithImpl(_$MaterialUsageDetailImpl _value,
      $Res Function(_$MaterialUsageDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialUsageDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialIssueId = null,
    Object? description = null,
    Object? materialName = null,
    Object? quantity = null,
    Object? price = null,
    Object? totalPrice = null,
    Object? miType = null,
    Object? miTypeName = null,
    Object? subtotalSummary = null,
  }) {
    return _then(_$MaterialUsageDetailImpl(
      materialIssueId: null == materialIssueId
          ? _value.materialIssueId
          : materialIssueId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      miType: null == miType
          ? _value.miType
          : miType // ignore: cast_nullable_to_non_nullable
              as String,
      miTypeName: null == miTypeName
          ? _value.miTypeName
          : miTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      subtotalSummary: null == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialUsageDetailImpl extends _MaterialUsageDetail {
  const _$MaterialUsageDetailImpl(
      {@JsonKey(name: 'material_issue_id') required this.materialIssueId,
      required this.description,
      @JsonKey(name: 'material_name') required this.materialName,
      required this.quantity,
      required this.price,
      @JsonKey(name: 'total_price') required this.totalPrice,
      @JsonKey(name: 'mi_type') required this.miType,
      @JsonKey(name: 'mi_type_name') required this.miTypeName,
      @JsonKey(name: 'subtotal_summary') required this.subtotalSummary})
      : super._();

  factory _$MaterialUsageDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialUsageDetailImplFromJson(json);

  @override
  @JsonKey(name: 'material_issue_id')
  final String materialIssueId;
  @override
  final String description;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  final int quantity;
  @override
  final int price;
  @override
  @JsonKey(name: 'total_price')
  final int totalPrice;
  @override
  @JsonKey(name: 'mi_type')
  final String miType;
  @override
  @JsonKey(name: 'mi_type_name')
  final String miTypeName;
  @override
  @JsonKey(name: 'subtotal_summary')
  final double subtotalSummary;

  @override
  String toString() {
    return 'MaterialUsageDetail(materialIssueId: $materialIssueId, description: $description, materialName: $materialName, quantity: $quantity, price: $price, totalPrice: $totalPrice, miType: $miType, miTypeName: $miTypeName, subtotalSummary: $subtotalSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialUsageDetailImpl &&
            (identical(other.materialIssueId, materialIssueId) ||
                other.materialIssueId == materialIssueId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.miType, miType) || other.miType == miType) &&
            (identical(other.miTypeName, miTypeName) ||
                other.miTypeName == miTypeName) &&
            (identical(other.subtotalSummary, subtotalSummary) ||
                other.subtotalSummary == subtotalSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialIssueId,
      description,
      materialName,
      quantity,
      price,
      totalPrice,
      miType,
      miTypeName,
      subtotalSummary);

  /// Create a copy of MaterialUsageDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialUsageDetailImplCopyWith<_$MaterialUsageDetailImpl> get copyWith =>
      __$$MaterialUsageDetailImplCopyWithImpl<_$MaterialUsageDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialUsageDetailImplToJson(
      this,
    );
  }
}

abstract class _MaterialUsageDetail extends MaterialUsageDetail {
  const factory _MaterialUsageDetail(
      {@JsonKey(name: 'material_issue_id')
      required final String materialIssueId,
      required final String description,
      @JsonKey(name: 'material_name') required final String materialName,
      required final int quantity,
      required final int price,
      @JsonKey(name: 'total_price') required final int totalPrice,
      @JsonKey(name: 'mi_type') required final String miType,
      @JsonKey(name: 'mi_type_name') required final String miTypeName,
      @JsonKey(name: 'subtotal_summary')
      required final double subtotalSummary}) = _$MaterialUsageDetailImpl;
  const _MaterialUsageDetail._() : super._();

  factory _MaterialUsageDetail.fromJson(Map<String, dynamic> json) =
      _$MaterialUsageDetailImpl.fromJson;

  @override
  @JsonKey(name: 'material_issue_id')
  String get materialIssueId;
  @override
  String get description;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  int get quantity;
  @override
  int get price;
  @override
  @JsonKey(name: 'total_price')
  int get totalPrice;
  @override
  @JsonKey(name: 'mi_type')
  String get miType;
  @override
  @JsonKey(name: 'mi_type_name')
  String get miTypeName;
  @override
  @JsonKey(name: 'subtotal_summary')
  double get subtotalSummary;

  /// Create a copy of MaterialUsageDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialUsageDetailImplCopyWith<_$MaterialUsageDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
