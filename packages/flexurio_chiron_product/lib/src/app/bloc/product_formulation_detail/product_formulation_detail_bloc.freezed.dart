// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_formulation_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductFormulationDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material, double quantity) create,
    required TResult Function(ProductFormulationDetailTemporary data) update,
    required TResult Function(int id) delete,
    required TResult Function() clear,
    required TResult Function() see,
    required TResult Function(
            int? id, Product? product, ProductFormulationScale? scale)
        fetch,
    required TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)
        addAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, double quantity)? create,
    TResult? Function(ProductFormulationDetailTemporary data)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clear,
    TResult? Function()? see,
    TResult? Function(
            int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult? Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, double quantity)? create,
    TResult Function(ProductFormulationDetailTemporary data)? update,
    TResult Function(int id)? delete,
    TResult Function()? clear,
    TResult Function()? see,
    TResult Function(int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Clear value) clear,
    required TResult Function(_See value) see,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddAll value) addAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_See value)? see,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddAll value)? addAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Clear value)? clear,
    TResult Function(_See value)? see,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddAll value)? addAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFormulationDetailEventCopyWith<$Res> {
  factory $ProductFormulationDetailEventCopyWith(
          ProductFormulationDetailEvent value,
          $Res Function(ProductFormulationDetailEvent) then) =
      _$ProductFormulationDetailEventCopyWithImpl<$Res,
          ProductFormulationDetailEvent>;
}

/// @nodoc
class _$ProductFormulationDetailEventCopyWithImpl<$Res,
        $Val extends ProductFormulationDetailEvent>
    implements $ProductFormulationDetailEventCopyWith<$Res> {
  _$ProductFormulationDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Material material, double quantity});

  $MaterialCopyWith<$Res> get material;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$ProductFormulationDetailEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
    Object? quantity = null,
  }) {
    return _then(_$CreateImpl(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
    });
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl({required this.material, required this.quantity});

  @override
  final Material material;
  @override
  final double quantity;

  @override
  String toString() {
    return 'ProductFormulationDetailEvent.create(material: $material, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material, double quantity) create,
    required TResult Function(ProductFormulationDetailTemporary data) update,
    required TResult Function(int id) delete,
    required TResult Function() clear,
    required TResult Function() see,
    required TResult Function(
            int? id, Product? product, ProductFormulationScale? scale)
        fetch,
    required TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)
        addAll,
  }) {
    return create(material, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, double quantity)? create,
    TResult? Function(ProductFormulationDetailTemporary data)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clear,
    TResult? Function()? see,
    TResult? Function(
            int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult? Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
  }) {
    return create?.call(material, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, double quantity)? create,
    TResult Function(ProductFormulationDetailTemporary data)? update,
    TResult Function(int id)? delete,
    TResult Function()? clear,
    TResult Function()? see,
    TResult Function(int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(material, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Clear value) clear,
    required TResult Function(_See value) see,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddAll value) addAll,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_See value)? see,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddAll value)? addAll,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Clear value)? clear,
    TResult Function(_See value)? see,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddAll value)? addAll,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements ProductFormulationDetailEvent {
  const factory _Create(
      {required final Material material,
      required final double quantity}) = _$CreateImpl;

  Material get material;
  double get quantity;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductFormulationDetailTemporary data});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$ProductFormulationDetailEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UpdateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductFormulationDetailTemporary,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.data);

  @override
  final ProductFormulationDetailTemporary data;

  @override
  String toString() {
    return 'ProductFormulationDetailEvent.update(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material, double quantity) create,
    required TResult Function(ProductFormulationDetailTemporary data) update,
    required TResult Function(int id) delete,
    required TResult Function() clear,
    required TResult Function() see,
    required TResult Function(
            int? id, Product? product, ProductFormulationScale? scale)
        fetch,
    required TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)
        addAll,
  }) {
    return update(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, double quantity)? create,
    TResult? Function(ProductFormulationDetailTemporary data)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clear,
    TResult? Function()? see,
    TResult? Function(
            int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult? Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
  }) {
    return update?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, double quantity)? create,
    TResult Function(ProductFormulationDetailTemporary data)? update,
    TResult Function(int id)? delete,
    TResult Function()? clear,
    TResult Function()? see,
    TResult Function(int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Clear value) clear,
    required TResult Function(_See value) see,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddAll value) addAll,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_See value)? see,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddAll value)? addAll,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Clear value)? clear,
    TResult Function(_See value)? see,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddAll value)? addAll,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements ProductFormulationDetailEvent {
  const factory _Update(final ProductFormulationDetailTemporary data) =
      _$UpdateImpl;

  ProductFormulationDetailTemporary get data;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$ProductFormulationDetailEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ProductFormulationDetailEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material, double quantity) create,
    required TResult Function(ProductFormulationDetailTemporary data) update,
    required TResult Function(int id) delete,
    required TResult Function() clear,
    required TResult Function() see,
    required TResult Function(
            int? id, Product? product, ProductFormulationScale? scale)
        fetch,
    required TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)
        addAll,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, double quantity)? create,
    TResult? Function(ProductFormulationDetailTemporary data)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clear,
    TResult? Function()? see,
    TResult? Function(
            int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult? Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, double quantity)? create,
    TResult Function(ProductFormulationDetailTemporary data)? update,
    TResult Function(int id)? delete,
    TResult Function()? clear,
    TResult Function()? see,
    TResult Function(int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Clear value) clear,
    required TResult Function(_See value) see,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddAll value) addAll,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_See value)? see,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddAll value)? addAll,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Clear value)? clear,
    TResult Function(_See value)? see,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddAll value)? addAll,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ProductFormulationDetailEvent {
  const factory _Delete(final int id) = _$DeleteImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
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
    extends _$ProductFormulationDetailEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'ProductFormulationDetailEvent.clear()';
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
    required TResult Function(Material material, double quantity) create,
    required TResult Function(ProductFormulationDetailTemporary data) update,
    required TResult Function(int id) delete,
    required TResult Function() clear,
    required TResult Function() see,
    required TResult Function(
            int? id, Product? product, ProductFormulationScale? scale)
        fetch,
    required TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)
        addAll,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, double quantity)? create,
    TResult? Function(ProductFormulationDetailTemporary data)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clear,
    TResult? Function()? see,
    TResult? Function(
            int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult? Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, double quantity)? create,
    TResult Function(ProductFormulationDetailTemporary data)? update,
    TResult Function(int id)? delete,
    TResult Function()? clear,
    TResult Function()? see,
    TResult Function(int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
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
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Clear value) clear,
    required TResult Function(_See value) see,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddAll value) addAll,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_See value)? see,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddAll value)? addAll,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Clear value)? clear,
    TResult Function(_See value)? see,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddAll value)? addAll,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements ProductFormulationDetailEvent {
  const factory _Clear() = _$ClearImpl;
}

/// @nodoc
abstract class _$$SeeImplCopyWith<$Res> {
  factory _$$SeeImplCopyWith(_$SeeImpl value, $Res Function(_$SeeImpl) then) =
      __$$SeeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SeeImplCopyWithImpl<$Res>
    extends _$ProductFormulationDetailEventCopyWithImpl<$Res, _$SeeImpl>
    implements _$$SeeImplCopyWith<$Res> {
  __$$SeeImplCopyWithImpl(_$SeeImpl _value, $Res Function(_$SeeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SeeImpl implements _See {
  const _$SeeImpl();

  @override
  String toString() {
    return 'ProductFormulationDetailEvent.see()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SeeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material, double quantity) create,
    required TResult Function(ProductFormulationDetailTemporary data) update,
    required TResult Function(int id) delete,
    required TResult Function() clear,
    required TResult Function() see,
    required TResult Function(
            int? id, Product? product, ProductFormulationScale? scale)
        fetch,
    required TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)
        addAll,
  }) {
    return see();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, double quantity)? create,
    TResult? Function(ProductFormulationDetailTemporary data)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clear,
    TResult? Function()? see,
    TResult? Function(
            int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult? Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
  }) {
    return see?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, double quantity)? create,
    TResult Function(ProductFormulationDetailTemporary data)? update,
    TResult Function(int id)? delete,
    TResult Function()? clear,
    TResult Function()? see,
    TResult Function(int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
    required TResult orElse(),
  }) {
    if (see != null) {
      return see();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Clear value) clear,
    required TResult Function(_See value) see,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddAll value) addAll,
  }) {
    return see(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_See value)? see,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddAll value)? addAll,
  }) {
    return see?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Clear value)? clear,
    TResult Function(_See value)? see,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddAll value)? addAll,
    required TResult orElse(),
  }) {
    if (see != null) {
      return see(this);
    }
    return orElse();
  }
}

abstract class _See implements ProductFormulationDetailEvent {
  const factory _See() = _$SeeImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id, Product? product, ProductFormulationScale? scale});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ProductFormulationDetailEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? scale = freezed,
  }) {
    return _then(_$FetchImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as ProductFormulationScale?,
    ));
  }

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
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({this.id, this.product, this.scale});

  @override
  final int? id;
  @override
  final Product? product;
  @override
  final ProductFormulationScale? scale;

  @override
  String toString() {
    return 'ProductFormulationDetailEvent.fetch(id: $id, product: $product, scale: $scale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, product, scale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material, double quantity) create,
    required TResult Function(ProductFormulationDetailTemporary data) update,
    required TResult Function(int id) delete,
    required TResult Function() clear,
    required TResult Function() see,
    required TResult Function(
            int? id, Product? product, ProductFormulationScale? scale)
        fetch,
    required TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)
        addAll,
  }) {
    return fetch(id, product, scale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, double quantity)? create,
    TResult? Function(ProductFormulationDetailTemporary data)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clear,
    TResult? Function()? see,
    TResult? Function(
            int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult? Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
  }) {
    return fetch?.call(id, product, scale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, double quantity)? create,
    TResult Function(ProductFormulationDetailTemporary data)? update,
    TResult Function(int id)? delete,
    TResult Function()? clear,
    TResult Function()? see,
    TResult Function(int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(id, product, scale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Clear value) clear,
    required TResult Function(_See value) see,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddAll value) addAll,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_See value)? see,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddAll value)? addAll,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Clear value)? clear,
    TResult Function(_See value)? see,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddAll value)? addAll,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ProductFormulationDetailEvent {
  const factory _Fetch(
      {final int? id,
      final Product? product,
      final ProductFormulationScale? scale}) = _$FetchImpl;

  int? get id;
  Product? get product;
  ProductFormulationScale? get scale;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAllImplCopyWith<$Res> {
  factory _$$AddAllImplCopyWith(
          _$AddAllImpl value, $Res Function(_$AddAllImpl) then) =
      __$$AddAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductFormulationDetailTemporary> productFormulationDetail});
}

/// @nodoc
class __$$AddAllImplCopyWithImpl<$Res>
    extends _$ProductFormulationDetailEventCopyWithImpl<$Res, _$AddAllImpl>
    implements _$$AddAllImplCopyWith<$Res> {
  __$$AddAllImplCopyWithImpl(
      _$AddAllImpl _value, $Res Function(_$AddAllImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productFormulationDetail = null,
  }) {
    return _then(_$AddAllImpl(
      productFormulationDetail: null == productFormulationDetail
          ? _value._productFormulationDetail
          : productFormulationDetail // ignore: cast_nullable_to_non_nullable
              as List<ProductFormulationDetailTemporary>,
    ));
  }
}

/// @nodoc

class _$AddAllImpl implements _AddAll {
  const _$AddAllImpl(
      {required final List<ProductFormulationDetailTemporary>
          productFormulationDetail})
      : _productFormulationDetail = productFormulationDetail;

  final List<ProductFormulationDetailTemporary> _productFormulationDetail;
  @override
  List<ProductFormulationDetailTemporary> get productFormulationDetail {
    if (_productFormulationDetail is EqualUnmodifiableListView)
      return _productFormulationDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productFormulationDetail);
  }

  @override
  String toString() {
    return 'ProductFormulationDetailEvent.addAll(productFormulationDetail: $productFormulationDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAllImpl &&
            const DeepCollectionEquality().equals(
                other._productFormulationDetail, _productFormulationDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productFormulationDetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAllImplCopyWith<_$AddAllImpl> get copyWith =>
      __$$AddAllImplCopyWithImpl<_$AddAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material, double quantity) create,
    required TResult Function(ProductFormulationDetailTemporary data) update,
    required TResult Function(int id) delete,
    required TResult Function() clear,
    required TResult Function() see,
    required TResult Function(
            int? id, Product? product, ProductFormulationScale? scale)
        fetch,
    required TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)
        addAll,
  }) {
    return addAll(productFormulationDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, double quantity)? create,
    TResult? Function(ProductFormulationDetailTemporary data)? update,
    TResult? Function(int id)? delete,
    TResult? Function()? clear,
    TResult? Function()? see,
    TResult? Function(
            int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult? Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
  }) {
    return addAll?.call(productFormulationDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, double quantity)? create,
    TResult Function(ProductFormulationDetailTemporary data)? update,
    TResult Function(int id)? delete,
    TResult Function()? clear,
    TResult Function()? see,
    TResult Function(int? id, Product? product, ProductFormulationScale? scale)?
        fetch,
    TResult Function(
            List<ProductFormulationDetailTemporary> productFormulationDetail)?
        addAll,
    required TResult orElse(),
  }) {
    if (addAll != null) {
      return addAll(productFormulationDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Clear value) clear,
    required TResult Function(_See value) see,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddAll value) addAll,
  }) {
    return addAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_See value)? see,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddAll value)? addAll,
  }) {
    return addAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Clear value)? clear,
    TResult Function(_See value)? see,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddAll value)? addAll,
    required TResult orElse(),
  }) {
    if (addAll != null) {
      return addAll(this);
    }
    return orElse();
  }
}

abstract class _AddAll implements ProductFormulationDetailEvent {
  const factory _AddAll(
      {required final List<ProductFormulationDetailTemporary>
          productFormulationDetail}) = _$AddAllImpl;

  List<ProductFormulationDetailTemporary> get productFormulationDetail;
  @JsonKey(ignore: true)
  _$$AddAllImplCopyWith<_$AddAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
