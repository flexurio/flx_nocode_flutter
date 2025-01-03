// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetData _$AssetDataFromJson(Map<String, dynamic> json) {
  return _AssetData.fromJson(json);
}

/// @nodoc
mixin _$AssetData {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_type', fromJson: AssetType.fromJson)
  AssetType get assetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_asset', fromJson: AssetLocation.fromJson)
  AssetLocation get assetLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_current', fromJson: AssetLocation.fromJson)
  AssetLocation get assetLocationCurrent => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_name')
  String get assetName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_non_active')
  bool get isNonActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_percent')
  double get ppnPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'pic', defaultValue: '')
  String? get pic => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_registration_id', defaultValue: '')
  String? get assetRegistrationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'na_material', defaultValue: '')
  String? get naMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_number', defaultValue: '')
  String get serialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'depreciation_value')
  int get depreciationValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_depreciation_value')
  int get monthlyDepreciationValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'depreciation_count')
  int get depreciationCount => throw _privateConstructorUsedError;

  /// Serializes this AssetData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetDataCopyWith<AssetData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetDataCopyWith<$Res> {
  factory $AssetDataCopyWith(AssetData value, $Res Function(AssetData) then) =
      _$AssetDataCopyWithImpl<$Res, AssetData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      String id,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'asset_type', fromJson: AssetType.fromJson)
      AssetType assetType,
      @JsonKey(name: 'location_asset', fromJson: AssetLocation.fromJson)
      AssetLocation assetLocation,
      @JsonKey(name: 'location_current', fromJson: AssetLocation.fromJson)
      AssetLocation assetLocationCurrent,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'asset_name') String assetName,
      int quantity,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      double price,
      String remark,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'is_non_active') bool isNonActive,
      @JsonKey(name: 'ppn_percent') double ppnPercent,
      @JsonKey(name: 'pic', defaultValue: '') String? pic,
      @JsonKey(name: 'asset_registration_id', defaultValue: '')
      String? assetRegistrationId,
      @JsonKey(name: 'na_material', defaultValue: '') String? naMaterial,
      @JsonKey(name: 'serial_number', defaultValue: '') String serialNumber,
      @JsonKey(name: 'depreciation_value') int depreciationValue,
      @JsonKey(name: 'monthly_depreciation_value') int monthlyDepreciationValue,
      @JsonKey(name: 'depreciation_count') int depreciationCount});

  $DepartmentCopyWith<$Res> get department;
  $SupplierCopyWith<$Res> get supplier;
  $AssetTypeCopyWith<$Res> get assetType;
  $AssetLocationCopyWith<$Res> get assetLocation;
  $AssetLocationCopyWith<$Res> get assetLocationCurrent;
  $MaterialUnitCopyWith<$Res> get unit;
}

/// @nodoc
class _$AssetDataCopyWithImpl<$Res, $Val extends AssetData>
    implements $AssetDataCopyWith<$Res> {
  _$AssetDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? department = null,
    Object? supplier = null,
    Object? assetType = null,
    Object? assetLocation = null,
    Object? assetLocationCurrent = null,
    Object? date = null,
    Object? assetName = null,
    Object? quantity = null,
    Object? unit = null,
    Object? price = null,
    Object? remark = null,
    Object? discountPercent = null,
    Object? isNonActive = null,
    Object? ppnPercent = null,
    Object? pic = freezed,
    Object? assetRegistrationId = freezed,
    Object? naMaterial = freezed,
    Object? serialNumber = null,
    Object? depreciationValue = null,
    Object? monthlyDepreciationValue = null,
    Object? depreciationCount = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      assetType: null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      assetLocation: null == assetLocation
          ? _value.assetLocation
          : assetLocation // ignore: cast_nullable_to_non_nullable
              as AssetLocation,
      assetLocationCurrent: null == assetLocationCurrent
          ? _value.assetLocationCurrent
          : assetLocationCurrent // ignore: cast_nullable_to_non_nullable
              as AssetLocation,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      isNonActive: null == isNonActive
          ? _value.isNonActive
          : isNonActive // ignore: cast_nullable_to_non_nullable
              as bool,
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as double,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      assetRegistrationId: freezed == assetRegistrationId
          ? _value.assetRegistrationId
          : assetRegistrationId // ignore: cast_nullable_to_non_nullable
              as String?,
      naMaterial: freezed == naMaterial
          ? _value.naMaterial
          : naMaterial // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: null == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      depreciationValue: null == depreciationValue
          ? _value.depreciationValue
          : depreciationValue // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyDepreciationValue: null == monthlyDepreciationValue
          ? _value.monthlyDepreciationValue
          : monthlyDepreciationValue // ignore: cast_nullable_to_non_nullable
              as int,
      depreciationCount: null == depreciationCount
          ? _value.depreciationCount
          : depreciationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssetTypeCopyWith<$Res> get assetType {
    return $AssetTypeCopyWith<$Res>(_value.assetType, (value) {
      return _then(_value.copyWith(assetType: value) as $Val);
    });
  }

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssetLocationCopyWith<$Res> get assetLocation {
    return $AssetLocationCopyWith<$Res>(_value.assetLocation, (value) {
      return _then(_value.copyWith(assetLocation: value) as $Val);
    });
  }

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssetLocationCopyWith<$Res> get assetLocationCurrent {
    return $AssetLocationCopyWith<$Res>(_value.assetLocationCurrent, (value) {
      return _then(_value.copyWith(assetLocationCurrent: value) as $Val);
    });
  }

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssetDataImplCopyWith<$Res>
    implements $AssetDataCopyWith<$Res> {
  factory _$$AssetDataImplCopyWith(
          _$AssetDataImpl value, $Res Function(_$AssetDataImpl) then) =
      __$$AssetDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      String id,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'asset_type', fromJson: AssetType.fromJson)
      AssetType assetType,
      @JsonKey(name: 'location_asset', fromJson: AssetLocation.fromJson)
      AssetLocation assetLocation,
      @JsonKey(name: 'location_current', fromJson: AssetLocation.fromJson)
      AssetLocation assetLocationCurrent,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'asset_name') String assetName,
      int quantity,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      double price,
      String remark,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'is_non_active') bool isNonActive,
      @JsonKey(name: 'ppn_percent') double ppnPercent,
      @JsonKey(name: 'pic', defaultValue: '') String? pic,
      @JsonKey(name: 'asset_registration_id', defaultValue: '')
      String? assetRegistrationId,
      @JsonKey(name: 'na_material', defaultValue: '') String? naMaterial,
      @JsonKey(name: 'serial_number', defaultValue: '') String serialNumber,
      @JsonKey(name: 'depreciation_value') int depreciationValue,
      @JsonKey(name: 'monthly_depreciation_value') int monthlyDepreciationValue,
      @JsonKey(name: 'depreciation_count') int depreciationCount});

  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $SupplierCopyWith<$Res> get supplier;
  @override
  $AssetTypeCopyWith<$Res> get assetType;
  @override
  $AssetLocationCopyWith<$Res> get assetLocation;
  @override
  $AssetLocationCopyWith<$Res> get assetLocationCurrent;
  @override
  $MaterialUnitCopyWith<$Res> get unit;
}

/// @nodoc
class __$$AssetDataImplCopyWithImpl<$Res>
    extends _$AssetDataCopyWithImpl<$Res, _$AssetDataImpl>
    implements _$$AssetDataImplCopyWith<$Res> {
  __$$AssetDataImplCopyWithImpl(
      _$AssetDataImpl _value, $Res Function(_$AssetDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? department = null,
    Object? supplier = null,
    Object? assetType = null,
    Object? assetLocation = null,
    Object? assetLocationCurrent = null,
    Object? date = null,
    Object? assetName = null,
    Object? quantity = null,
    Object? unit = null,
    Object? price = null,
    Object? remark = null,
    Object? discountPercent = null,
    Object? isNonActive = null,
    Object? ppnPercent = null,
    Object? pic = freezed,
    Object? assetRegistrationId = freezed,
    Object? naMaterial = freezed,
    Object? serialNumber = null,
    Object? depreciationValue = null,
    Object? monthlyDepreciationValue = null,
    Object? depreciationCount = null,
  }) {
    return _then(_$AssetDataImpl(
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      null == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      null == assetLocation
          ? _value.assetLocation
          : assetLocation // ignore: cast_nullable_to_non_nullable
              as AssetLocation,
      null == assetLocationCurrent
          ? _value.assetLocationCurrent
          : assetLocationCurrent // ignore: cast_nullable_to_non_nullable
              as AssetLocation,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      null == isNonActive
          ? _value.isNonActive
          : isNonActive // ignore: cast_nullable_to_non_nullable
              as bool,
      null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as double,
      freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == assetRegistrationId
          ? _value.assetRegistrationId
          : assetRegistrationId // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == naMaterial
          ? _value.naMaterial
          : naMaterial // ignore: cast_nullable_to_non_nullable
              as String?,
      null == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == depreciationValue
          ? _value.depreciationValue
          : depreciationValue // ignore: cast_nullable_to_non_nullable
              as int,
      null == monthlyDepreciationValue
          ? _value.monthlyDepreciationValue
          : monthlyDepreciationValue // ignore: cast_nullable_to_non_nullable
              as int,
      null == depreciationCount
          ? _value.depreciationCount
          : depreciationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetDataImpl extends _AssetData {
  _$AssetDataImpl(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'updated_by_id') this.updateById,
      this.id,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      this.department,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) this.supplier,
      @JsonKey(name: 'asset_type', fromJson: AssetType.fromJson) this.assetType,
      @JsonKey(name: 'location_asset', fromJson: AssetLocation.fromJson)
      this.assetLocation,
      @JsonKey(name: 'location_current', fromJson: AssetLocation.fromJson)
      this.assetLocationCurrent,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) this.date,
      @JsonKey(name: 'asset_name') this.assetName,
      this.quantity,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) this.unit,
      this.price,
      this.remark,
      @JsonKey(name: 'discount_percent') this.discountPercent,
      @JsonKey(name: 'is_non_active') this.isNonActive,
      @JsonKey(name: 'ppn_percent') this.ppnPercent,
      @JsonKey(name: 'pic', defaultValue: '') this.pic,
      @JsonKey(name: 'asset_registration_id', defaultValue: '')
      this.assetRegistrationId,
      @JsonKey(name: 'na_material', defaultValue: '') this.naMaterial,
      @JsonKey(name: 'serial_number', defaultValue: '') this.serialNumber,
      @JsonKey(name: 'depreciation_value') this.depreciationValue,
      @JsonKey(name: 'monthly_depreciation_value')
      this.monthlyDepreciationValue,
      @JsonKey(name: 'depreciation_count') this.depreciationCount)
      : super._();

  factory _$AssetDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetDataImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updateById;
  @override
  final String id;
  @override
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  final Supplier supplier;
  @override
  @JsonKey(name: 'asset_type', fromJson: AssetType.fromJson)
  final AssetType assetType;
  @override
  @JsonKey(name: 'location_asset', fromJson: AssetLocation.fromJson)
  final AssetLocation assetLocation;
  @override
  @JsonKey(name: 'location_current', fromJson: AssetLocation.fromJson)
  final AssetLocation assetLocationCurrent;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  final DateTime date;
  @override
  @JsonKey(name: 'asset_name')
  final String assetName;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  final double price;
  @override
  final String remark;
  @override
  @JsonKey(name: 'discount_percent')
  final double discountPercent;
  @override
  @JsonKey(name: 'is_non_active')
  final bool isNonActive;
  @override
  @JsonKey(name: 'ppn_percent')
  final double ppnPercent;
  @override
  @JsonKey(name: 'pic', defaultValue: '')
  final String? pic;
  @override
  @JsonKey(name: 'asset_registration_id', defaultValue: '')
  final String? assetRegistrationId;
  @override
  @JsonKey(name: 'na_material', defaultValue: '')
  final String? naMaterial;
  @override
  @JsonKey(name: 'serial_number', defaultValue: '')
  final String serialNumber;
  @override
  @JsonKey(name: 'depreciation_value')
  final int depreciationValue;
  @override
  @JsonKey(name: 'monthly_depreciation_value')
  final int monthlyDepreciationValue;
  @override
  @JsonKey(name: 'depreciation_count')
  final int depreciationCount;

  @override
  String toString() {
    return 'AssetData(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, id: $id, department: $department, supplier: $supplier, assetType: $assetType, assetLocation: $assetLocation, assetLocationCurrent: $assetLocationCurrent, date: $date, assetName: $assetName, quantity: $quantity, unit: $unit, price: $price, remark: $remark, discountPercent: $discountPercent, isNonActive: $isNonActive, ppnPercent: $ppnPercent, pic: $pic, assetRegistrationId: $assetRegistrationId, naMaterial: $naMaterial, serialNumber: $serialNumber, depreciationValue: $depreciationValue, monthlyDepreciationValue: $monthlyDepreciationValue, depreciationCount: $depreciationCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetDataImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.assetLocation, assetLocation) ||
                other.assetLocation == assetLocation) &&
            (identical(other.assetLocationCurrent, assetLocationCurrent) ||
                other.assetLocationCurrent == assetLocationCurrent) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.isNonActive, isNonActive) ||
                other.isNonActive == isNonActive) &&
            (identical(other.ppnPercent, ppnPercent) ||
                other.ppnPercent == ppnPercent) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            (identical(other.assetRegistrationId, assetRegistrationId) ||
                other.assetRegistrationId == assetRegistrationId) &&
            (identical(other.naMaterial, naMaterial) ||
                other.naMaterial == naMaterial) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.depreciationValue, depreciationValue) ||
                other.depreciationValue == depreciationValue) &&
            (identical(
                    other.monthlyDepreciationValue, monthlyDepreciationValue) ||
                other.monthlyDepreciationValue == monthlyDepreciationValue) &&
            (identical(other.depreciationCount, depreciationCount) ||
                other.depreciationCount == depreciationCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        createdById,
        updatedAt,
        updateById,
        id,
        department,
        supplier,
        assetType,
        assetLocation,
        assetLocationCurrent,
        date,
        assetName,
        quantity,
        unit,
        price,
        remark,
        discountPercent,
        isNonActive,
        ppnPercent,
        pic,
        assetRegistrationId,
        naMaterial,
        serialNumber,
        depreciationValue,
        monthlyDepreciationValue,
        depreciationCount
      ]);

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetDataImplCopyWith<_$AssetDataImpl> get copyWith =>
      __$$AssetDataImplCopyWithImpl<_$AssetDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetDataImplToJson(
      this,
    );
  }
}

abstract class _AssetData extends AssetData {
  factory _AssetData(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') final int updateById,
      final String id,
      @JsonKey(name: 'department', fromJson: Department.fromJson)
      final Department department,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      final Supplier supplier,
      @JsonKey(name: 'asset_type', fromJson: AssetType.fromJson)
      final AssetType assetType,
      @JsonKey(name: 'location_asset', fromJson: AssetLocation.fromJson)
      final AssetLocation assetLocation,
      @JsonKey(name: 'location_current', fromJson: AssetLocation.fromJson)
      final AssetLocation assetLocationCurrent,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) final DateTime date,
      @JsonKey(name: 'asset_name') final String assetName,
      final int quantity,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      final MaterialUnit unit,
      final double price,
      final String remark,
      @JsonKey(name: 'discount_percent') final double discountPercent,
      @JsonKey(name: 'is_non_active') final bool isNonActive,
      @JsonKey(name: 'ppn_percent') final double ppnPercent,
      @JsonKey(name: 'pic', defaultValue: '') final String? pic,
      @JsonKey(name: 'asset_registration_id', defaultValue: '')
      final String? assetRegistrationId,
      @JsonKey(name: 'na_material', defaultValue: '') final String? naMaterial,
      @JsonKey(name: 'serial_number', defaultValue: '')
      final String serialNumber,
      @JsonKey(name: 'depreciation_value') final int depreciationValue,
      @JsonKey(name: 'monthly_depreciation_value')
      final int monthlyDepreciationValue,
      @JsonKey(name: 'depreciation_count')
      final int depreciationCount) = _$AssetDataImpl;
  _AssetData._() : super._();

  factory _AssetData.fromJson(Map<String, dynamic> json) =
      _$AssetDataImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updateById;
  @override
  String get id;
  @override
  @JsonKey(name: 'department', fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier;
  @override
  @JsonKey(name: 'asset_type', fromJson: AssetType.fromJson)
  AssetType get assetType;
  @override
  @JsonKey(name: 'location_asset', fromJson: AssetLocation.fromJson)
  AssetLocation get assetLocation;
  @override
  @JsonKey(name: 'location_current', fromJson: AssetLocation.fromJson)
  AssetLocation get assetLocationCurrent;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date;
  @override
  @JsonKey(name: 'asset_name')
  String get assetName;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  double get price;
  @override
  String get remark;
  @override
  @JsonKey(name: 'discount_percent')
  double get discountPercent;
  @override
  @JsonKey(name: 'is_non_active')
  bool get isNonActive;
  @override
  @JsonKey(name: 'ppn_percent')
  double get ppnPercent;
  @override
  @JsonKey(name: 'pic', defaultValue: '')
  String? get pic;
  @override
  @JsonKey(name: 'asset_registration_id', defaultValue: '')
  String? get assetRegistrationId;
  @override
  @JsonKey(name: 'na_material', defaultValue: '')
  String? get naMaterial;
  @override
  @JsonKey(name: 'serial_number', defaultValue: '')
  String get serialNumber;
  @override
  @JsonKey(name: 'depreciation_value')
  int get depreciationValue;
  @override
  @JsonKey(name: 'monthly_depreciation_value')
  int get monthlyDepreciationValue;
  @override
  @JsonKey(name: 'depreciation_count')
  int get depreciationCount;

  /// Create a copy of AssetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetDataImplCopyWith<_$AssetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
