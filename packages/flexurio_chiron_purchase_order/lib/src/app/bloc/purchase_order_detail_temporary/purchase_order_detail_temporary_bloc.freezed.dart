// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_detail_temporary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrderDetailTemporaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)
        add,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        addAll,
    required TResult Function(int id) remove,
    required TResult Function(int index) removeByIndex,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function(int index)? removeByIndex,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult Function(int id)? remove,
    TResult Function(int index)? removeByIndex,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_RemoveByIndex value) removeByIndex,
    required TResult Function(_Clear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_RemoveByIndex value)? removeByIndex,
    TResult? Function(_Clear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Remove value)? remove,
    TResult Function(_RemoveByIndex value)? removeByIndex,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderDetailTemporaryEventCopyWith<$Res> {
  factory $PurchaseOrderDetailTemporaryEventCopyWith(
          PurchaseOrderDetailTemporaryEvent value,
          $Res Function(PurchaseOrderDetailTemporaryEvent) then) =
      _$PurchaseOrderDetailTemporaryEventCopyWithImpl<$Res,
          PurchaseOrderDetailTemporaryEvent>;
}

/// @nodoc
class _$PurchaseOrderDetailTemporaryEventCopyWithImpl<$Res,
        $Val extends PurchaseOrderDetailTemporaryEvent>
    implements $PurchaseOrderDetailTemporaryEventCopyWith<$Res> {
  _$PurchaseOrderDetailTemporaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Material? material,
      MaterialUnit materialUnit,
      double quantity,
      MaterialDesign design,
      ProductionOrder batch,
      bool ignoreDuplicate});

  $MaterialCopyWith<$Res>? get material;
  $MaterialUnitCopyWith<$Res> get materialUnit;
  $MaterialDesignCopyWith<$Res> get design;
  $ProductionOrderCopyWith<$Res> get batch;
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailTemporaryEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = freezed,
    Object? materialUnit = null,
    Object? quantity = null,
    Object? design = null,
    Object? batch = null,
    Object? ignoreDuplicate = null,
  }) {
    return _then(_$AddImpl(
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as MaterialDesign,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      ignoreDuplicate: null == ignoreDuplicate
          ? _value.ignoreDuplicate
          : ignoreDuplicate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
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

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value));
    });
  }

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res> get design {
    return $MaterialDesignCopyWith<$Res>(_value.design, (value) {
      return _then(_value.copyWith(design: value));
    });
  }

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get batch {
    return $ProductionOrderCopyWith<$Res>(_value.batch, (value) {
      return _then(_value.copyWith(batch: value));
    });
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl(
      {required this.material,
      required this.materialUnit,
      required this.quantity,
      required this.design,
      required this.batch,
      required this.ignoreDuplicate});

  @override
  final Material? material;
  @override
  final MaterialUnit materialUnit;
  @override
  final double quantity;
  @override
  final MaterialDesign design;
  @override
  final ProductionOrder batch;
  @override
  final bool ignoreDuplicate;

  @override
  String toString() {
    return 'PurchaseOrderDetailTemporaryEvent.add(material: $material, materialUnit: $materialUnit, quantity: $quantity, design: $design, batch: $batch, ignoreDuplicate: $ignoreDuplicate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.design, design) || other.design == design) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.ignoreDuplicate, ignoreDuplicate) ||
                other.ignoreDuplicate == ignoreDuplicate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material, materialUnit, quantity,
      design, batch, ignoreDuplicate);

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
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
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)
        add,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        addAll,
    required TResult Function(int id) remove,
    required TResult Function(int index) removeByIndex,
    required TResult Function() clear,
  }) {
    return add(
        material, materialUnit, quantity, design, batch, ignoreDuplicate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function(int index)? removeByIndex,
    TResult? Function()? clear,
  }) {
    return add?.call(
        material, materialUnit, quantity, design, batch, ignoreDuplicate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult Function(int id)? remove,
    TResult Function(int index)? removeByIndex,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(
          material, materialUnit, quantity, design, batch, ignoreDuplicate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_RemoveByIndex value) removeByIndex,
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
    TResult? Function(_RemoveByIndex value)? removeByIndex,
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
    TResult Function(_RemoveByIndex value)? removeByIndex,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements PurchaseOrderDetailTemporaryEvent {
  const factory _Add(
      {required final Material? material,
      required final MaterialUnit materialUnit,
      required final double quantity,
      required final MaterialDesign design,
      required final ProductionOrder batch,
      required final bool ignoreDuplicate}) = _$AddImpl;

  Material? get material;
  MaterialUnit get materialUnit;
  double get quantity;
  MaterialDesign get design;
  ProductionOrder get batch;
  bool get ignoreDuplicate;

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
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
  $Res call({List<PurchaseOrderDetail> purchaseOrderDetails});
}

/// @nodoc
class __$$AddAllImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailTemporaryEventCopyWithImpl<$Res, _$AddAllImpl>
    implements _$$AddAllImplCopyWith<$Res> {
  __$$AddAllImplCopyWithImpl(
      _$AddAllImpl _value, $Res Function(_$AddAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderDetails = null,
  }) {
    return _then(_$AddAllImpl(
      purchaseOrderDetails: null == purchaseOrderDetails
          ? _value._purchaseOrderDetails
          : purchaseOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderDetail>,
    ));
  }
}

/// @nodoc

class _$AddAllImpl implements _AddAll {
  const _$AddAllImpl(
      {required final List<PurchaseOrderDetail> purchaseOrderDetails})
      : _purchaseOrderDetails = purchaseOrderDetails;

  final List<PurchaseOrderDetail> _purchaseOrderDetails;
  @override
  List<PurchaseOrderDetail> get purchaseOrderDetails {
    if (_purchaseOrderDetails is EqualUnmodifiableListView)
      return _purchaseOrderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchaseOrderDetails);
  }

  @override
  String toString() {
    return 'PurchaseOrderDetailTemporaryEvent.addAll(purchaseOrderDetails: $purchaseOrderDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAllImpl &&
            const DeepCollectionEquality()
                .equals(other._purchaseOrderDetails, _purchaseOrderDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_purchaseOrderDetails));

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
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
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)
        add,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        addAll,
    required TResult Function(int id) remove,
    required TResult Function(int index) removeByIndex,
    required TResult Function() clear,
  }) {
    return addAll(purchaseOrderDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function(int index)? removeByIndex,
    TResult? Function()? clear,
  }) {
    return addAll?.call(purchaseOrderDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult Function(int id)? remove,
    TResult Function(int index)? removeByIndex,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (addAll != null) {
      return addAll(purchaseOrderDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_RemoveByIndex value) removeByIndex,
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
    TResult? Function(_RemoveByIndex value)? removeByIndex,
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
    TResult Function(_RemoveByIndex value)? removeByIndex,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (addAll != null) {
      return addAll(this);
    }
    return orElse();
  }
}

abstract class _AddAll implements PurchaseOrderDetailTemporaryEvent {
  const factory _AddAll(
          {required final List<PurchaseOrderDetail> purchaseOrderDetails}) =
      _$AddAllImpl;

  List<PurchaseOrderDetail> get purchaseOrderDetails;

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
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
    extends _$PurchaseOrderDetailTemporaryEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'PurchaseOrderDetailTemporaryEvent.remove(id: $id)';
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

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
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
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)
        add,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        addAll,
    required TResult Function(int id) remove,
    required TResult Function(int index) removeByIndex,
    required TResult Function() clear,
  }) {
    return remove(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function(int index)? removeByIndex,
    TResult? Function()? clear,
  }) {
    return remove?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult Function(int id)? remove,
    TResult Function(int index)? removeByIndex,
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
    required TResult Function(_RemoveByIndex value) removeByIndex,
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
    TResult? Function(_RemoveByIndex value)? removeByIndex,
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
    TResult Function(_RemoveByIndex value)? removeByIndex,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements PurchaseOrderDetailTemporaryEvent {
  const factory _Remove({required final int id}) = _$RemoveImpl;

  int get id;

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveByIndexImplCopyWith<$Res> {
  factory _$$RemoveByIndexImplCopyWith(
          _$RemoveByIndexImpl value, $Res Function(_$RemoveByIndexImpl) then) =
      __$$RemoveByIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveByIndexImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailTemporaryEventCopyWithImpl<$Res,
        _$RemoveByIndexImpl> implements _$$RemoveByIndexImplCopyWith<$Res> {
  __$$RemoveByIndexImplCopyWithImpl(
      _$RemoveByIndexImpl _value, $Res Function(_$RemoveByIndexImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$RemoveByIndexImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveByIndexImpl implements _RemoveByIndex {
  const _$RemoveByIndexImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'PurchaseOrderDetailTemporaryEvent.removeByIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveByIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveByIndexImplCopyWith<_$RemoveByIndexImpl> get copyWith =>
      __$$RemoveByIndexImplCopyWithImpl<_$RemoveByIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)
        add,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        addAll,
    required TResult Function(int id) remove,
    required TResult Function(int index) removeByIndex,
    required TResult Function() clear,
  }) {
    return removeByIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function(int index)? removeByIndex,
    TResult? Function()? clear,
  }) {
    return removeByIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult Function(int id)? remove,
    TResult Function(int index)? removeByIndex,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (removeByIndex != null) {
      return removeByIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Remove value) remove,
    required TResult Function(_RemoveByIndex value) removeByIndex,
    required TResult Function(_Clear value) clear,
  }) {
    return removeByIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_RemoveByIndex value)? removeByIndex,
    TResult? Function(_Clear value)? clear,
  }) {
    return removeByIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Remove value)? remove,
    TResult Function(_RemoveByIndex value)? removeByIndex,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (removeByIndex != null) {
      return removeByIndex(this);
    }
    return orElse();
  }
}

abstract class _RemoveByIndex implements PurchaseOrderDetailTemporaryEvent {
  const factory _RemoveByIndex({required final int index}) =
      _$RemoveByIndexImpl;

  int get index;

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveByIndexImplCopyWith<_$RemoveByIndexImpl> get copyWith =>
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
    extends _$PurchaseOrderDetailTemporaryEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailTemporaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'PurchaseOrderDetailTemporaryEvent.clear()';
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
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)
        add,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        addAll,
    required TResult Function(int id) remove,
    required TResult Function(int index) removeByIndex,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult? Function(int id)? remove,
    TResult? Function(int index)? removeByIndex,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Material? material,
            MaterialUnit materialUnit,
            double quantity,
            MaterialDesign design,
            ProductionOrder batch,
            bool ignoreDuplicate)?
        add,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? addAll,
    TResult Function(int id)? remove,
    TResult Function(int index)? removeByIndex,
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
    required TResult Function(_RemoveByIndex value) removeByIndex,
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
    TResult? Function(_RemoveByIndex value)? removeByIndex,
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
    TResult Function(_RemoveByIndex value)? removeByIndex,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements PurchaseOrderDetailTemporaryEvent {
  const factory _Clear() = _$ClearImpl;
}
