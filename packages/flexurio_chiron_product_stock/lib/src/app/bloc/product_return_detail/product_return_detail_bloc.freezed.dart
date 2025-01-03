// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductReturnDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReturnDetail> products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnDetailStateCopyWith<$Res> {
  factory $ProductReturnDetailStateCopyWith(ProductReturnDetailState value,
          $Res Function(ProductReturnDetailState) then) =
      _$ProductReturnDetailStateCopyWithImpl<$Res, ProductReturnDetailState>;
}

/// @nodoc
class _$ProductReturnDetailStateCopyWithImpl<$Res,
        $Val extends ProductReturnDetailState>
    implements $ProductReturnDetailStateCopyWith<$Res> {
  _$ProductReturnDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductReturnDetail> products});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$InitialImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductReturnDetail>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(final List<ProductReturnDetail> products)
      : _products = products;

  final List<ProductReturnDetail> _products;
  @override
  List<ProductReturnDetail> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductReturnDetailState.initial(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReturnDetail> products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductReturnDetailState {
  const factory _Initial(final List<ProductReturnDetail> products) =
      _$InitialImpl;

  List<ProductReturnDetail> get products;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductReturnDetailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReturnDetail> products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductReturnDetailState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'ProductReturnDetailState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReturnDetail> products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ProductReturnDetailState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ProductReturnDetailState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReturnDetail> products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProductReturnDetailState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductReturnDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)
        create,
    required TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)
        edit,
    required TResult Function(int id) delete,
    required TResult Function(int id) checkQC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult? Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? checkQC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult Function(int id)? delete,
    TResult Function(int id)? checkQC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_CheckQC value) checkQC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_CheckQC value)? checkQC,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_CheckQC value)? checkQC,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnDetailEventCopyWith<$Res> {
  factory $ProductReturnDetailEventCopyWith(ProductReturnDetailEvent value,
          $Res Function(ProductReturnDetailEvent) then) =
      _$ProductReturnDetailEventCopyWithImpl<$Res, ProductReturnDetailEvent>;
}

/// @nodoc
class _$ProductReturnDetailEventCopyWithImpl<$Res,
        $Val extends ProductReturnDetailEvent>
    implements $ProductReturnDetailEventCopyWith<$Res> {
  _$ProductReturnDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductAddImplCopyWith<$Res> {
  factory _$$ProductAddImplCopyWith(
          _$ProductAddImpl value, $Res Function(_$ProductAddImpl) then) =
      __$$ProductAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturnDetail products});

  $ProductReturnDetailCopyWith<$Res> get products;
}

/// @nodoc
class __$$ProductAddImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailEventCopyWithImpl<$Res, _$ProductAddImpl>
    implements _$$ProductAddImplCopyWith<$Res> {
  __$$ProductAddImplCopyWithImpl(
      _$ProductAddImpl _value, $Res Function(_$ProductAddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductAddImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as ProductReturnDetail,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReturnDetailCopyWith<$Res> get products {
    return $ProductReturnDetailCopyWith<$Res>(_value.products, (value) {
      return _then(_value.copyWith(products: value));
    });
  }
}

/// @nodoc

class _$ProductAddImpl implements _ProductAdd {
  const _$ProductAddImpl({required this.products});

  @override
  final ProductReturnDetail products;

  @override
  String toString() {
    return 'ProductReturnDetailEvent.productAdd(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAddImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAddImplCopyWith<_$ProductAddImpl> get copyWith =>
      __$$ProductAddImplCopyWithImpl<_$ProductAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)
        create,
    required TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)
        edit,
    required TResult Function(int id) delete,
    required TResult Function(int id) checkQC,
  }) {
    return productAdd(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult? Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? checkQC,
  }) {
    return productAdd?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult Function(int id)? delete,
    TResult Function(int id)? checkQC,
    required TResult orElse(),
  }) {
    if (productAdd != null) {
      return productAdd(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_CheckQC value) checkQC,
  }) {
    return productAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_CheckQC value)? checkQC,
  }) {
    return productAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_CheckQC value)? checkQC,
    required TResult orElse(),
  }) {
    if (productAdd != null) {
      return productAdd(this);
    }
    return orElse();
  }
}

abstract class _ProductAdd implements ProductReturnDetailEvent {
  const factory _ProductAdd({required final ProductReturnDetail products}) =
      _$ProductAddImpl;

  ProductReturnDetail get products;
  @JsonKey(ignore: true)
  _$$ProductAddImplCopyWith<_$ProductAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ProductReturn productReturn,
      Product product,
      ProductionOrder productionOrder,
      String deliveryOrderId,
      MaterialUnit materialUnit,
      double productPrice,
      double quantity,
      double totalProductPrice,
      DateTime expirationDate});

  $ProductReturnCopyWith<$Res> get productReturn;
  $ProductCopyWith<$Res> get product;
  $ProductionOrderCopyWith<$Res> get productionOrder;
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReturn = null,
    Object? product = null,
    Object? productionOrder = null,
    Object? deliveryOrderId = null,
    Object? materialUnit = null,
    Object? productPrice = null,
    Object? quantity = null,
    Object? totalProductPrice = null,
    Object? expirationDate = null,
  }) {
    return _then(_$CreateImpl(
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get productionOrder {
    return $ProductionOrderCopyWith<$Res>(_value.productionOrder, (value) {
      return _then(_value.copyWith(productionOrder: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value));
    });
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      {required this.productReturn,
      required this.product,
      required this.productionOrder,
      required this.deliveryOrderId,
      required this.materialUnit,
      required this.productPrice,
      required this.quantity,
      required this.totalProductPrice,
      required this.expirationDate});

  @override
  final ProductReturn productReturn;
  @override
  final Product product;
  @override
  final ProductionOrder productionOrder;
  @override
  final String deliveryOrderId;
  @override
  final MaterialUnit materialUnit;
  @override
  final double productPrice;
  @override
  final double quantity;
  @override
  final double totalProductPrice;
  @override
  final DateTime expirationDate;

  @override
  String toString() {
    return 'ProductReturnDetailEvent.create(productReturn: $productReturn, product: $product, productionOrder: $productionOrder, deliveryOrderId: $deliveryOrderId, materialUnit: $materialUnit, productPrice: $productPrice, quantity: $quantity, totalProductPrice: $totalProductPrice, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                other.totalProductPrice == totalProductPrice) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productReturn,
      product,
      productionOrder,
      deliveryOrderId,
      materialUnit,
      productPrice,
      quantity,
      totalProductPrice,
      expirationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)
        create,
    required TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)
        edit,
    required TResult Function(int id) delete,
    required TResult Function(int id) checkQC,
  }) {
    return create(
        productReturn,
        product,
        productionOrder,
        deliveryOrderId,
        materialUnit,
        productPrice,
        quantity,
        totalProductPrice,
        expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult? Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? checkQC,
  }) {
    return create?.call(
        productReturn,
        product,
        productionOrder,
        deliveryOrderId,
        materialUnit,
        productPrice,
        quantity,
        totalProductPrice,
        expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult Function(int id)? delete,
    TResult Function(int id)? checkQC,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(
          productReturn,
          product,
          productionOrder,
          deliveryOrderId,
          materialUnit,
          productPrice,
          quantity,
          totalProductPrice,
          expirationDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_CheckQC value) checkQC,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_CheckQC value)? checkQC,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_CheckQC value)? checkQC,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements ProductReturnDetailEvent {
  const factory _Create(
      {required final ProductReturn productReturn,
      required final Product product,
      required final ProductionOrder productionOrder,
      required final String deliveryOrderId,
      required final MaterialUnit materialUnit,
      required final double productPrice,
      required final double quantity,
      required final double totalProductPrice,
      required final DateTime expirationDate}) = _$CreateImpl;

  ProductReturn get productReturn;
  Product get product;
  ProductionOrder get productionOrder;
  String get deliveryOrderId;
  MaterialUnit get materialUnit;
  double get productPrice;
  double get quantity;
  double get totalProductPrice;
  DateTime get expirationDate;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      int productPrice,
      int quantity,
      int totalProductPrice,
      DateTime expirationDate});
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productPrice = null,
    Object? quantity = null,
    Object? totalProductPrice = null,
    Object? expirationDate = null,
  }) {
    return _then(_$EditImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(
      {required this.id,
      required this.productPrice,
      required this.quantity,
      required this.totalProductPrice,
      required this.expirationDate});

  @override
  final int id;
  @override
  final int productPrice;
  @override
  final int quantity;
  @override
  final int totalProductPrice;
  @override
  final DateTime expirationDate;

  @override
  String toString() {
    return 'ProductReturnDetailEvent.edit(id: $id, productPrice: $productPrice, quantity: $quantity, totalProductPrice: $totalProductPrice, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                other.totalProductPrice == totalProductPrice) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productPrice, quantity,
      totalProductPrice, expirationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)
        create,
    required TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)
        edit,
    required TResult Function(int id) delete,
    required TResult Function(int id) checkQC,
  }) {
    return edit(id, productPrice, quantity, totalProductPrice, expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult? Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? checkQC,
  }) {
    return edit?.call(
        id, productPrice, quantity, totalProductPrice, expirationDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult Function(int id)? delete,
    TResult Function(int id)? checkQC,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(
          id, productPrice, quantity, totalProductPrice, expirationDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_CheckQC value) checkQC,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_CheckQC value)? checkQC,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_CheckQC value)? checkQC,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements ProductReturnDetailEvent {
  const factory _Edit(
      {required final int id,
      required final int productPrice,
      required final int quantity,
      required final int totalProductPrice,
      required final DateTime expirationDate}) = _$EditImpl;

  int get id;
  int get productPrice;
  int get quantity;
  int get totalProductPrice;
  DateTime get expirationDate;
  @JsonKey(ignore: true)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
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
    extends _$ProductReturnDetailEventCopyWithImpl<$Res, _$DeleteImpl>
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'ProductReturnDetailEvent.delete(id: $id)';
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
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)
        create,
    required TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)
        edit,
    required TResult Function(int id) delete,
    required TResult Function(int id) checkQC,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult? Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? checkQC,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult Function(int id)? delete,
    TResult Function(int id)? checkQC,
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
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_CheckQC value) checkQC,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_CheckQC value)? checkQC,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_CheckQC value)? checkQC,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ProductReturnDetailEvent {
  const factory _Delete({required final int id}) = _$DeleteImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckQCImplCopyWith<$Res> {
  factory _$$CheckQCImplCopyWith(
          _$CheckQCImpl value, $Res Function(_$CheckQCImpl) then) =
      __$$CheckQCImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$CheckQCImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailEventCopyWithImpl<$Res, _$CheckQCImpl>
    implements _$$CheckQCImplCopyWith<$Res> {
  __$$CheckQCImplCopyWithImpl(
      _$CheckQCImpl _value, $Res Function(_$CheckQCImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CheckQCImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckQCImpl implements _CheckQC {
  const _$CheckQCImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'ProductReturnDetailEvent.checkQC(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckQCImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckQCImplCopyWith<_$CheckQCImpl> get copyWith =>
      __$$CheckQCImplCopyWithImpl<_$CheckQCImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)
        create,
    required TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)
        edit,
    required TResult Function(int id) delete,
    required TResult Function(int id) checkQC,
  }) {
    return checkQC(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult? Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult? Function(int id)? delete,
    TResult? Function(int id)? checkQC,
  }) {
    return checkQC?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(
            ProductReturn productReturn,
            Product product,
            ProductionOrder productionOrder,
            String deliveryOrderId,
            MaterialUnit materialUnit,
            double productPrice,
            double quantity,
            double totalProductPrice,
            DateTime expirationDate)?
        create,
    TResult Function(int id, int productPrice, int quantity,
            int totalProductPrice, DateTime expirationDate)?
        edit,
    TResult Function(int id)? delete,
    TResult Function(int id)? checkQC,
    required TResult orElse(),
  }) {
    if (checkQC != null) {
      return checkQC(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_CheckQC value) checkQC,
  }) {
    return checkQC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_CheckQC value)? checkQC,
  }) {
    return checkQC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_CheckQC value)? checkQC,
    required TResult orElse(),
  }) {
    if (checkQC != null) {
      return checkQC(this);
    }
    return orElse();
  }
}

abstract class _CheckQC implements ProductReturnDetailEvent {
  const factory _CheckQC({required final int id}) = _$CheckQCImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$CheckQCImplCopyWith<_$CheckQCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
