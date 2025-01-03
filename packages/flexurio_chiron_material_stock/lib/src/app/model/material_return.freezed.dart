// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_return.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReturn _$MaterialReturnFromJson(Map<String, dynamic> json) {
  return _MaterialReturn.fromJson(json);
}

/// @nodoc
mixin _$MaterialReturn {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_print')
  bool get isPrint => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks')
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updateAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_type_id', fromJson: TransactionType.fromJson)
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group_id', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReturnCopyWith<MaterialReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReturnCopyWith<$Res> {
  factory $MaterialReturnCopyWith(
          MaterialReturn value, $Res Function(MaterialReturn) then) =
      _$MaterialReturnCopyWithImpl<$Res, MaterialReturn>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'is_print') bool isPrint,
      @JsonKey(name: 'remarks') String remark,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updateAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'return_type_id', fromJson: TransactionType.fromJson)
      TransactionType transactionType,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'material_group_id', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'batch_no_id', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate});

  $TransactionTypeCopyWith<$Res> get transactionType;
  $ProductCopyWith<$Res> get product;
  $MaterialGroupCopyWith<$Res> get materialGroup;
  $DepartmentCopyWith<$Res> get department;
  $ProductionOrderCopyWith<$Res> get productionOrder;
}

/// @nodoc
class _$MaterialReturnCopyWithImpl<$Res, $Val extends MaterialReturn>
    implements $MaterialReturnCopyWith<$Res> {
  _$MaterialReturnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isPrint = null,
    Object? remark = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updateAt = null,
    Object? updatedById = null,
    Object? transactionType = null,
    Object? product = null,
    Object? materialGroup = null,
    Object? department = null,
    Object? productionOrder = null,
    Object? transactionDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPrint: null == isPrint
          ? _value.isPrint
          : isPrint // ignore: cast_nullable_to_non_nullable
              as bool,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res> get transactionType {
    return $TransactionTypeCopyWith<$Res>(_value.transactionType, (value) {
      return _then(_value.copyWith(transactionType: value) as $Val);
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
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value) as $Val);
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
  $ProductionOrderCopyWith<$Res> get productionOrder {
    return $ProductionOrderCopyWith<$Res>(_value.productionOrder, (value) {
      return _then(_value.copyWith(productionOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialReturnImplCopyWith<$Res>
    implements $MaterialReturnCopyWith<$Res> {
  factory _$$MaterialReturnImplCopyWith(_$MaterialReturnImpl value,
          $Res Function(_$MaterialReturnImpl) then) =
      __$$MaterialReturnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'is_print') bool isPrint,
      @JsonKey(name: 'remarks') String remark,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updateAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'return_type_id', fromJson: TransactionType.fromJson)
      TransactionType transactionType,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'material_group_id', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'batch_no_id', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate});

  @override
  $TransactionTypeCopyWith<$Res> get transactionType;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $MaterialGroupCopyWith<$Res> get materialGroup;
  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $ProductionOrderCopyWith<$Res> get productionOrder;
}

/// @nodoc
class __$$MaterialReturnImplCopyWithImpl<$Res>
    extends _$MaterialReturnCopyWithImpl<$Res, _$MaterialReturnImpl>
    implements _$$MaterialReturnImplCopyWith<$Res> {
  __$$MaterialReturnImplCopyWithImpl(
      _$MaterialReturnImpl _value, $Res Function(_$MaterialReturnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isPrint = null,
    Object? remark = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updateAt = null,
    Object? updatedById = null,
    Object? transactionType = null,
    Object? product = null,
    Object? materialGroup = null,
    Object? department = null,
    Object? productionOrder = null,
    Object? transactionDate = null,
  }) {
    return _then(_$MaterialReturnImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPrint: null == isPrint
          ? _value.isPrint
          : isPrint // ignore: cast_nullable_to_non_nullable
              as bool,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReturnImpl extends _MaterialReturn {
  _$MaterialReturnImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'is_print') required this.isPrint,
      @JsonKey(name: 'remarks') required this.remark,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updateAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'return_type_id', fromJson: TransactionType.fromJson)
      required this.transactionType,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'material_group_id', fromJson: MaterialGroup.fromJson)
      required this.materialGroup,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      required this.department,
      @JsonKey(name: 'batch_no_id', fromJson: ProductionOrder.fromJson)
      required this.productionOrder,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate})
      : super._();

  factory _$MaterialReturnImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReturnImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'is_print')
  final bool isPrint;
  @override
  @JsonKey(name: 'remarks')
  final String remark;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updateAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'return_type_id', fromJson: TransactionType.fromJson)
  final TransactionType transactionType;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'material_group_id', fromJson: MaterialGroup.fromJson)
  final MaterialGroup materialGroup;
  @override
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(name: 'batch_no_id', fromJson: ProductionOrder.fromJson)
  final ProductionOrder productionOrder;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;

  @override
  String toString() {
    return 'MaterialReturn(id: $id, isPrint: $isPrint, remark: $remark, createdAt: $createdAt, createdById: $createdById, updateAt: $updateAt, updatedById: $updatedById, transactionType: $transactionType, product: $product, materialGroup: $materialGroup, department: $department, productionOrder: $productionOrder, transactionDate: $transactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReturnImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isPrint, isPrint) || other.isPrint == isPrint) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isPrint,
      remark,
      createdAt,
      createdById,
      updateAt,
      updatedById,
      transactionType,
      product,
      materialGroup,
      department,
      productionOrder,
      transactionDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReturnImplCopyWith<_$MaterialReturnImpl> get copyWith =>
      __$$MaterialReturnImplCopyWithImpl<_$MaterialReturnImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReturnImplToJson(
      this,
    );
  }
}

abstract class _MaterialReturn extends MaterialReturn {
  factory _MaterialReturn(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'is_print') required final bool isPrint,
      @JsonKey(name: 'remarks') required final String remark,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updateAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'return_type_id', fromJson: TransactionType.fromJson)
      required final TransactionType transactionType,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required final Product product,
      @JsonKey(name: 'material_group_id', fromJson: MaterialGroup.fromJson)
      required final MaterialGroup materialGroup,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      required final Department department,
      @JsonKey(name: 'batch_no_id', fromJson: ProductionOrder.fromJson)
      required final ProductionOrder productionOrder,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate}) = _$MaterialReturnImpl;
  _MaterialReturn._() : super._();

  factory _MaterialReturn.fromJson(Map<String, dynamic> json) =
      _$MaterialReturnImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'is_print')
  bool get isPrint;
  @override
  @JsonKey(name: 'remarks')
  String get remark;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updateAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'return_type_id', fromJson: TransactionType.fromJson)
  TransactionType get transactionType;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'material_group_id', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup;
  @override
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(name: 'batch_no_id', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReturnImplCopyWith<_$MaterialReturnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
