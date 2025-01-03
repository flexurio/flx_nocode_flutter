// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_receive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReceive _$MaterialReceiveFromJson(Map<String, dynamic> json) {
  return _MaterialReceive.fromJson(json);
}

/// @nodoc
mixin _$MaterialReceive {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor', fromJson: Vendor.fromJson)
  Vendor get vendor => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
  WarehouseMaterialReceive get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_invoice_receive', defaultValue: false)
  bool get isInvoiceReceive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReceiveCopyWith<MaterialReceive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReceiveCopyWith<$Res> {
  factory $MaterialReceiveCopyWith(
          MaterialReceive value, $Res Function(MaterialReceive) then) =
      _$MaterialReceiveCopyWithImpl<$Res, MaterialReceive>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
      TransactionType transactionType,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'vendor', fromJson: Vendor.fromJson) Vendor vendor,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      String description,
      @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
      WarehouseMaterialReceive warehouse,
      @JsonKey(name: 'is_invoice_receive', defaultValue: false)
      bool isInvoiceReceive});

  $TransactionTypeCopyWith<$Res> get transactionType;
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  $MaterialGroupCopyWith<$Res> get materialGroup;
  $DepartmentCopyWith<$Res> get department;
  $VendorCopyWith<$Res> get vendor;
}

/// @nodoc
class _$MaterialReceiveCopyWithImpl<$Res, $Val extends MaterialReceive>
    implements $MaterialReceiveCopyWith<$Res> {
  _$MaterialReceiveCopyWithImpl(this._value, this._then);

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
    Object? transactionType = null,
    Object? purchaseOrder = null,
    Object? materialGroup = null,
    Object? department = null,
    Object? vendor = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? description = null,
    Object? warehouse = null,
    Object? isInvoiceReceive = null,
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
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as WarehouseMaterialReceive,
      isInvoiceReceive: null == isInvoiceReceive
          ? _value.isInvoiceReceive
          : isInvoiceReceive // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value) as $Val);
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
  $VendorCopyWith<$Res> get vendor {
    return $VendorCopyWith<$Res>(_value.vendor, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialReceiveImplCopyWith<$Res>
    implements $MaterialReceiveCopyWith<$Res> {
  factory _$$MaterialReceiveImplCopyWith(_$MaterialReceiveImpl value,
          $Res Function(_$MaterialReceiveImpl) then) =
      __$$MaterialReceiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
      TransactionType transactionType,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'vendor', fromJson: Vendor.fromJson) Vendor vendor,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      String description,
      @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
      WarehouseMaterialReceive warehouse,
      @JsonKey(name: 'is_invoice_receive', defaultValue: false)
      bool isInvoiceReceive});

  @override
  $TransactionTypeCopyWith<$Res> get transactionType;
  @override
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  @override
  $MaterialGroupCopyWith<$Res> get materialGroup;
  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $VendorCopyWith<$Res> get vendor;
}

/// @nodoc
class __$$MaterialReceiveImplCopyWithImpl<$Res>
    extends _$MaterialReceiveCopyWithImpl<$Res, _$MaterialReceiveImpl>
    implements _$$MaterialReceiveImplCopyWith<$Res> {
  __$$MaterialReceiveImplCopyWithImpl(
      _$MaterialReceiveImpl _value, $Res Function(_$MaterialReceiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? transactionType = null,
    Object? purchaseOrder = null,
    Object? materialGroup = null,
    Object? department = null,
    Object? vendor = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? description = null,
    Object? warehouse = null,
    Object? isInvoiceReceive = null,
  }) {
    return _then(_$MaterialReceiveImpl(
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
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as WarehouseMaterialReceive,
      isInvoiceReceive: null == isInvoiceReceive
          ? _value.isInvoiceReceive
          : isInvoiceReceive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReceiveImpl extends _MaterialReceive {
  const _$MaterialReceiveImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
      required this.transactionType,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required this.purchaseOrder,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required this.materialGroup,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      required this.department,
      @JsonKey(name: 'vendor', fromJson: Vendor.fromJson) required this.vendor,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required this.deliveryOrderDate,
      required this.description,
      @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
      required this.warehouse,
      @JsonKey(name: 'is_invoice_receive', defaultValue: false)
      required this.isInvoiceReceive})
      : super._();

  factory _$MaterialReceiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReceiveImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
  final TransactionType transactionType;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  final PurchaseOrder purchaseOrder;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  final MaterialGroup materialGroup;
  @override
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(name: 'vendor', fromJson: Vendor.fromJson)
  final Vendor vendor;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  final DateTime deliveryOrderDate;
  @override
  final String description;
  @override
  @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
  final WarehouseMaterialReceive warehouse;
  @override
  @JsonKey(name: 'is_invoice_receive', defaultValue: false)
  final bool isInvoiceReceive;

  @override
  String toString() {
    return 'MaterialReceive(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, transactionType: $transactionType, purchaseOrder: $purchaseOrder, materialGroup: $materialGroup, department: $department, vendor: $vendor, deliveryOrderId: $deliveryOrderId, deliveryOrderDate: $deliveryOrderDate, description: $description, warehouse: $warehouse, isInvoiceReceive: $isInvoiceReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReceiveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.isInvoiceReceive, isInvoiceReceive) ||
                other.isInvoiceReceive == isInvoiceReceive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      transactionType,
      purchaseOrder,
      materialGroup,
      department,
      vendor,
      deliveryOrderId,
      deliveryOrderDate,
      description,
      warehouse,
      isInvoiceReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReceiveImplCopyWith<_$MaterialReceiveImpl> get copyWith =>
      __$$MaterialReceiveImplCopyWithImpl<_$MaterialReceiveImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReceiveImplToJson(
      this,
    );
  }
}

abstract class _MaterialReceive extends MaterialReceive {
  const factory _MaterialReceive(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
      required final TransactionType transactionType,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required final PurchaseOrder purchaseOrder,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required final MaterialGroup materialGroup,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      required final Department department,
      @JsonKey(name: 'vendor', fromJson: Vendor.fromJson)
      required final Vendor vendor,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryOrderDate,
      required final String description,
      @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
      required final WarehouseMaterialReceive warehouse,
      @JsonKey(name: 'is_invoice_receive', defaultValue: false)
      required final bool isInvoiceReceive}) = _$MaterialReceiveImpl;
  const _MaterialReceive._() : super._();

  factory _MaterialReceive.fromJson(Map<String, dynamic> json) =
      _$MaterialReceiveImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
  TransactionType get transactionType;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup;
  @override
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(name: 'vendor', fromJson: Vendor.fromJson)
  Vendor get vendor;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate;
  @override
  String get description;
  @override
  @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
  WarehouseMaterialReceive get warehouse;
  @override
  @JsonKey(name: 'is_invoice_receive', defaultValue: false)
  bool get isInvoiceReceive;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReceiveImplCopyWith<_$MaterialReceiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
