// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_request_detail_temporary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialRequestDetailTemporaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)
        add,
    required TResult Function(List<PurchaseRequestDetail> materials) addAll,
    required TResult Function(int id) remove,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult? Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult Function(int id)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialRequestDetailTemporaryEventCopyWith<$Res> {
  factory $MaterialRequestDetailTemporaryEventCopyWith(
          MaterialRequestDetailTemporaryEvent value,
          $Res Function(MaterialRequestDetailTemporaryEvent) then) =
      _$MaterialRequestDetailTemporaryEventCopyWithImpl<$Res,
          MaterialRequestDetailTemporaryEvent>;
}

/// @nodoc
class _$MaterialRequestDetailTemporaryEventCopyWithImpl<$Res,
        $Val extends MaterialRequestDetailTemporaryEvent>
    implements $MaterialRequestDetailTemporaryEventCopyWith<$Res> {
  _$MaterialRequestDetailTemporaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Material? material,
      MaterialDesign? materialDesign,
      Product? product,
      String? batchNo,
      DateTime? batchExpiredDate,
      double quantity,
      bool isFastTrack,
      MaterialUnit unit,
      DateTime dueDate});

  $MaterialCopyWith<$Res>? get material;
  $MaterialDesignCopyWith<$Res>? get materialDesign;
  $ProductCopyWith<$Res>? get product;
  $MaterialUnitCopyWith<$Res> get unit;
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$MaterialRequestDetailTemporaryEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = freezed,
    Object? materialDesign = freezed,
    Object? product = freezed,
    Object? batchNo = freezed,
    Object? batchExpiredDate = freezed,
    Object? quantity = null,
    Object? isFastTrack = null,
    Object? unit = null,
    Object? dueDate = null,
  }) {
    return _then(_$AddImpl(
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      materialDesign: freezed == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      batchExpiredDate: freezed == batchExpiredDate
          ? _value.batchExpiredDate
          : batchExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isFastTrack: null == isFastTrack
          ? _value.isFastTrack
          : isFastTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res>? get material {
    if (_value.material == null) {
      return null;
    }

    return $MaterialCopyWith<$Res>(_value.material!, (value) {
      return _then(_value.copyWith(material: value));
    });
  }

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res>? get materialDesign {
    if (_value.materialDesign == null) {
      return null;
    }

    return $MaterialDesignCopyWith<$Res>(_value.materialDesign!, (value) {
      return _then(_value.copyWith(materialDesign: value));
    });
  }

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value));
    });
  }

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value));
    });
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl(
      {required this.material,
      required this.materialDesign,
      required this.product,
      required this.batchNo,
      required this.batchExpiredDate,
      required this.quantity,
      required this.isFastTrack,
      required this.unit,
      required this.dueDate});

  @override
  final Material? material;
  @override
  final MaterialDesign? materialDesign;
  @override
  final Product? product;
  @override
  final String? batchNo;
  @override
  final DateTime? batchExpiredDate;
  @override
  final double quantity;
  @override
  final bool isFastTrack;
  @override
  final MaterialUnit unit;
  @override
  final DateTime dueDate;

  @override
  String toString() {
    return 'MaterialRequestDetailTemporaryEvent.add(material: $material, materialDesign: $materialDesign, product: $product, batchNo: $batchNo, batchExpiredDate: $batchExpiredDate, quantity: $quantity, isFastTrack: $isFastTrack, unit: $unit, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialDesign, materialDesign) ||
                other.materialDesign == materialDesign) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.batchExpiredDate, batchExpiredDate) ||
                other.batchExpiredDate == batchExpiredDate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isFastTrack, isFastTrack) ||
                other.isFastTrack == isFastTrack) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material, materialDesign,
      product, batchNo, batchExpiredDate, quantity, isFastTrack, unit, dueDate);

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)
        add,
    required TResult Function(List<PurchaseRequestDetail> materials) addAll,
    required TResult Function(int id) remove,
    required TResult Function() clear,
  }) {
    return add(material, materialDesign, product, batchNo, batchExpiredDate,
        quantity, isFastTrack, unit, dueDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult? Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function()? clear,
  }) {
    return add?.call(material, materialDesign, product, batchNo,
        batchExpiredDate, quantity, isFastTrack, unit, dueDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult Function(int id)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(material, materialDesign, product, batchNo, batchExpiredDate,
          quantity, isFastTrack, unit, dueDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements MaterialRequestDetailTemporaryEvent {
  const factory _Add(
      {required final Material? material,
      required final MaterialDesign? materialDesign,
      required final Product? product,
      required final String? batchNo,
      required final DateTime? batchExpiredDate,
      required final double quantity,
      required final bool isFastTrack,
      required final MaterialUnit unit,
      required final DateTime dueDate}) = _$AddImpl;

  Material? get material;
  MaterialDesign? get materialDesign;
  Product? get product;
  String? get batchNo;
  DateTime? get batchExpiredDate;
  double get quantity;
  bool get isFastTrack;
  MaterialUnit get unit;
  DateTime get dueDate;

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAllImplCopyWith<$Res> {
  factory _$$AddAllImplCopyWith(
          _$AddAllImpl value, $Res Function(_$AddAllImpl) then) =
      __$$AddAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PurchaseRequestDetail> materials});
}

/// @nodoc
class __$$AddAllImplCopyWithImpl<$Res>
    extends _$MaterialRequestDetailTemporaryEventCopyWithImpl<$Res,
        _$AddAllImpl> implements _$$AddAllImplCopyWith<$Res> {
  __$$AddAllImplCopyWithImpl(
      _$AddAllImpl _value, $Res Function(_$AddAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
  }) {
    return _then(_$AddAllImpl(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<PurchaseRequestDetail>,
    ));
  }
}

/// @nodoc

class _$AddAllImpl implements _AddAll {
  const _$AddAllImpl({required final List<PurchaseRequestDetail> materials})
      : _materials = materials;

  final List<PurchaseRequestDetail> _materials;
  @override
  List<PurchaseRequestDetail> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'MaterialRequestDetailTemporaryEvent.addAll(materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAllImpl &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_materials));

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAllImplCopyWith<_$AddAllImpl> get copyWith =>
      __$$AddAllImplCopyWithImpl<_$AddAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)
        add,
    required TResult Function(List<PurchaseRequestDetail> materials) addAll,
    required TResult Function(int id) remove,
    required TResult Function() clear,
  }) {
    return addAll(materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult? Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function()? clear,
  }) {
    return addAll?.call(materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult Function(int id)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (addAll != null) {
      return addAll(materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return addAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return addAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (addAll != null) {
      return addAll(this);
    }
    return orElse();
  }
}

abstract class _AddAll implements MaterialRequestDetailTemporaryEvent {
  const factory _AddAll(
      {required final List<PurchaseRequestDetail> materials}) = _$AddAllImpl;

  List<PurchaseRequestDetail> get materials;

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAllImplCopyWith<_$AddAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$MaterialRequestDetailTemporaryEventCopyWithImpl<$Res,
        _$RemoveImpl> implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'MaterialRequestDetailTemporaryEvent.remove(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)
        add,
    required TResult Function(List<PurchaseRequestDetail> materials) addAll,
    required TResult Function(int id) remove,
    required TResult Function() clear,
  }) {
    return remove(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult? Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function()? clear,
  }) {
    return remove?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult Function(int id)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements MaterialRequestDetailTemporaryEvent {
  const factory _Remove(final int id) = _$RemoveImpl;

  int get id;

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
          _$ClearImpl value, $Res Function(_$ClearImpl) then) =
      __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$MaterialRequestDetailTemporaryEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'MaterialRequestDetailTemporaryEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)
        add,
    required TResult Function(List<PurchaseRequestDetail> materials) addAll,
    required TResult Function(int id) remove,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult? Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialDesign? materialDesign,
            Product? product,
            String? batchNo,
            DateTime? batchExpiredDate,
            double quantity,
            bool isFastTrack,
            MaterialUnit unit,
            DateTime dueDate)?
        add,
    TResult Function(List<PurchaseRequestDetail> materials)? addAll,
    TResult Function(int id)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements MaterialRequestDetailTemporaryEvent {
  const factory _Clear() = _$ClearImpl;
}
