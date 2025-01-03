// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_return_rupiah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReturnRupiah _$MaterialReturnRupiahFromJson(Map<String, dynamic> json) {
  return _MaterialReturnRupiah.fromJson(json);
}

/// @nodoc
mixin _$MaterialReturnRupiah {
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId => throw _privateConstructorUsedError;

  /// Serializes this MaterialReturnRupiah to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialReturnRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialReturnRupiahCopyWith<MaterialReturnRupiah> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReturnRupiahCopyWith<$Res> {
  factory $MaterialReturnRupiahCopyWith(MaterialReturnRupiah value,
          $Res Function(MaterialReturnRupiah) then) =
      _$MaterialReturnRupiahCopyWithImpl<$Res, MaterialReturnRupiah>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      double quantity,
      double price,
      @JsonKey(name: 'material_unit_id') String materialUnitId});
}

/// @nodoc
class _$MaterialReturnRupiahCopyWithImpl<$Res,
        $Val extends MaterialReturnRupiah>
    implements $MaterialReturnRupiahCopyWith<$Res> {
  _$MaterialReturnRupiahCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialReturnRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialName = null,
    Object? quantity = null,
    Object? price = null,
    Object? materialUnitId = null,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialReturnRupiahImplCopyWith<$Res>
    implements $MaterialReturnRupiahCopyWith<$Res> {
  factory _$$MaterialReturnRupiahImplCopyWith(_$MaterialReturnRupiahImpl value,
          $Res Function(_$MaterialReturnRupiahImpl) then) =
      __$$MaterialReturnRupiahImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      double quantity,
      double price,
      @JsonKey(name: 'material_unit_id') String materialUnitId});
}

/// @nodoc
class __$$MaterialReturnRupiahImplCopyWithImpl<$Res>
    extends _$MaterialReturnRupiahCopyWithImpl<$Res, _$MaterialReturnRupiahImpl>
    implements _$$MaterialReturnRupiahImplCopyWith<$Res> {
  __$$MaterialReturnRupiahImplCopyWithImpl(_$MaterialReturnRupiahImpl _value,
      $Res Function(_$MaterialReturnRupiahImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialReturnRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialName = null,
    Object? quantity = null,
    Object? price = null,
    Object? materialUnitId = null,
  }) {
    return _then(_$MaterialReturnRupiahImpl(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReturnRupiahImpl extends _MaterialReturnRupiah {
  const _$MaterialReturnRupiahImpl(
      {@JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_name') required this.materialName,
      required this.quantity,
      required this.price,
      @JsonKey(name: 'material_unit_id') required this.materialUnitId})
      : super._();

  factory _$MaterialReturnRupiahImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReturnRupiahImplFromJson(json);

  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  final double quantity;
  @override
  final double price;
  @override
  @JsonKey(name: 'material_unit_id')
  final String materialUnitId;

  @override
  String toString() {
    return 'MaterialReturnRupiah(materialId: $materialId, materialName: $materialName, quantity: $quantity, price: $price, materialUnitId: $materialUnitId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReturnRupiahImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.materialUnitId, materialUnitId) ||
                other.materialUnitId == materialUnitId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, materialId, materialName, quantity, price, materialUnitId);

  /// Create a copy of MaterialReturnRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReturnRupiahImplCopyWith<_$MaterialReturnRupiahImpl>
      get copyWith =>
          __$$MaterialReturnRupiahImplCopyWithImpl<_$MaterialReturnRupiahImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReturnRupiahImplToJson(
      this,
    );
  }
}

abstract class _MaterialReturnRupiah extends MaterialReturnRupiah {
  const factory _MaterialReturnRupiah(
      {@JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_name') required final String materialName,
      required final double quantity,
      required final double price,
      @JsonKey(name: 'material_unit_id')
      required final String materialUnitId}) = _$MaterialReturnRupiahImpl;
  const _MaterialReturnRupiah._() : super._();

  factory _MaterialReturnRupiah.fromJson(Map<String, dynamic> json) =
      _$MaterialReturnRupiahImpl.fromJson;

  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  double get quantity;
  @override
  double get price;
  @override
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId;

  /// Create a copy of MaterialReturnRupiah
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialReturnRupiahImplCopyWith<_$MaterialReturnRupiahImpl>
      get copyWith => throw _privateConstructorUsedError;
}
