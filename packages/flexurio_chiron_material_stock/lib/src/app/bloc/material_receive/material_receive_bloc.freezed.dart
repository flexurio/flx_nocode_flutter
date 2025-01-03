// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_receive_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialReceiveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
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
abstract class $MaterialReceiveStateCopyWith<$Res> {
  factory $MaterialReceiveStateCopyWith(MaterialReceiveState value,
          $Res Function(MaterialReceiveState) then) =
      _$MaterialReceiveStateCopyWithImpl<$Res, MaterialReceiveState>;
}

/// @nodoc
class _$MaterialReceiveStateCopyWithImpl<$Res,
        $Val extends MaterialReceiveState>
    implements $MaterialReceiveStateCopyWith<$Res> {
  _$MaterialReceiveStateCopyWithImpl(this._value, this._then);

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
  $Res call(
      {List<MaterialReceiveDetail> materialReceiveDetail,
      MaterialReceiveCreateTypeForm? typeForm,
      MaterialReceiveCreateForm? createFormMaterialReceive});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MaterialReceiveStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialReceiveDetail = null,
    Object? typeForm = freezed,
    Object? createFormMaterialReceive = freezed,
  }) {
    return _then(_$InitialImpl(
      materialReceiveDetail: null == materialReceiveDetail
          ? _value._materialReceiveDetail
          : materialReceiveDetail // ignore: cast_nullable_to_non_nullable
              as List<MaterialReceiveDetail>,
      typeForm: freezed == typeForm
          ? _value.typeForm
          : typeForm // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveCreateTypeForm?,
      createFormMaterialReceive: freezed == createFormMaterialReceive
          ? _value.createFormMaterialReceive
          : createFormMaterialReceive // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveCreateForm?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<MaterialReceiveDetail> materialReceiveDetail,
      this.typeForm,
      this.createFormMaterialReceive})
      : _materialReceiveDetail = materialReceiveDetail;

  final List<MaterialReceiveDetail> _materialReceiveDetail;
  @override
  List<MaterialReceiveDetail> get materialReceiveDetail {
    if (_materialReceiveDetail is EqualUnmodifiableListView)
      return _materialReceiveDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialReceiveDetail);
  }

  @override
  final MaterialReceiveCreateTypeForm? typeForm;
  @override
  final MaterialReceiveCreateForm? createFormMaterialReceive;

  @override
  String toString() {
    return 'MaterialReceiveState.initial(materialReceiveDetail: $materialReceiveDetail, typeForm: $typeForm, createFormMaterialReceive: $createFormMaterialReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._materialReceiveDetail, _materialReceiveDetail) &&
            (identical(other.typeForm, typeForm) ||
                other.typeForm == typeForm) &&
            (identical(other.createFormMaterialReceive,
                    createFormMaterialReceive) ||
                other.createFormMaterialReceive == createFormMaterialReceive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_materialReceiveDetail),
      typeForm,
      createFormMaterialReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(materialReceiveDetail, typeForm, createFormMaterialReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(
        materialReceiveDetail, typeForm, createFormMaterialReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          materialReceiveDetail, typeForm, createFormMaterialReceive);
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

abstract class _Initial implements MaterialReceiveState {
  const factory _Initial(
          {required final List<MaterialReceiveDetail> materialReceiveDetail,
          final MaterialReceiveCreateTypeForm? typeForm,
          final MaterialReceiveCreateForm? createFormMaterialReceive}) =
      _$InitialImpl;

  List<MaterialReceiveDetail> get materialReceiveDetail;
  MaterialReceiveCreateTypeForm? get typeForm;
  MaterialReceiveCreateForm? get createFormMaterialReceive;
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
    extends _$MaterialReceiveStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'MaterialReceiveState.loading()';
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
    required TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
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

abstract class _Loading implements MaterialReceiveState {
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
    extends _$MaterialReceiveStateCopyWithImpl<$Res, _$SuccessImpl>
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
    return 'MaterialReceiveState.success()';
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
    required TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
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

abstract class _Success implements MaterialReceiveState {
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
    extends _$MaterialReceiveStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'MaterialReceiveState.error(error: $error)';
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
    required TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<MaterialReceiveDetail> materialReceiveDetail,
            MaterialReceiveCreateTypeForm? typeForm,
            MaterialReceiveCreateForm? createFormMaterialReceive)?
        initial,
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

abstract class _Error implements MaterialReceiveState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialReceiveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReceiveEventCopyWith<$Res> {
  factory $MaterialReceiveEventCopyWith(MaterialReceiveEvent value,
          $Res Function(MaterialReceiveEvent) then) =
      _$MaterialReceiveEventCopyWithImpl<$Res, MaterialReceiveEvent>;
}

/// @nodoc
class _$MaterialReceiveEventCopyWithImpl<$Res,
        $Val extends MaterialReceiveEvent>
    implements $MaterialReceiveEventCopyWith<$Res> {
  _$MaterialReceiveEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialReceive materialReceive});

  $MaterialReceiveCopyWith<$Res> get materialReceive;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialReceive = null,
  }) {
    return _then(_$InitializeImpl(
      null == materialReceive
          ? _value.materialReceive
          : materialReceive // ignore: cast_nullable_to_non_nullable
              as MaterialReceive,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialReceiveCopyWith<$Res> get materialReceive {
    return $MaterialReceiveCopyWith<$Res>(_value.materialReceive, (value) {
      return _then(_value.copyWith(materialReceive: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.materialReceive);

  @override
  final MaterialReceive materialReceive;

  @override
  String toString() {
    return 'MaterialReceiveEvent.initialize(materialReceive: $materialReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.materialReceive, materialReceive) ||
                other.materialReceive == materialReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return initialize(materialReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return initialize?.call(materialReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(materialReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements MaterialReceiveEvent {
  const factory _Initialize(final MaterialReceive materialReceive) =
      _$InitializeImpl;

  MaterialReceive get materialReceive;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTypeImplCopyWith<$Res> {
  factory _$$CreateTypeImplCopyWith(
          _$CreateTypeImpl value, $Res Function(_$CreateTypeImpl) then) =
      __$$CreateTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm});
}

/// @nodoc
class __$$CreateTypeImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res, _$CreateTypeImpl>
    implements _$$CreateTypeImplCopyWith<$Res> {
  __$$CreateTypeImplCopyWithImpl(
      _$CreateTypeImpl _value, $Res Function(_$CreateTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialReceiveCreateTypeForm = null,
  }) {
    return _then(_$CreateTypeImpl(
      null == materialReceiveCreateTypeForm
          ? _value.materialReceiveCreateTypeForm
          : materialReceiveCreateTypeForm // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveCreateTypeForm,
    ));
  }
}

/// @nodoc

class _$CreateTypeImpl implements _CreateType {
  const _$CreateTypeImpl(this.materialReceiveCreateTypeForm);

  @override
  final MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm;

  @override
  String toString() {
    return 'MaterialReceiveEvent.createType(materialReceiveCreateTypeForm: $materialReceiveCreateTypeForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTypeImpl &&
            (identical(other.materialReceiveCreateTypeForm,
                    materialReceiveCreateTypeForm) ||
                other.materialReceiveCreateTypeForm ==
                    materialReceiveCreateTypeForm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialReceiveCreateTypeForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTypeImplCopyWith<_$CreateTypeImpl> get copyWith =>
      __$$CreateTypeImplCopyWithImpl<_$CreateTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return createType(materialReceiveCreateTypeForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return createType?.call(materialReceiveCreateTypeForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (createType != null) {
      return createType(materialReceiveCreateTypeForm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return createType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return createType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (createType != null) {
      return createType(this);
    }
    return orElse();
  }
}

abstract class _CreateType implements MaterialReceiveEvent {
  const factory _CreateType(
          final MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm) =
      _$CreateTypeImpl;

  MaterialReceiveCreateTypeForm get materialReceiveCreateTypeForm;
  @JsonKey(ignore: true)
  _$$CreateTypeImplCopyWith<_$CreateTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFormPurchaseOrderImplCopyWith<$Res> {
  factory _$$CreateFormPurchaseOrderImplCopyWith(
          _$CreateFormPurchaseOrderImpl value,
          $Res Function(_$CreateFormPurchaseOrderImpl) then) =
      __$$CreateFormPurchaseOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialReceiveCreateForm createFormMaterialReceive});
}

/// @nodoc
class __$$CreateFormPurchaseOrderImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res,
        _$CreateFormPurchaseOrderImpl>
    implements _$$CreateFormPurchaseOrderImplCopyWith<$Res> {
  __$$CreateFormPurchaseOrderImplCopyWithImpl(
      _$CreateFormPurchaseOrderImpl _value,
      $Res Function(_$CreateFormPurchaseOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createFormMaterialReceive = null,
  }) {
    return _then(_$CreateFormPurchaseOrderImpl(
      null == createFormMaterialReceive
          ? _value.createFormMaterialReceive
          : createFormMaterialReceive // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveCreateForm,
    ));
  }
}

/// @nodoc

class _$CreateFormPurchaseOrderImpl implements _CreateFormPurchaseOrder {
  const _$CreateFormPurchaseOrderImpl(this.createFormMaterialReceive);

  @override
  final MaterialReceiveCreateForm createFormMaterialReceive;

  @override
  String toString() {
    return 'MaterialReceiveEvent.createForm(createFormMaterialReceive: $createFormMaterialReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFormPurchaseOrderImpl &&
            (identical(other.createFormMaterialReceive,
                    createFormMaterialReceive) ||
                other.createFormMaterialReceive == createFormMaterialReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createFormMaterialReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFormPurchaseOrderImplCopyWith<_$CreateFormPurchaseOrderImpl>
      get copyWith => __$$CreateFormPurchaseOrderImplCopyWithImpl<
          _$CreateFormPurchaseOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return createForm(createFormMaterialReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return createForm?.call(createFormMaterialReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (createForm != null) {
      return createForm(createFormMaterialReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return createForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return createForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (createForm != null) {
      return createForm(this);
    }
    return orElse();
  }
}

abstract class _CreateFormPurchaseOrder implements MaterialReceiveEvent {
  const factory _CreateFormPurchaseOrder(
          final MaterialReceiveCreateForm createFormMaterialReceive) =
      _$CreateFormPurchaseOrderImpl;

  MaterialReceiveCreateForm get createFormMaterialReceive;
  @JsonKey(ignore: true)
  _$$CreateFormPurchaseOrderImplCopyWith<_$CreateFormPurchaseOrderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateMaterialImplCopyWith<$Res> {
  factory _$$CreateMaterialImplCopyWith(_$CreateMaterialImpl value,
          $Res Function(_$CreateMaterialImpl) then) =
      __$$CreateMaterialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialReceiveDetail> materials});
}

/// @nodoc
class __$$CreateMaterialImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res, _$CreateMaterialImpl>
    implements _$$CreateMaterialImplCopyWith<$Res> {
  __$$CreateMaterialImplCopyWithImpl(
      _$CreateMaterialImpl _value, $Res Function(_$CreateMaterialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
  }) {
    return _then(_$CreateMaterialImpl(
      null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialReceiveDetail>,
    ));
  }
}

/// @nodoc

class _$CreateMaterialImpl implements _CreateMaterial {
  const _$CreateMaterialImpl(final List<MaterialReceiveDetail> materials)
      : _materials = materials;

  final List<MaterialReceiveDetail> _materials;
  @override
  List<MaterialReceiveDetail> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'MaterialReceiveEvent.createMaterial(materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateMaterialImpl &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateMaterialImplCopyWith<_$CreateMaterialImpl> get copyWith =>
      __$$CreateMaterialImplCopyWithImpl<_$CreateMaterialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return createMaterial(materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return createMaterial?.call(materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (createMaterial != null) {
      return createMaterial(materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return createMaterial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return createMaterial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (createMaterial != null) {
      return createMaterial(this);
    }
    return orElse();
  }
}

abstract class _CreateMaterial implements MaterialReceiveEvent {
  const factory _CreateMaterial(final List<MaterialReceiveDetail> materials) =
      _$CreateMaterialImpl;

  List<MaterialReceiveDetail> get materials;
  @JsonKey(ignore: true)
  _$$CreateMaterialImplCopyWith<_$CreateMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaterialAddImplCopyWith<$Res> {
  factory _$$MaterialAddImplCopyWith(
          _$MaterialAddImpl value, $Res Function(_$MaterialAddImpl) then) =
      __$$MaterialAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialReceiveDetail materialReceiveDetail});

  $MaterialReceiveDetailCopyWith<$Res> get materialReceiveDetail;
}

/// @nodoc
class __$$MaterialAddImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res, _$MaterialAddImpl>
    implements _$$MaterialAddImplCopyWith<$Res> {
  __$$MaterialAddImplCopyWithImpl(
      _$MaterialAddImpl _value, $Res Function(_$MaterialAddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialReceiveDetail = null,
  }) {
    return _then(_$MaterialAddImpl(
      null == materialReceiveDetail
          ? _value.materialReceiveDetail
          : materialReceiveDetail // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveDetail,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialReceiveDetailCopyWith<$Res> get materialReceiveDetail {
    return $MaterialReceiveDetailCopyWith<$Res>(_value.materialReceiveDetail,
        (value) {
      return _then(_value.copyWith(materialReceiveDetail: value));
    });
  }
}

/// @nodoc

class _$MaterialAddImpl implements MaterialAdd {
  const _$MaterialAddImpl(this.materialReceiveDetail);

  @override
  final MaterialReceiveDetail materialReceiveDetail;

  @override
  String toString() {
    return 'MaterialReceiveEvent.materialAdd(materialReceiveDetail: $materialReceiveDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialAddImpl &&
            (identical(other.materialReceiveDetail, materialReceiveDetail) ||
                other.materialReceiveDetail == materialReceiveDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialReceiveDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialAddImplCopyWith<_$MaterialAddImpl> get copyWith =>
      __$$MaterialAddImplCopyWithImpl<_$MaterialAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return materialAdd(materialReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return materialAdd?.call(materialReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (materialAdd != null) {
      return materialAdd(materialReceiveDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return materialAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return materialAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (materialAdd != null) {
      return materialAdd(this);
    }
    return orElse();
  }
}

abstract class MaterialAdd implements MaterialReceiveEvent {
  const factory MaterialAdd(final MaterialReceiveDetail materialReceiveDetail) =
      _$MaterialAddImpl;

  MaterialReceiveDetail get materialReceiveDetail;
  @JsonKey(ignore: true)
  _$$MaterialAddImplCopyWith<_$MaterialAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaterialRemoveImplCopyWith<$Res> {
  factory _$$MaterialRemoveImplCopyWith(_$MaterialRemoveImpl value,
          $Res Function(_$MaterialRemoveImpl) then) =
      __$$MaterialRemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialReceiveDetail materialReceiveDetail});

  $MaterialReceiveDetailCopyWith<$Res> get materialReceiveDetail;
}

/// @nodoc
class __$$MaterialRemoveImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res, _$MaterialRemoveImpl>
    implements _$$MaterialRemoveImplCopyWith<$Res> {
  __$$MaterialRemoveImplCopyWithImpl(
      _$MaterialRemoveImpl _value, $Res Function(_$MaterialRemoveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialReceiveDetail = null,
  }) {
    return _then(_$MaterialRemoveImpl(
      null == materialReceiveDetail
          ? _value.materialReceiveDetail
          : materialReceiveDetail // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveDetail,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialReceiveDetailCopyWith<$Res> get materialReceiveDetail {
    return $MaterialReceiveDetailCopyWith<$Res>(_value.materialReceiveDetail,
        (value) {
      return _then(_value.copyWith(materialReceiveDetail: value));
    });
  }
}

/// @nodoc

class _$MaterialRemoveImpl implements _MaterialRemove {
  const _$MaterialRemoveImpl(this.materialReceiveDetail);

  @override
  final MaterialReceiveDetail materialReceiveDetail;

  @override
  String toString() {
    return 'MaterialReceiveEvent.materialRemove(materialReceiveDetail: $materialReceiveDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRemoveImpl &&
            (identical(other.materialReceiveDetail, materialReceiveDetail) ||
                other.materialReceiveDetail == materialReceiveDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialReceiveDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialRemoveImplCopyWith<_$MaterialRemoveImpl> get copyWith =>
      __$$MaterialRemoveImplCopyWithImpl<_$MaterialRemoveImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return materialRemove(materialReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return materialRemove?.call(materialReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (materialRemove != null) {
      return materialRemove(materialReceiveDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return materialRemove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return materialRemove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (materialRemove != null) {
      return materialRemove(this);
    }
    return orElse();
  }
}

abstract class _MaterialRemove implements MaterialReceiveEvent {
  const factory _MaterialRemove(
      final MaterialReceiveDetail materialReceiveDetail) = _$MaterialRemoveImpl;

  MaterialReceiveDetail get materialReceiveDetail;
  @JsonKey(ignore: true)
  _$$MaterialRemoveImplCopyWith<_$MaterialRemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MaterialReceive materialReceive,
      String description,
      WarehouseMaterialReceive warehouse,
      String deliveryOrderNo,
      DateTime? deliveryOrderDate});

  $MaterialReceiveCopyWith<$Res> get materialReceive;
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialReceive = null,
    Object? description = null,
    Object? warehouse = null,
    Object? deliveryOrderNo = null,
    Object? deliveryOrderDate = freezed,
  }) {
    return _then(_$EditImpl(
      materialReceive: null == materialReceive
          ? _value.materialReceive
          : materialReceive // ignore: cast_nullable_to_non_nullable
              as MaterialReceive,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as WarehouseMaterialReceive,
      deliveryOrderNo: null == deliveryOrderNo
          ? _value.deliveryOrderNo
          : deliveryOrderNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialReceiveCopyWith<$Res> get materialReceive {
    return $MaterialReceiveCopyWith<$Res>(_value.materialReceive, (value) {
      return _then(_value.copyWith(materialReceive: value));
    });
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(
      {required this.materialReceive,
      required this.description,
      required this.warehouse,
      required this.deliveryOrderNo,
      required this.deliveryOrderDate});

  @override
  final MaterialReceive materialReceive;
  @override
  final String description;
  @override
  final WarehouseMaterialReceive warehouse;
  @override
  final String deliveryOrderNo;
  @override
  final DateTime? deliveryOrderDate;

  @override
  String toString() {
    return 'MaterialReceiveEvent.editForm(materialReceive: $materialReceive, description: $description, warehouse: $warehouse, deliveryOrderNo: $deliveryOrderNo, deliveryOrderDate: $deliveryOrderDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.materialReceive, materialReceive) ||
                other.materialReceive == materialReceive) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.deliveryOrderNo, deliveryOrderNo) ||
                other.deliveryOrderNo == deliveryOrderNo) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialReceive, description,
      warehouse, deliveryOrderNo, deliveryOrderDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return editForm(materialReceive, description, warehouse, deliveryOrderNo,
        deliveryOrderDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return editForm?.call(materialReceive, description, warehouse,
        deliveryOrderNo, deliveryOrderDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (editForm != null) {
      return editForm(materialReceive, description, warehouse, deliveryOrderNo,
          deliveryOrderDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return editForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return editForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (editForm != null) {
      return editForm(this);
    }
    return orElse();
  }
}

abstract class _Edit implements MaterialReceiveEvent {
  const factory _Edit(
      {required final MaterialReceive materialReceive,
      required final String description,
      required final WarehouseMaterialReceive warehouse,
      required final String deliveryOrderNo,
      required final DateTime? deliveryOrderDate}) = _$EditImpl;

  MaterialReceive get materialReceive;
  String get description;
  WarehouseMaterialReceive get warehouse;
  String get deliveryOrderNo;
  DateTime? get deliveryOrderDate;
  @JsonKey(ignore: true)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl();

  @override
  String toString() {
    return 'MaterialReceiveEvent.submit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements MaterialReceiveEvent {
  const factory _Submit() = _$SubmitImpl;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialReceive materialReceive});

  $MaterialReceiveCopyWith<$Res> get materialReceive;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$MaterialReceiveEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialReceive = null,
  }) {
    return _then(_$DeleteImpl(
      materialReceive: null == materialReceive
          ? _value.materialReceive
          : materialReceive // ignore: cast_nullable_to_non_nullable
              as MaterialReceive,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialReceiveCopyWith<$Res> get materialReceive {
    return $MaterialReceiveCopyWith<$Res>(_value.materialReceive, (value) {
      return _then(_value.copyWith(materialReceive: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({required this.materialReceive});

  @override
  final MaterialReceive materialReceive;

  @override
  String toString() {
    return 'MaterialReceiveEvent.delete(materialReceive: $materialReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.materialReceive, materialReceive) ||
                other.materialReceive == materialReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MaterialReceive materialReceive) initialize,
    required TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)
        createType,
    required TResult Function(
            MaterialReceiveCreateForm createFormMaterialReceive)
        createForm,
    required TResult Function(List<MaterialReceiveDetail> materials)
        createMaterial,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialAdd,
    required TResult Function(MaterialReceiveDetail materialReceiveDetail)
        materialRemove,
    required TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)
        editForm,
    required TResult Function() submit,
    required TResult Function(MaterialReceive materialReceive) delete,
  }) {
    return delete(materialReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MaterialReceive materialReceive)? initialize,
    TResult? Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult? Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult? Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult? Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult? Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult? Function()? submit,
    TResult? Function(MaterialReceive materialReceive)? delete,
  }) {
    return delete?.call(materialReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MaterialReceive materialReceive)? initialize,
    TResult Function(
            MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm)?
        createType,
    TResult Function(MaterialReceiveCreateForm createFormMaterialReceive)?
        createForm,
    TResult Function(List<MaterialReceiveDetail> materials)? createMaterial,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)? materialAdd,
    TResult Function(MaterialReceiveDetail materialReceiveDetail)?
        materialRemove,
    TResult Function(
            MaterialReceive materialReceive,
            String description,
            WarehouseMaterialReceive warehouse,
            String deliveryOrderNo,
            DateTime? deliveryOrderDate)?
        editForm,
    TResult Function()? submit,
    TResult Function(MaterialReceive materialReceive)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(materialReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateType value) createType,
    required TResult Function(_CreateFormPurchaseOrder value) createForm,
    required TResult Function(_CreateMaterial value) createMaterial,
    required TResult Function(MaterialAdd value) materialAdd,
    required TResult Function(_MaterialRemove value) materialRemove,
    required TResult Function(_Edit value) editForm,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateType value)? createType,
    TResult? Function(_CreateFormPurchaseOrder value)? createForm,
    TResult? Function(_CreateMaterial value)? createMaterial,
    TResult? Function(MaterialAdd value)? materialAdd,
    TResult? Function(_MaterialRemove value)? materialRemove,
    TResult? Function(_Edit value)? editForm,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateType value)? createType,
    TResult Function(_CreateFormPurchaseOrder value)? createForm,
    TResult Function(_CreateMaterial value)? createMaterial,
    TResult Function(MaterialAdd value)? materialAdd,
    TResult Function(_MaterialRemove value)? materialRemove,
    TResult Function(_Edit value)? editForm,
    TResult Function(_Submit value)? submit,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements MaterialReceiveEvent {
  const factory _Delete({required final MaterialReceive materialReceive}) =
      _$DeleteImpl;

  MaterialReceive get materialReceive;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
