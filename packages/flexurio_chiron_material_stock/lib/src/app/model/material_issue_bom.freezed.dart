// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_issue_bom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialIssueBom _$MaterialIssueBomFromJson(Map<String, dynamic> json) {
  return _MaterialIssueBom.fromJson(json);
}

/// @nodoc
mixin _$MaterialIssueBom {
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group_id')
  String get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'scale')
  String get scale => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_material_issue')
  int get quantityMaterialIssue => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_formulation')
  int get quantityFormulation => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_material_return')
  int get quantityMaterialReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialIssueBomCopyWith<MaterialIssueBom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialIssueBomCopyWith<$Res> {
  factory $MaterialIssueBomCopyWith(
          MaterialIssueBom value, $Res Function(MaterialIssueBom) then) =
      _$MaterialIssueBomCopyWithImpl<$Res, MaterialIssueBom>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'scale') String scale,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'quantity_material_issue') int quantityMaterialIssue,
      @JsonKey(name: 'quantity_formulation') int quantityFormulation,
      @JsonKey(name: 'quantity_material_return') int quantityMaterialReturn,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt});
}

/// @nodoc
class _$MaterialIssueBomCopyWithImpl<$Res, $Val extends MaterialIssueBom>
    implements $MaterialIssueBomCopyWith<$Res> {
  _$MaterialIssueBomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialName = null,
    Object? productId = null,
    Object? productName = null,
    Object? materialGroupId = null,
    Object? batchNoId = null,
    Object? scale = null,
    Object? unitId = null,
    Object? quantityMaterialIssue = null,
    Object? quantityFormulation = null,
    Object? quantityMaterialReturn = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityMaterialIssue: null == quantityMaterialIssue
          ? _value.quantityMaterialIssue
          : quantityMaterialIssue // ignore: cast_nullable_to_non_nullable
              as int,
      quantityFormulation: null == quantityFormulation
          ? _value.quantityFormulation
          : quantityFormulation // ignore: cast_nullable_to_non_nullable
              as int,
      quantityMaterialReturn: null == quantityMaterialReturn
          ? _value.quantityMaterialReturn
          : quantityMaterialReturn // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialIssueBomImplCopyWith<$Res>
    implements $MaterialIssueBomCopyWith<$Res> {
  factory _$$MaterialIssueBomImplCopyWith(_$MaterialIssueBomImpl value,
          $Res Function(_$MaterialIssueBomImpl) then) =
      __$$MaterialIssueBomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'scale') String scale,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'quantity_material_issue') int quantityMaterialIssue,
      @JsonKey(name: 'quantity_formulation') int quantityFormulation,
      @JsonKey(name: 'quantity_material_return') int quantityMaterialReturn,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt});
}

/// @nodoc
class __$$MaterialIssueBomImplCopyWithImpl<$Res>
    extends _$MaterialIssueBomCopyWithImpl<$Res, _$MaterialIssueBomImpl>
    implements _$$MaterialIssueBomImplCopyWith<$Res> {
  __$$MaterialIssueBomImplCopyWithImpl(_$MaterialIssueBomImpl _value,
      $Res Function(_$MaterialIssueBomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialName = null,
    Object? productId = null,
    Object? productName = null,
    Object? materialGroupId = null,
    Object? batchNoId = null,
    Object? scale = null,
    Object? unitId = null,
    Object? quantityMaterialIssue = null,
    Object? quantityFormulation = null,
    Object? quantityMaterialReturn = null,
    Object? createdAt = null,
  }) {
    return _then(_$MaterialIssueBomImpl(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityMaterialIssue: null == quantityMaterialIssue
          ? _value.quantityMaterialIssue
          : quantityMaterialIssue // ignore: cast_nullable_to_non_nullable
              as int,
      quantityFormulation: null == quantityFormulation
          ? _value.quantityFormulation
          : quantityFormulation // ignore: cast_nullable_to_non_nullable
              as int,
      quantityMaterialReturn: null == quantityMaterialReturn
          ? _value.quantityMaterialReturn
          : quantityMaterialReturn // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIssueBomImpl extends _MaterialIssueBom {
  _$MaterialIssueBomImpl(
      {@JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'material_group_id') required this.materialGroupId,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'scale') required this.scale,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'quantity_material_issue')
      required this.quantityMaterialIssue,
      @JsonKey(name: 'quantity_formulation') required this.quantityFormulation,
      @JsonKey(name: 'quantity_material_return')
      required this.quantityMaterialReturn,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt})
      : super._();

  factory _$MaterialIssueBomImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialIssueBomImplFromJson(json);

  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'material_group_id')
  final String materialGroupId;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'scale')
  final String scale;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'quantity_material_issue')
  final int quantityMaterialIssue;
  @override
  @JsonKey(name: 'quantity_formulation')
  final int quantityFormulation;
  @override
  @JsonKey(name: 'quantity_material_return')
  final int quantityMaterialReturn;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;

  @override
  String toString() {
    return 'MaterialIssueBom(materialId: $materialId, materialName: $materialName, productId: $productId, productName: $productName, materialGroupId: $materialGroupId, batchNoId: $batchNoId, scale: $scale, unitId: $unitId, quantityMaterialIssue: $quantityMaterialIssue, quantityFormulation: $quantityFormulation, quantityMaterialReturn: $quantityMaterialReturn, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIssueBomImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.quantityMaterialIssue, quantityMaterialIssue) ||
                other.quantityMaterialIssue == quantityMaterialIssue) &&
            (identical(other.quantityFormulation, quantityFormulation) ||
                other.quantityFormulation == quantityFormulation) &&
            (identical(other.quantityMaterialReturn, quantityMaterialReturn) ||
                other.quantityMaterialReturn == quantityMaterialReturn) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialId,
      materialName,
      productId,
      productName,
      materialGroupId,
      batchNoId,
      scale,
      unitId,
      quantityMaterialIssue,
      quantityFormulation,
      quantityMaterialReturn,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIssueBomImplCopyWith<_$MaterialIssueBomImpl> get copyWith =>
      __$$MaterialIssueBomImplCopyWithImpl<_$MaterialIssueBomImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIssueBomImplToJson(
      this,
    );
  }
}

abstract class _MaterialIssueBom extends MaterialIssueBom {
  factory _MaterialIssueBom(
      {@JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_name') required final String materialName,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'material_group_id') required final String materialGroupId,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'scale') required final String scale,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'quantity_material_issue')
      required final int quantityMaterialIssue,
      @JsonKey(name: 'quantity_formulation')
      required final int quantityFormulation,
      @JsonKey(name: 'quantity_material_return')
      required final int quantityMaterialReturn,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt}) = _$MaterialIssueBomImpl;
  _MaterialIssueBom._() : super._();

  factory _MaterialIssueBom.fromJson(Map<String, dynamic> json) =
      _$MaterialIssueBomImpl.fromJson;

  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'material_group_id')
  String get materialGroupId;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'scale')
  String get scale;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'quantity_material_issue')
  int get quantityMaterialIssue;
  @override
  @JsonKey(name: 'quantity_formulation')
  int get quantityFormulation;
  @override
  @JsonKey(name: 'quantity_material_return')
  int get quantityMaterialReturn;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MaterialIssueBomImplCopyWith<_$MaterialIssueBomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
