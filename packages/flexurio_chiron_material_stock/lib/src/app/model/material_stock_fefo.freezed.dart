// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_stock_fefo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialStockFefo _$MaterialStockFefoFromJson(Map<String, dynamic> json) {
  return _MaterialStockFefo.fromJson(json);
}

/// @nodoc
mixin _$MaterialStockFefo {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group')
  MaterialGroup get materialGroup => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_in')
  int get quantityIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_out')
  int get quantityOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  int get endingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'released_date', fromJson: isoDateToDateTime)
  DateTime get releasedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialStockFefoCopyWith<MaterialStockFefo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialStockFefoCopyWith<$Res> {
  factory $MaterialStockFefoCopyWith(
          MaterialStockFefo value, $Res Function(MaterialStockFefo) then) =
      _$MaterialStockFefoCopyWithImpl<$Res, MaterialStockFefo>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_group') MaterialGroup materialGroup,
      String period,
      String na,
      @JsonKey(name: 'quantity_in') int quantityIn,
      @JsonKey(name: 'quantity_out') int quantityOut,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'released_date', fromJson: isoDateToDateTime)
      DateTime releasedDate});

  $MaterialCopyWith<$Res> get material;
  $MaterialGroupCopyWith<$Res> get materialGroup;
}

/// @nodoc
class _$MaterialStockFefoCopyWithImpl<$Res, $Val extends MaterialStockFefo>
    implements $MaterialStockFefoCopyWith<$Res> {
  _$MaterialStockFefoCopyWithImpl(this._value, this._then);

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
    Object? createdById = null,
    Object? updatedById = null,
    Object? material = null,
    Object? materialGroup = null,
    Object? period = null,
    Object? na = null,
    Object? quantityIn = null,
    Object? quantityOut = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? expiredDate = null,
    Object? releasedDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
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
              as int,
      quantityOut: null == quantityOut
          ? _value.quantityOut
          : quantityOut // ignore: cast_nullable_to_non_nullable
              as int,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      releasedDate: null == releasedDate
          ? _value.releasedDate
          : releasedDate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MaterialStockFefoImplCopyWith<$Res>
    implements $MaterialStockFefoCopyWith<$Res> {
  factory _$$MaterialStockFefoImplCopyWith(_$MaterialStockFefoImpl value,
          $Res Function(_$MaterialStockFefoImpl) then) =
      __$$MaterialStockFefoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_group') MaterialGroup materialGroup,
      String period,
      String na,
      @JsonKey(name: 'quantity_in') int quantityIn,
      @JsonKey(name: 'quantity_out') int quantityOut,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'released_date', fromJson: isoDateToDateTime)
      DateTime releasedDate});

  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $MaterialGroupCopyWith<$Res> get materialGroup;
}

/// @nodoc
class __$$MaterialStockFefoImplCopyWithImpl<$Res>
    extends _$MaterialStockFefoCopyWithImpl<$Res, _$MaterialStockFefoImpl>
    implements _$$MaterialStockFefoImplCopyWith<$Res> {
  __$$MaterialStockFefoImplCopyWithImpl(_$MaterialStockFefoImpl _value,
      $Res Function(_$MaterialStockFefoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdById = null,
    Object? updatedById = null,
    Object? material = null,
    Object? materialGroup = null,
    Object? period = null,
    Object? na = null,
    Object? quantityIn = null,
    Object? quantityOut = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? expiredDate = null,
    Object? releasedDate = null,
  }) {
    return _then(_$MaterialStockFefoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
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
              as int,
      quantityOut: null == quantityOut
          ? _value.quantityOut
          : quantityOut // ignore: cast_nullable_to_non_nullable
              as int,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      releasedDate: null == releasedDate
          ? _value.releasedDate
          : releasedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialStockFefoImpl extends _MaterialStockFefo {
  const _$MaterialStockFefoImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      required this.material,
      @JsonKey(name: 'material_group') required this.materialGroup,
      required this.period,
      required this.na,
      @JsonKey(name: 'quantity_in') required this.quantityIn,
      @JsonKey(name: 'quantity_out') required this.quantityOut,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'released_date', fromJson: isoDateToDateTime)
      required this.releasedDate})
      : super._();

  factory _$MaterialStockFefoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialStockFefoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  final Material material;
  @override
  @JsonKey(name: 'material_group')
  final MaterialGroup materialGroup;
  @override
  final String period;
  @override
  final String na;
  @override
  @JsonKey(name: 'quantity_in')
  final int quantityIn;
  @override
  @JsonKey(name: 'quantity_out')
  final int quantityOut;
  @override
  @JsonKey(name: 'beginning_balance')
  final int beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  final int endingBalance;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'released_date', fromJson: isoDateToDateTime)
  final DateTime releasedDate;

  @override
  String toString() {
    return 'MaterialStockFefo(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, createdById: $createdById, updatedById: $updatedById, material: $material, materialGroup: $materialGroup, period: $period, na: $na, quantityIn: $quantityIn, quantityOut: $quantityOut, beginningBalance: $beginningBalance, endingBalance: $endingBalance, expiredDate: $expiredDate, releasedDate: $releasedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialStockFefoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.quantityIn, quantityIn) ||
                other.quantityIn == quantityIn) &&
            (identical(other.quantityOut, quantityOut) ||
                other.quantityOut == quantityOut) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.endingBalance, endingBalance) ||
                other.endingBalance == endingBalance) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.releasedDate, releasedDate) ||
                other.releasedDate == releasedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      createdById,
      updatedById,
      material,
      materialGroup,
      period,
      na,
      quantityIn,
      quantityOut,
      beginningBalance,
      endingBalance,
      expiredDate,
      releasedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialStockFefoImplCopyWith<_$MaterialStockFefoImpl> get copyWith =>
      __$$MaterialStockFefoImplCopyWithImpl<_$MaterialStockFefoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialStockFefoImplToJson(
      this,
    );
  }
}

abstract class _MaterialStockFefo extends MaterialStockFefo {
  const factory _MaterialStockFefo(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      required final Material material,
      @JsonKey(name: 'material_group')
      required final MaterialGroup materialGroup,
      required final String period,
      required final String na,
      @JsonKey(name: 'quantity_in') required final int quantityIn,
      @JsonKey(name: 'quantity_out') required final int quantityOut,
      @JsonKey(name: 'beginning_balance') required final int beginningBalance,
      @JsonKey(name: 'ending_balance') required final int endingBalance,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      @JsonKey(name: 'released_date', fromJson: isoDateToDateTime)
      required final DateTime releasedDate}) = _$MaterialStockFefoImpl;
  const _MaterialStockFefo._() : super._();

  factory _MaterialStockFefo.fromJson(Map<String, dynamic> json) =
      _$MaterialStockFefoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material;
  @override
  @JsonKey(name: 'material_group')
  MaterialGroup get materialGroup;
  @override
  String get period;
  @override
  String get na;
  @override
  @JsonKey(name: 'quantity_in')
  int get quantityIn;
  @override
  @JsonKey(name: 'quantity_out')
  int get quantityOut;
  @override
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  int get endingBalance;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'released_date', fromJson: isoDateToDateTime)
  DateTime get releasedDate;
  @override
  @JsonKey(ignore: true)
  _$$MaterialStockFefoImplCopyWith<_$MaterialStockFefoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
