// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialStock _$MaterialStockFromJson(Map<String, dynamic> json) {
  return _MaterialStock.fromJson(json);
}

/// @nodoc
mixin _$MaterialStock {
  int get id => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_in')
  double get quantityIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_out')
  double get quantityOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  double get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  double get endingBalance => throw _privateConstructorUsedError;
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group')
  MaterialGroup get materialGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialStockCopyWith<MaterialStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialStockCopyWith<$Res> {
  factory $MaterialStockCopyWith(
          MaterialStock value, $Res Function(MaterialStock) then) =
      _$MaterialStockCopyWithImpl<$Res, MaterialStock>;
  @useResult
  $Res call(
      {int id,
      String period,
      String na,
      @JsonKey(name: 'quantity_in') double quantityIn,
      @JsonKey(name: 'quantity_out') double quantityOut,
      @JsonKey(name: 'beginning_balance') double beginningBalance,
      @JsonKey(name: 'ending_balance') double endingBalance,
      Material material,
      @JsonKey(name: 'material_group') MaterialGroup materialGroup,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  $MaterialCopyWith<$Res> get material;
  $MaterialGroupCopyWith<$Res> get materialGroup;
}

/// @nodoc
class _$MaterialStockCopyWithImpl<$Res, $Val extends MaterialStock>
    implements $MaterialStockCopyWith<$Res> {
  _$MaterialStockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? na = null,
    Object? quantityIn = null,
    Object? quantityOut = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? material = null,
    Object? materialGroup = null,
    Object? updatedById = null,
    Object? createdById = null,
    Object? expiredDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantityIn: null == quantityIn
          ? _value.quantityIn
          : quantityIn // ignore: cast_nullable_to_non_nullable
              as double,
      quantityOut: null == quantityOut
          ? _value.quantityOut
          : quantityOut // ignore: cast_nullable_to_non_nullable
              as double,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
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
abstract class _$$MaterialStockImplCopyWith<$Res>
    implements $MaterialStockCopyWith<$Res> {
  factory _$$MaterialStockImplCopyWith(
          _$MaterialStockImpl value, $Res Function(_$MaterialStockImpl) then) =
      __$$MaterialStockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String period,
      String na,
      @JsonKey(name: 'quantity_in') double quantityIn,
      @JsonKey(name: 'quantity_out') double quantityOut,
      @JsonKey(name: 'beginning_balance') double beginningBalance,
      @JsonKey(name: 'ending_balance') double endingBalance,
      Material material,
      @JsonKey(name: 'material_group') MaterialGroup materialGroup,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $MaterialGroupCopyWith<$Res> get materialGroup;
}

/// @nodoc
class __$$MaterialStockImplCopyWithImpl<$Res>
    extends _$MaterialStockCopyWithImpl<$Res, _$MaterialStockImpl>
    implements _$$MaterialStockImplCopyWith<$Res> {
  __$$MaterialStockImplCopyWithImpl(
      _$MaterialStockImpl _value, $Res Function(_$MaterialStockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? na = null,
    Object? quantityIn = null,
    Object? quantityOut = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? material = null,
    Object? materialGroup = null,
    Object? updatedById = null,
    Object? createdById = null,
    Object? expiredDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$MaterialStockImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantityIn: null == quantityIn
          ? _value.quantityIn
          : quantityIn // ignore: cast_nullable_to_non_nullable
              as double,
      quantityOut: null == quantityOut
          ? _value.quantityOut
          : quantityOut // ignore: cast_nullable_to_non_nullable
              as double,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialStockImpl extends _MaterialStock {
  const _$MaterialStockImpl(
      {required this.id,
      required this.period,
      required this.na,
      @JsonKey(name: 'quantity_in') required this.quantityIn,
      @JsonKey(name: 'quantity_out') required this.quantityOut,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      required this.material,
      @JsonKey(name: 'material_group') required this.materialGroup,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt})
      : super._();

  factory _$MaterialStockImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialStockImplFromJson(json);

  @override
  final int id;
  @override
  final String period;
  @override
  final String na;
  @override
  @JsonKey(name: 'quantity_in')
  final double quantityIn;
  @override
  @JsonKey(name: 'quantity_out')
  final double quantityOut;
  @override
  @JsonKey(name: 'beginning_balance')
  final double beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  final double endingBalance;
  @override
  final Material material;
  @override
  @JsonKey(name: 'material_group')
  final MaterialGroup materialGroup;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialStockImplCopyWith<_$MaterialStockImpl> get copyWith =>
      __$$MaterialStockImplCopyWithImpl<_$MaterialStockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialStockImplToJson(
      this,
    );
  }
}

abstract class _MaterialStock extends MaterialStock {
  const factory _MaterialStock(
      {required final int id,
      required final String period,
      required final String na,
      @JsonKey(name: 'quantity_in') required final double quantityIn,
      @JsonKey(name: 'quantity_out') required final double quantityOut,
      @JsonKey(name: 'beginning_balance')
      required final double beginningBalance,
      @JsonKey(name: 'ending_balance') required final double endingBalance,
      required final Material material,
      @JsonKey(name: 'material_group')
      required final MaterialGroup materialGroup,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt}) = _$MaterialStockImpl;
  const _MaterialStock._() : super._();

  factory _MaterialStock.fromJson(Map<String, dynamic> json) =
      _$MaterialStockImpl.fromJson;

  @override
  int get id;
  @override
  String get period;
  @override
  String get na;
  @override
  @JsonKey(name: 'quantity_in')
  double get quantityIn;
  @override
  @JsonKey(name: 'quantity_out')
  double get quantityOut;
  @override
  @JsonKey(name: 'beginning_balance')
  double get beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  double get endingBalance;
  @override
  Material get material;
  @override
  @JsonKey(name: 'material_group')
  MaterialGroup get materialGroup;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MaterialStockImplCopyWith<_$MaterialStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
