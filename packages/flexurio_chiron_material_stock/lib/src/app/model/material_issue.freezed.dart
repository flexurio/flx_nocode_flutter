// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_issue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialIssue _$MaterialIssueFromJson(Map<String, dynamic> json) {
  return _MaterialIssue.fromJson(json);
}

/// @nodoc
mixin _$MaterialIssue {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'mi_type', fromJson: TransactionType.fromJson)
  TransactionType get miType => throw _privateConstructorUsedError;
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_expired_date', fromJson: isoDateToDateTime)
  DateTime? get productionExpiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'mi_date', fromJson: isoDateToDateTime)
  DateTime get miDate => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialIssueCopyWith<MaterialIssue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialIssueCopyWith<$Res> {
  factory $MaterialIssueCopyWith(
          MaterialIssue value, $Res Function(MaterialIssue) then) =
      _$MaterialIssueCopyWithImpl<$Res, MaterialIssue>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'mi_type', fromJson: TransactionType.fromJson)
      TransactionType miType,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
      ProductionOrder batch,
      @JsonKey(name: 'product_expired_date', fromJson: isoDateToDateTime)
      DateTime? productionExpiredDate,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(name: 'mi_date', fromJson: isoDateToDateTime) DateTime miDate,
      String remarks});

  $TransactionTypeCopyWith<$Res> get miType;
  $DepartmentCopyWith<$Res> get department;
  $ProductCopyWith<$Res> get product;
  $ProductionOrderCopyWith<$Res> get batch;
  $MaterialGroupCopyWith<$Res> get materialGroup;
}

/// @nodoc
class _$MaterialIssueCopyWithImpl<$Res, $Val extends MaterialIssue>
    implements $MaterialIssueCopyWith<$Res> {
  _$MaterialIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? miType = null,
    Object? department = null,
    Object? product = null,
    Object? batch = null,
    Object? productionExpiredDate = freezed,
    Object? materialGroup = null,
    Object? miDate = null,
    Object? remarks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      miType: null == miType
          ? _value.miType
          : miType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      productionExpiredDate: freezed == productionExpiredDate
          ? _value.productionExpiredDate
          : productionExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      miDate: null == miDate
          ? _value.miDate
          : miDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res> get miType {
    return $TransactionTypeCopyWith<$Res>(_value.miType, (value) {
      return _then(_value.copyWith(miType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
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
  $ProductionOrderCopyWith<$Res> get batch {
    return $ProductionOrderCopyWith<$Res>(_value.batch, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialIssueImplCopyWith<$Res>
    implements $MaterialIssueCopyWith<$Res> {
  factory _$$MaterialIssueImplCopyWith(
          _$MaterialIssueImpl value, $Res Function(_$MaterialIssueImpl) then) =
      __$$MaterialIssueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'mi_type', fromJson: TransactionType.fromJson)
      TransactionType miType,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
      ProductionOrder batch,
      @JsonKey(name: 'product_expired_date', fromJson: isoDateToDateTime)
      DateTime? productionExpiredDate,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(name: 'mi_date', fromJson: isoDateToDateTime) DateTime miDate,
      String remarks});

  @override
  $TransactionTypeCopyWith<$Res> get miType;
  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductionOrderCopyWith<$Res> get batch;
  @override
  $MaterialGroupCopyWith<$Res> get materialGroup;
}

/// @nodoc
class __$$MaterialIssueImplCopyWithImpl<$Res>
    extends _$MaterialIssueCopyWithImpl<$Res, _$MaterialIssueImpl>
    implements _$$MaterialIssueImplCopyWith<$Res> {
  __$$MaterialIssueImplCopyWithImpl(
      _$MaterialIssueImpl _value, $Res Function(_$MaterialIssueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? miType = null,
    Object? department = null,
    Object? product = null,
    Object? batch = null,
    Object? productionExpiredDate = freezed,
    Object? materialGroup = null,
    Object? miDate = null,
    Object? remarks = null,
  }) {
    return _then(_$MaterialIssueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      miType: null == miType
          ? _value.miType
          : miType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      productionExpiredDate: freezed == productionExpiredDate
          ? _value.productionExpiredDate
          : productionExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      miDate: null == miDate
          ? _value.miDate
          : miDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIssueImpl extends _MaterialIssue {
  _$MaterialIssueImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'mi_type', fromJson: TransactionType.fromJson)
      required this.miType,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      required this.department,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
      required this.batch,
      @JsonKey(name: 'product_expired_date', fromJson: isoDateToDateTime)
      required this.productionExpiredDate,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required this.materialGroup,
      @JsonKey(name: 'mi_date', fromJson: isoDateToDateTime)
      required this.miDate,
      required this.remarks})
      : super._();

  factory _$MaterialIssueImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialIssueImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'mi_type', fromJson: TransactionType.fromJson)
  final TransactionType miType;
  @override
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
  final ProductionOrder batch;
  @override
  @JsonKey(name: 'product_expired_date', fromJson: isoDateToDateTime)
  final DateTime? productionExpiredDate;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  final MaterialGroup materialGroup;
  @override
  @JsonKey(name: 'mi_date', fromJson: isoDateToDateTime)
  final DateTime miDate;
  @override
  final String remarks;

  @override
  String toString() {
    return 'MaterialIssue(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, miType: $miType, department: $department, product: $product, batch: $batch, productionExpiredDate: $productionExpiredDate, materialGroup: $materialGroup, miDate: $miDate, remarks: $remarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIssueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.miType, miType) || other.miType == miType) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.productionExpiredDate, productionExpiredDate) ||
                other.productionExpiredDate == productionExpiredDate) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.miDate, miDate) || other.miDate == miDate) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      miType,
      department,
      product,
      batch,
      productionExpiredDate,
      materialGroup,
      miDate,
      remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIssueImplCopyWith<_$MaterialIssueImpl> get copyWith =>
      __$$MaterialIssueImplCopyWithImpl<_$MaterialIssueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIssueImplToJson(
      this,
    );
  }
}

abstract class _MaterialIssue extends MaterialIssue {
  factory _MaterialIssue(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'mi_type', fromJson: TransactionType.fromJson)
      required final TransactionType miType,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      required final Department department,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required final Product product,
      @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
      required final ProductionOrder batch,
      @JsonKey(name: 'product_expired_date', fromJson: isoDateToDateTime)
      required final DateTime? productionExpiredDate,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required final MaterialGroup materialGroup,
      @JsonKey(name: 'mi_date', fromJson: isoDateToDateTime)
      required final DateTime miDate,
      required final String remarks}) = _$MaterialIssueImpl;
  _MaterialIssue._() : super._();

  factory _MaterialIssue.fromJson(Map<String, dynamic> json) =
      _$MaterialIssueImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'mi_type', fromJson: TransactionType.fromJson)
  TransactionType get miType;
  @override
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batch;
  @override
  @JsonKey(name: 'product_expired_date', fromJson: isoDateToDateTime)
  DateTime? get productionExpiredDate;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup;
  @override
  @JsonKey(name: 'mi_date', fromJson: isoDateToDateTime)
  DateTime get miDate;
  @override
  String get remarks;
  @override
  @JsonKey(ignore: true)
  _$$MaterialIssueImplCopyWith<_$MaterialIssueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
