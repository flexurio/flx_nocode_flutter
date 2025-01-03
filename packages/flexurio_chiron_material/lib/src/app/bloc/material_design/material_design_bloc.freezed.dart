// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_design_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialDesignState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
abstract class $MaterialDesignStateCopyWith<$Res> {
  factory $MaterialDesignStateCopyWith(
          MaterialDesignState value, $Res Function(MaterialDesignState) then) =
      _$MaterialDesignStateCopyWithImpl<$Res, MaterialDesignState>;
}

/// @nodoc
class _$MaterialDesignStateCopyWithImpl<$Res, $Val extends MaterialDesignState>
    implements $MaterialDesignStateCopyWith<$Res> {
  _$MaterialDesignStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialDesignState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MaterialDesignStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MaterialDesignState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
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

abstract class _Initial implements MaterialDesignState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MaterialDesignStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MaterialDesignState.loading'));
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Loading implements MaterialDesignState {
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
    extends _$MaterialDesignStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl with DiagnosticableTreeMixin implements _Success {
  const _$SuccessImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MaterialDesignState.success'));
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Success implements MaterialDesignState {
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
    extends _$MaterialDesignStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignState
  /// with the given fields replaced by the non-null parameter values.
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

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MaterialDesignState.error'))
      ..add(DiagnosticsProperty('error', error));
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

  /// Create a copy of MaterialDesignState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Error implements MaterialDesignState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of MaterialDesignState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialDesignEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material,
            ProductFormulation productFormulation, String id, String outsource)
        create,
    required TResult Function(MaterialDesign materialDesign, String description)
        edit,
    required TResult Function(MaterialDesign materialDesign) activate,
    required TResult Function(MaterialDesign materialDesign) deactivate,
    required TResult Function(MaterialDesign materialDesign) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult? Function(MaterialDesign materialDesign, String description)? edit,
    TResult? Function(MaterialDesign materialDesign)? activate,
    TResult? Function(MaterialDesign materialDesign)? deactivate,
    TResult? Function(MaterialDesign materialDesign)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult Function(MaterialDesign materialDesign, String description)? edit,
    TResult Function(MaterialDesign materialDesign)? activate,
    TResult Function(MaterialDesign materialDesign)? deactivate,
    TResult Function(MaterialDesign materialDesign)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialDesignEventCopyWith<$Res> {
  factory $MaterialDesignEventCopyWith(
          MaterialDesignEvent value, $Res Function(MaterialDesignEvent) then) =
      _$MaterialDesignEventCopyWithImpl<$Res, MaterialDesignEvent>;
}

/// @nodoc
class _$MaterialDesignEventCopyWithImpl<$Res, $Val extends MaterialDesignEvent>
    implements $MaterialDesignEventCopyWith<$Res> {
  _$MaterialDesignEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Material material,
      ProductFormulation productFormulation,
      String id,
      String outsource});

  $MaterialCopyWith<$Res> get material;
  $ProductFormulationCopyWith<$Res> get productFormulation;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$MaterialDesignEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
    Object? productFormulation = null,
    Object? id = null,
    Object? outsource = null,
  }) {
    return _then(_$CreateImpl(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      productFormulation: null == productFormulation
          ? _value.productFormulation
          : productFormulation // ignore: cast_nullable_to_non_nullable
              as ProductFormulation,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      outsource: null == outsource
          ? _value.outsource
          : outsource // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
    });
  }

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductFormulationCopyWith<$Res> get productFormulation {
    return $ProductFormulationCopyWith<$Res>(_value.productFormulation,
        (value) {
      return _then(_value.copyWith(productFormulation: value));
    });
  }
}

/// @nodoc

class _$CreateImpl with DiagnosticableTreeMixin implements _Create {
  const _$CreateImpl(
      {required this.material,
      required this.productFormulation,
      required this.id,
      required this.outsource});

  @override
  final Material material;
  @override
  final ProductFormulation productFormulation;
  @override
  final String id;
  @override
  final String outsource;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignEvent.create(material: $material, productFormulation: $productFormulation, id: $id, outsource: $outsource)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MaterialDesignEvent.create'))
      ..add(DiagnosticsProperty('material', material))
      ..add(DiagnosticsProperty('productFormulation', productFormulation))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('outsource', outsource));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.productFormulation, productFormulation) ||
                other.productFormulation == productFormulation) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.outsource, outsource) ||
                other.outsource == outsource));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, material, productFormulation, id, outsource);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material,
            ProductFormulation productFormulation, String id, String outsource)
        create,
    required TResult Function(MaterialDesign materialDesign, String description)
        edit,
    required TResult Function(MaterialDesign materialDesign) activate,
    required TResult Function(MaterialDesign materialDesign) deactivate,
    required TResult Function(MaterialDesign materialDesign) delete,
  }) {
    return create(material, productFormulation, id, outsource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult? Function(MaterialDesign materialDesign, String description)? edit,
    TResult? Function(MaterialDesign materialDesign)? activate,
    TResult? Function(MaterialDesign materialDesign)? deactivate,
    TResult? Function(MaterialDesign materialDesign)? delete,
  }) {
    return create?.call(material, productFormulation, id, outsource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult Function(MaterialDesign materialDesign, String description)? edit,
    TResult Function(MaterialDesign materialDesign)? activate,
    TResult Function(MaterialDesign materialDesign)? deactivate,
    TResult Function(MaterialDesign materialDesign)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(material, productFormulation, id, outsource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_Delete value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_Delete value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements MaterialDesignEvent {
  const factory _Create(
      {required final Material material,
      required final ProductFormulation productFormulation,
      required final String id,
      required final String outsource}) = _$CreateImpl;

  Material get material;
  ProductFormulation get productFormulation;
  String get id;
  String get outsource;

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialDesign materialDesign, String description});

  $MaterialDesignCopyWith<$Res> get materialDesign;
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$MaterialDesignEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialDesign = null,
    Object? description = null,
  }) {
    return _then(_$EditImpl(
      materialDesign: null == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res> get materialDesign {
    return $MaterialDesignCopyWith<$Res>(_value.materialDesign, (value) {
      return _then(_value.copyWith(materialDesign: value));
    });
  }
}

/// @nodoc

class _$EditImpl with DiagnosticableTreeMixin implements _Edit {
  const _$EditImpl({required this.materialDesign, required this.description});

  @override
  final MaterialDesign materialDesign;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignEvent.edit(materialDesign: $materialDesign, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MaterialDesignEvent.edit'))
      ..add(DiagnosticsProperty('materialDesign', materialDesign))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.materialDesign, materialDesign) ||
                other.materialDesign == materialDesign) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialDesign, description);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material,
            ProductFormulation productFormulation, String id, String outsource)
        create,
    required TResult Function(MaterialDesign materialDesign, String description)
        edit,
    required TResult Function(MaterialDesign materialDesign) activate,
    required TResult Function(MaterialDesign materialDesign) deactivate,
    required TResult Function(MaterialDesign materialDesign) delete,
  }) {
    return edit(materialDesign, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult? Function(MaterialDesign materialDesign, String description)? edit,
    TResult? Function(MaterialDesign materialDesign)? activate,
    TResult? Function(MaterialDesign materialDesign)? deactivate,
    TResult? Function(MaterialDesign materialDesign)? delete,
  }) {
    return edit?.call(materialDesign, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult Function(MaterialDesign materialDesign, String description)? edit,
    TResult Function(MaterialDesign materialDesign)? activate,
    TResult Function(MaterialDesign materialDesign)? deactivate,
    TResult Function(MaterialDesign materialDesign)? delete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(materialDesign, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_Delete value) delete,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_Delete value)? delete,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements MaterialDesignEvent {
  const factory _Edit(
      {required final MaterialDesign materialDesign,
      required final String description}) = _$EditImpl;

  MaterialDesign get materialDesign;
  String get description;

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivateImplCopyWith<$Res> {
  factory _$$ActivateImplCopyWith(
          _$ActivateImpl value, $Res Function(_$ActivateImpl) then) =
      __$$ActivateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialDesign materialDesign});

  $MaterialDesignCopyWith<$Res> get materialDesign;
}

/// @nodoc
class __$$ActivateImplCopyWithImpl<$Res>
    extends _$MaterialDesignEventCopyWithImpl<$Res, _$ActivateImpl>
    implements _$$ActivateImplCopyWith<$Res> {
  __$$ActivateImplCopyWithImpl(
      _$ActivateImpl _value, $Res Function(_$ActivateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialDesign = null,
  }) {
    return _then(_$ActivateImpl(
      materialDesign: null == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign,
    ));
  }

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res> get materialDesign {
    return $MaterialDesignCopyWith<$Res>(_value.materialDesign, (value) {
      return _then(_value.copyWith(materialDesign: value));
    });
  }
}

/// @nodoc

class _$ActivateImpl with DiagnosticableTreeMixin implements _Activate {
  const _$ActivateImpl({required this.materialDesign});

  @override
  final MaterialDesign materialDesign;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignEvent.activate(materialDesign: $materialDesign)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MaterialDesignEvent.activate'))
      ..add(DiagnosticsProperty('materialDesign', materialDesign));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateImpl &&
            (identical(other.materialDesign, materialDesign) ||
                other.materialDesign == materialDesign));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialDesign);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateImplCopyWith<_$ActivateImpl> get copyWith =>
      __$$ActivateImplCopyWithImpl<_$ActivateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material,
            ProductFormulation productFormulation, String id, String outsource)
        create,
    required TResult Function(MaterialDesign materialDesign, String description)
        edit,
    required TResult Function(MaterialDesign materialDesign) activate,
    required TResult Function(MaterialDesign materialDesign) deactivate,
    required TResult Function(MaterialDesign materialDesign) delete,
  }) {
    return activate(materialDesign);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult? Function(MaterialDesign materialDesign, String description)? edit,
    TResult? Function(MaterialDesign materialDesign)? activate,
    TResult? Function(MaterialDesign materialDesign)? deactivate,
    TResult? Function(MaterialDesign materialDesign)? delete,
  }) {
    return activate?.call(materialDesign);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult Function(MaterialDesign materialDesign, String description)? edit,
    TResult Function(MaterialDesign materialDesign)? activate,
    TResult Function(MaterialDesign materialDesign)? deactivate,
    TResult Function(MaterialDesign materialDesign)? delete,
    required TResult orElse(),
  }) {
    if (activate != null) {
      return activate(materialDesign);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_Delete value) delete,
  }) {
    return activate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_Delete value)? delete,
  }) {
    return activate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (activate != null) {
      return activate(this);
    }
    return orElse();
  }
}

abstract class _Activate implements MaterialDesignEvent {
  const factory _Activate({required final MaterialDesign materialDesign}) =
      _$ActivateImpl;

  MaterialDesign get materialDesign;

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivateImplCopyWith<_$ActivateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeactivateImplCopyWith<$Res> {
  factory _$$DeactivateImplCopyWith(
          _$DeactivateImpl value, $Res Function(_$DeactivateImpl) then) =
      __$$DeactivateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialDesign materialDesign});

  $MaterialDesignCopyWith<$Res> get materialDesign;
}

/// @nodoc
class __$$DeactivateImplCopyWithImpl<$Res>
    extends _$MaterialDesignEventCopyWithImpl<$Res, _$DeactivateImpl>
    implements _$$DeactivateImplCopyWith<$Res> {
  __$$DeactivateImplCopyWithImpl(
      _$DeactivateImpl _value, $Res Function(_$DeactivateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialDesign = null,
  }) {
    return _then(_$DeactivateImpl(
      materialDesign: null == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign,
    ));
  }

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res> get materialDesign {
    return $MaterialDesignCopyWith<$Res>(_value.materialDesign, (value) {
      return _then(_value.copyWith(materialDesign: value));
    });
  }
}

/// @nodoc

class _$DeactivateImpl with DiagnosticableTreeMixin implements _Deactivate {
  const _$DeactivateImpl({required this.materialDesign});

  @override
  final MaterialDesign materialDesign;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignEvent.deactivate(materialDesign: $materialDesign)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MaterialDesignEvent.deactivate'))
      ..add(DiagnosticsProperty('materialDesign', materialDesign));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeactivateImpl &&
            (identical(other.materialDesign, materialDesign) ||
                other.materialDesign == materialDesign));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialDesign);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeactivateImplCopyWith<_$DeactivateImpl> get copyWith =>
      __$$DeactivateImplCopyWithImpl<_$DeactivateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material,
            ProductFormulation productFormulation, String id, String outsource)
        create,
    required TResult Function(MaterialDesign materialDesign, String description)
        edit,
    required TResult Function(MaterialDesign materialDesign) activate,
    required TResult Function(MaterialDesign materialDesign) deactivate,
    required TResult Function(MaterialDesign materialDesign) delete,
  }) {
    return deactivate(materialDesign);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult? Function(MaterialDesign materialDesign, String description)? edit,
    TResult? Function(MaterialDesign materialDesign)? activate,
    TResult? Function(MaterialDesign materialDesign)? deactivate,
    TResult? Function(MaterialDesign materialDesign)? delete,
  }) {
    return deactivate?.call(materialDesign);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult Function(MaterialDesign materialDesign, String description)? edit,
    TResult Function(MaterialDesign materialDesign)? activate,
    TResult Function(MaterialDesign materialDesign)? deactivate,
    TResult Function(MaterialDesign materialDesign)? delete,
    required TResult orElse(),
  }) {
    if (deactivate != null) {
      return deactivate(materialDesign);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_Delete value) delete,
  }) {
    return deactivate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_Delete value)? delete,
  }) {
    return deactivate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (deactivate != null) {
      return deactivate(this);
    }
    return orElse();
  }
}

abstract class _Deactivate implements MaterialDesignEvent {
  const factory _Deactivate({required final MaterialDesign materialDesign}) =
      _$DeactivateImpl;

  MaterialDesign get materialDesign;

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeactivateImplCopyWith<_$DeactivateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialDesign materialDesign});

  $MaterialDesignCopyWith<$Res> get materialDesign;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$MaterialDesignEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialDesign = null,
  }) {
    return _then(_$DeleteImpl(
      null == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign,
    ));
  }

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res> get materialDesign {
    return $MaterialDesignCopyWith<$Res>(_value.materialDesign, (value) {
      return _then(_value.copyWith(materialDesign: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl with DiagnosticableTreeMixin implements _Delete {
  const _$DeleteImpl(this.materialDesign);

  @override
  final MaterialDesign materialDesign;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MaterialDesignEvent.delete(materialDesign: $materialDesign)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MaterialDesignEvent.delete'))
      ..add(DiagnosticsProperty('materialDesign', materialDesign));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.materialDesign, materialDesign) ||
                other.materialDesign == materialDesign));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialDesign);

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Material material,
            ProductFormulation productFormulation, String id, String outsource)
        create,
    required TResult Function(MaterialDesign materialDesign, String description)
        edit,
    required TResult Function(MaterialDesign materialDesign) activate,
    required TResult Function(MaterialDesign materialDesign) deactivate,
    required TResult Function(MaterialDesign materialDesign) delete,
  }) {
    return delete(materialDesign);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult? Function(MaterialDesign materialDesign, String description)? edit,
    TResult? Function(MaterialDesign materialDesign)? activate,
    TResult? Function(MaterialDesign materialDesign)? deactivate,
    TResult? Function(MaterialDesign materialDesign)? delete,
  }) {
    return delete?.call(materialDesign);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Material material, ProductFormulation productFormulation,
            String id, String outsource)?
        create,
    TResult Function(MaterialDesign materialDesign, String description)? edit,
    TResult Function(MaterialDesign materialDesign)? activate,
    TResult Function(MaterialDesign materialDesign)? deactivate,
    TResult Function(MaterialDesign materialDesign)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(materialDesign);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements MaterialDesignEvent {
  const factory _Delete(final MaterialDesign materialDesign) = _$DeleteImpl;

  MaterialDesign get materialDesign;

  /// Create a copy of MaterialDesignEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
