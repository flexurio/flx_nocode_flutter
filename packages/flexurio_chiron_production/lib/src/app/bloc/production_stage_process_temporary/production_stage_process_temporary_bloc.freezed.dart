// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_stage_process_temporary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductStageProcessTemporaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductionStageProcessDetail stageProcess) add,
    required TResult Function(List<ProductionStageProcessDetail> stageProcesses)
        addAll,
    required TResult Function(
            int index, ProductionStageProcessDetail stageProcesses)
        replace,
    required TResult Function(ProductionStageProcessDetail stageProcess) remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductionStageProcessDetail stageProcess)? add,
    TResult? Function(List<ProductionStageProcessDetail> stageProcesses)?
        addAll,
    TResult? Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult? Function(ProductionStageProcessDetail stageProcess)? remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductionStageProcessDetail stageProcess)? add,
    TResult Function(List<ProductionStageProcessDetail> stageProcesses)? addAll,
    TResult Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult Function(ProductionStageProcessDetail stageProcess)? remove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Replace value) replace,
    required TResult Function(_Remove value) remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Replace value)? replace,
    TResult? Function(_Remove value)? remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Replace value)? replace,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStageProcessTemporaryEventCopyWith<$Res> {
  factory $ProductStageProcessTemporaryEventCopyWith(
          ProductStageProcessTemporaryEvent value,
          $Res Function(ProductStageProcessTemporaryEvent) then) =
      _$ProductStageProcessTemporaryEventCopyWithImpl<$Res,
          ProductStageProcessTemporaryEvent>;
}

/// @nodoc
class _$ProductStageProcessTemporaryEventCopyWithImpl<$Res,
        $Val extends ProductStageProcessTemporaryEvent>
    implements $ProductStageProcessTemporaryEventCopyWith<$Res> {
  _$ProductStageProcessTemporaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductionStageProcessDetail stageProcess});
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$ProductStageProcessTemporaryEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageProcess = null,
  }) {
    return _then(_$AddImpl(
      null == stageProcess
          ? _value.stageProcess
          : stageProcess // ignore: cast_nullable_to_non_nullable
              as ProductionStageProcessDetail,
    ));
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl(this.stageProcess);

  @override
  final ProductionStageProcessDetail stageProcess;

  @override
  String toString() {
    return 'ProductStageProcessTemporaryEvent.add(stageProcess: $stageProcess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.stageProcess, stageProcess) ||
                other.stageProcess == stageProcess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stageProcess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductionStageProcessDetail stageProcess) add,
    required TResult Function(List<ProductionStageProcessDetail> stageProcesses)
        addAll,
    required TResult Function(
            int index, ProductionStageProcessDetail stageProcesses)
        replace,
    required TResult Function(ProductionStageProcessDetail stageProcess) remove,
  }) {
    return add(stageProcess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductionStageProcessDetail stageProcess)? add,
    TResult? Function(List<ProductionStageProcessDetail> stageProcesses)?
        addAll,
    TResult? Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult? Function(ProductionStageProcessDetail stageProcess)? remove,
  }) {
    return add?.call(stageProcess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductionStageProcessDetail stageProcess)? add,
    TResult Function(List<ProductionStageProcessDetail> stageProcesses)? addAll,
    TResult Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult Function(ProductionStageProcessDetail stageProcess)? remove,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(stageProcess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Replace value) replace,
    required TResult Function(_Remove value) remove,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Replace value)? replace,
    TResult? Function(_Remove value)? remove,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Replace value)? replace,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements ProductStageProcessTemporaryEvent {
  const factory _Add(final ProductionStageProcessDetail stageProcess) =
      _$AddImpl;

  ProductionStageProcessDetail get stageProcess;
  @JsonKey(ignore: true)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAllImplCopyWith<$Res> {
  factory _$$AddAllImplCopyWith(
          _$AddAllImpl value, $Res Function(_$AddAllImpl) then) =
      __$$AddAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductionStageProcessDetail> stageProcesses});
}

/// @nodoc
class __$$AddAllImplCopyWithImpl<$Res>
    extends _$ProductStageProcessTemporaryEventCopyWithImpl<$Res, _$AddAllImpl>
    implements _$$AddAllImplCopyWith<$Res> {
  __$$AddAllImplCopyWithImpl(
      _$AddAllImpl _value, $Res Function(_$AddAllImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageProcesses = null,
  }) {
    return _then(_$AddAllImpl(
      null == stageProcesses
          ? _value._stageProcesses
          : stageProcesses // ignore: cast_nullable_to_non_nullable
              as List<ProductionStageProcessDetail>,
    ));
  }
}

/// @nodoc

class _$AddAllImpl implements _AddAll {
  const _$AddAllImpl(final List<ProductionStageProcessDetail> stageProcesses)
      : _stageProcesses = stageProcesses;

  final List<ProductionStageProcessDetail> _stageProcesses;
  @override
  List<ProductionStageProcessDetail> get stageProcesses {
    if (_stageProcesses is EqualUnmodifiableListView) return _stageProcesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stageProcesses);
  }

  @override
  String toString() {
    return 'ProductStageProcessTemporaryEvent.addAll(stageProcesses: $stageProcesses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAllImpl &&
            const DeepCollectionEquality()
                .equals(other._stageProcesses, _stageProcesses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_stageProcesses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAllImplCopyWith<_$AddAllImpl> get copyWith =>
      __$$AddAllImplCopyWithImpl<_$AddAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductionStageProcessDetail stageProcess) add,
    required TResult Function(List<ProductionStageProcessDetail> stageProcesses)
        addAll,
    required TResult Function(
            int index, ProductionStageProcessDetail stageProcesses)
        replace,
    required TResult Function(ProductionStageProcessDetail stageProcess) remove,
  }) {
    return addAll(stageProcesses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductionStageProcessDetail stageProcess)? add,
    TResult? Function(List<ProductionStageProcessDetail> stageProcesses)?
        addAll,
    TResult? Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult? Function(ProductionStageProcessDetail stageProcess)? remove,
  }) {
    return addAll?.call(stageProcesses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductionStageProcessDetail stageProcess)? add,
    TResult Function(List<ProductionStageProcessDetail> stageProcesses)? addAll,
    TResult Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult Function(ProductionStageProcessDetail stageProcess)? remove,
    required TResult orElse(),
  }) {
    if (addAll != null) {
      return addAll(stageProcesses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Replace value) replace,
    required TResult Function(_Remove value) remove,
  }) {
    return addAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Replace value)? replace,
    TResult? Function(_Remove value)? remove,
  }) {
    return addAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Replace value)? replace,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (addAll != null) {
      return addAll(this);
    }
    return orElse();
  }
}

abstract class _AddAll implements ProductStageProcessTemporaryEvent {
  const factory _AddAll(
      final List<ProductionStageProcessDetail> stageProcesses) = _$AddAllImpl;

  List<ProductionStageProcessDetail> get stageProcesses;
  @JsonKey(ignore: true)
  _$$AddAllImplCopyWith<_$AddAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReplaceImplCopyWith<$Res> {
  factory _$$ReplaceImplCopyWith(
          _$ReplaceImpl value, $Res Function(_$ReplaceImpl) then) =
      __$$ReplaceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, ProductionStageProcessDetail stageProcesses});
}

/// @nodoc
class __$$ReplaceImplCopyWithImpl<$Res>
    extends _$ProductStageProcessTemporaryEventCopyWithImpl<$Res, _$ReplaceImpl>
    implements _$$ReplaceImplCopyWith<$Res> {
  __$$ReplaceImplCopyWithImpl(
      _$ReplaceImpl _value, $Res Function(_$ReplaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? stageProcesses = null,
  }) {
    return _then(_$ReplaceImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == stageProcesses
          ? _value.stageProcesses
          : stageProcesses // ignore: cast_nullable_to_non_nullable
              as ProductionStageProcessDetail,
    ));
  }
}

/// @nodoc

class _$ReplaceImpl implements _Replace {
  const _$ReplaceImpl(this.index, this.stageProcesses);

  @override
  final int index;
  @override
  final ProductionStageProcessDetail stageProcesses;

  @override
  String toString() {
    return 'ProductStageProcessTemporaryEvent.replace(index: $index, stageProcesses: $stageProcesses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplaceImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.stageProcesses, stageProcesses) ||
                other.stageProcesses == stageProcesses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, stageProcesses);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplaceImplCopyWith<_$ReplaceImpl> get copyWith =>
      __$$ReplaceImplCopyWithImpl<_$ReplaceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductionStageProcessDetail stageProcess) add,
    required TResult Function(List<ProductionStageProcessDetail> stageProcesses)
        addAll,
    required TResult Function(
            int index, ProductionStageProcessDetail stageProcesses)
        replace,
    required TResult Function(ProductionStageProcessDetail stageProcess) remove,
  }) {
    return replace(index, stageProcesses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductionStageProcessDetail stageProcess)? add,
    TResult? Function(List<ProductionStageProcessDetail> stageProcesses)?
        addAll,
    TResult? Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult? Function(ProductionStageProcessDetail stageProcess)? remove,
  }) {
    return replace?.call(index, stageProcesses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductionStageProcessDetail stageProcess)? add,
    TResult Function(List<ProductionStageProcessDetail> stageProcesses)? addAll,
    TResult Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult Function(ProductionStageProcessDetail stageProcess)? remove,
    required TResult orElse(),
  }) {
    if (replace != null) {
      return replace(index, stageProcesses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Replace value) replace,
    required TResult Function(_Remove value) remove,
  }) {
    return replace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Replace value)? replace,
    TResult? Function(_Remove value)? remove,
  }) {
    return replace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Replace value)? replace,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (replace != null) {
      return replace(this);
    }
    return orElse();
  }
}

abstract class _Replace implements ProductStageProcessTemporaryEvent {
  const factory _Replace(
          final int index, final ProductionStageProcessDetail stageProcesses) =
      _$ReplaceImpl;

  int get index;
  ProductionStageProcessDetail get stageProcesses;
  @JsonKey(ignore: true)
  _$$ReplaceImplCopyWith<_$ReplaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductionStageProcessDetail stageProcess});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$ProductStageProcessTemporaryEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageProcess = null,
  }) {
    return _then(_$RemoveImpl(
      null == stageProcess
          ? _value.stageProcess
          : stageProcess // ignore: cast_nullable_to_non_nullable
              as ProductionStageProcessDetail,
    ));
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl(this.stageProcess);

  @override
  final ProductionStageProcessDetail stageProcess;

  @override
  String toString() {
    return 'ProductStageProcessTemporaryEvent.remove(stageProcess: $stageProcess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.stageProcess, stageProcess) ||
                other.stageProcess == stageProcess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stageProcess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductionStageProcessDetail stageProcess) add,
    required TResult Function(List<ProductionStageProcessDetail> stageProcesses)
        addAll,
    required TResult Function(
            int index, ProductionStageProcessDetail stageProcesses)
        replace,
    required TResult Function(ProductionStageProcessDetail stageProcess) remove,
  }) {
    return remove(stageProcess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductionStageProcessDetail stageProcess)? add,
    TResult? Function(List<ProductionStageProcessDetail> stageProcesses)?
        addAll,
    TResult? Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult? Function(ProductionStageProcessDetail stageProcess)? remove,
  }) {
    return remove?.call(stageProcess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductionStageProcessDetail stageProcess)? add,
    TResult Function(List<ProductionStageProcessDetail> stageProcesses)? addAll,
    TResult Function(int index, ProductionStageProcessDetail stageProcesses)?
        replace,
    TResult Function(ProductionStageProcessDetail stageProcess)? remove,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(stageProcess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_AddAll value) addAll,
    required TResult Function(_Replace value) replace,
    required TResult Function(_Remove value) remove,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_AddAll value)? addAll,
    TResult? Function(_Replace value)? replace,
    TResult? Function(_Remove value)? remove,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_AddAll value)? addAll,
    TResult Function(_Replace value)? replace,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements ProductStageProcessTemporaryEvent {
  const factory _Remove(final ProductionStageProcessDetail stageProcess) =
      _$RemoveImpl;

  ProductionStageProcessDetail get stageProcess;
  @JsonKey(ignore: true)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
