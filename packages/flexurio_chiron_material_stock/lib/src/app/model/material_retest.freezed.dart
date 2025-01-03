// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_retest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialRetest _$MaterialRetestFromJson(Map<String, dynamic> json) {
  return _MaterialRetests.fromJson(json);
}

/// @nodoc
mixin _$MaterialRetest {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group')
  MaterialGroup get materialGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'retest_date', fromJson: isoDateToDateTime)
  DateTime get retestDate => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: MaterialRetestStatus.fromString)
  MaterialRetestStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_retest')
  int get quantityRetest => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;

  /// Serializes this MaterialRetest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialRetest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialRetestCopyWith<MaterialRetest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialRetestCopyWith<$Res> {
  factory $MaterialRetestCopyWith(
          MaterialRetest value, $Res Function(MaterialRetest) then) =
      _$MaterialRetestCopyWithImpl<$Res, MaterialRetest>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      Material material,
      @JsonKey(name: 'material_group') MaterialGroup materialGroup,
      @JsonKey(name: 'retest_date', fromJson: isoDateToDateTime)
      DateTime retestDate,
      String na,
      @JsonKey(name: 'status', fromJson: MaterialRetestStatus.fromString)
      MaterialRetestStatus status,
      @JsonKey(name: 'quantity_retest') int quantityRetest,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate});

  $MaterialCopyWith<$Res> get material;
  $MaterialGroupCopyWith<$Res> get materialGroup;
}

/// @nodoc
class _$MaterialRetestCopyWithImpl<$Res, $Val extends MaterialRetest>
    implements $MaterialRetestCopyWith<$Res> {
  _$MaterialRetestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialRetest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? createdAt = null,
    Object? updateById = null,
    Object? updatedAt = null,
    Object? material = null,
    Object? materialGroup = null,
    Object? retestDate = null,
    Object? na = null,
    Object? status = null,
    Object? quantityRetest = null,
    Object? expiredDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      retestDate: null == retestDate
          ? _value.retestDate
          : retestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MaterialRetestStatus,
      quantityRetest: null == quantityRetest
          ? _value.quantityRetest
          : quantityRetest // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of MaterialRetest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  /// Create a copy of MaterialRetest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialRetestsImplCopyWith<$Res>
    implements $MaterialRetestCopyWith<$Res> {
  factory _$$MaterialRetestsImplCopyWith(_$MaterialRetestsImpl value,
          $Res Function(_$MaterialRetestsImpl) then) =
      __$$MaterialRetestsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      Material material,
      @JsonKey(name: 'material_group') MaterialGroup materialGroup,
      @JsonKey(name: 'retest_date', fromJson: isoDateToDateTime)
      DateTime retestDate,
      String na,
      @JsonKey(name: 'status', fromJson: MaterialRetestStatus.fromString)
      MaterialRetestStatus status,
      @JsonKey(name: 'quantity_retest') int quantityRetest,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate});

  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $MaterialGroupCopyWith<$Res> get materialGroup;
}

/// @nodoc
class __$$MaterialRetestsImplCopyWithImpl<$Res>
    extends _$MaterialRetestCopyWithImpl<$Res, _$MaterialRetestsImpl>
    implements _$$MaterialRetestsImplCopyWith<$Res> {
  __$$MaterialRetestsImplCopyWithImpl(
      _$MaterialRetestsImpl _value, $Res Function(_$MaterialRetestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRetest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? createdAt = null,
    Object? updateById = null,
    Object? updatedAt = null,
    Object? material = null,
    Object? materialGroup = null,
    Object? retestDate = null,
    Object? na = null,
    Object? status = null,
    Object? quantityRetest = null,
    Object? expiredDate = null,
  }) {
    return _then(_$MaterialRetestsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      retestDate: null == retestDate
          ? _value.retestDate
          : retestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MaterialRetestStatus,
      quantityRetest: null == quantityRetest
          ? _value.quantityRetest
          : quantityRetest // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialRetestsImpl extends _MaterialRetests {
  const _$MaterialRetestsImpl(
      {required this.id,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      required this.material,
      @JsonKey(name: 'material_group') required this.materialGroup,
      @JsonKey(name: 'retest_date', fromJson: isoDateToDateTime)
      required this.retestDate,
      required this.na,
      @JsonKey(name: 'status', fromJson: MaterialRetestStatus.fromString)
      required this.status,
      @JsonKey(name: 'quantity_retest') required this.quantityRetest,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate})
      : super._();

  factory _$MaterialRetestsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialRetestsImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updateById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final Material material;
  @override
  @JsonKey(name: 'material_group')
  final MaterialGroup materialGroup;
  @override
  @JsonKey(name: 'retest_date', fromJson: isoDateToDateTime)
  final DateTime retestDate;
  @override
  final String na;
  @override
  @JsonKey(name: 'status', fromJson: MaterialRetestStatus.fromString)
  final MaterialRetestStatus status;
  @override
  @JsonKey(name: 'quantity_retest')
  final int quantityRetest;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;

  @override
  String toString() {
    return 'MaterialRetest(id: $id, createdById: $createdById, createdAt: $createdAt, updateById: $updateById, updatedAt: $updatedAt, material: $material, materialGroup: $materialGroup, retestDate: $retestDate, na: $na, status: $status, quantityRetest: $quantityRetest, expiredDate: $expiredDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRetestsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.retestDate, retestDate) ||
                other.retestDate == retestDate) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.quantityRetest, quantityRetest) ||
                other.quantityRetest == quantityRetest) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdById,
      createdAt,
      updateById,
      updatedAt,
      material,
      materialGroup,
      retestDate,
      na,
      status,
      quantityRetest,
      expiredDate);

  /// Create a copy of MaterialRetest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialRetestsImplCopyWith<_$MaterialRetestsImpl> get copyWith =>
      __$$MaterialRetestsImplCopyWithImpl<_$MaterialRetestsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialRetestsImplToJson(
      this,
    );
  }
}

abstract class _MaterialRetests extends MaterialRetest {
  const factory _MaterialRetests(
      {required final int id,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      required final Material material,
      @JsonKey(name: 'material_group')
      required final MaterialGroup materialGroup,
      @JsonKey(name: 'retest_date', fromJson: isoDateToDateTime)
      required final DateTime retestDate,
      required final String na,
      @JsonKey(name: 'status', fromJson: MaterialRetestStatus.fromString)
      required final MaterialRetestStatus status,
      @JsonKey(name: 'quantity_retest') required final int quantityRetest,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate}) = _$MaterialRetestsImpl;
  const _MaterialRetests._() : super._();

  factory _MaterialRetests.fromJson(Map<String, dynamic> json) =
      _$MaterialRetestsImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updateById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  Material get material;
  @override
  @JsonKey(name: 'material_group')
  MaterialGroup get materialGroup;
  @override
  @JsonKey(name: 'retest_date', fromJson: isoDateToDateTime)
  DateTime get retestDate;
  @override
  String get na;
  @override
  @JsonKey(name: 'status', fromJson: MaterialRetestStatus.fromString)
  MaterialRetestStatus get status;
  @override
  @JsonKey(name: 'quantity_retest')
  int get quantityRetest;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;

  /// Create a copy of MaterialRetest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialRetestsImplCopyWith<_$MaterialRetestsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
