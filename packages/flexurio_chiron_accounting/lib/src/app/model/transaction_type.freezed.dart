// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionType _$TransactionTypeFromJson(Map<String, dynamic> json) {
  return _TransactionType.fromJson(json);
}

/// @nodoc
mixin _$TransactionType {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag', fromJson: TransactionTypeFlag.fromString)
  TransactionTypeFlag get flag => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', fromJson: TypeTransaction.fromString)
  TypeTransaction get type => throw _privateConstructorUsedError;

  /// Serializes this TransactionType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionTypeCopyWith<TransactionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTypeCopyWith<$Res> {
  factory $TransactionTypeCopyWith(
          TransactionType value, $Res Function(TransactionType) then) =
      _$TransactionTypeCopyWithImpl<$Res, TransactionType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'value') String? value,
      @JsonKey(name: 'flag', fromJson: TransactionTypeFlag.fromString)
      TransactionTypeFlag flag,
      @JsonKey(name: 'type', fromJson: TypeTransaction.fromString)
      TypeTransaction type});
}

/// @nodoc
class _$TransactionTypeCopyWithImpl<$Res, $Val extends TransactionType>
    implements $TransactionTypeCopyWith<$Res> {
  _$TransactionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? value = freezed,
    Object? flag = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as TransactionTypeFlag,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeTransaction,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionTypeImplCopyWith<$Res>
    implements $TransactionTypeCopyWith<$Res> {
  factory _$$TransactionTypeImplCopyWith(_$TransactionTypeImpl value,
          $Res Function(_$TransactionTypeImpl) then) =
      __$$TransactionTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'value') String? value,
      @JsonKey(name: 'flag', fromJson: TransactionTypeFlag.fromString)
      TransactionTypeFlag flag,
      @JsonKey(name: 'type', fromJson: TypeTransaction.fromString)
      TypeTransaction type});
}

/// @nodoc
class __$$TransactionTypeImplCopyWithImpl<$Res>
    extends _$TransactionTypeCopyWithImpl<$Res, _$TransactionTypeImpl>
    implements _$$TransactionTypeImplCopyWith<$Res> {
  __$$TransactionTypeImplCopyWithImpl(
      _$TransactionTypeImpl _value, $Res Function(_$TransactionTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? value = freezed,
    Object? flag = null,
    Object? type = null,
  }) {
    return _then(_$TransactionTypeImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as TransactionTypeFlag,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeTransaction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionTypeImpl extends _TransactionType {
  const _$TransactionTypeImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'value') required this.value,
      @JsonKey(name: 'flag', fromJson: TransactionTypeFlag.fromString)
      required this.flag,
      @JsonKey(name: 'type', fromJson: TypeTransaction.fromString)
      required this.type})
      : super._();

  factory _$TransactionTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionTypeImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'value')
  final String? value;
  @override
  @JsonKey(name: 'flag', fromJson: TransactionTypeFlag.fromString)
  final TransactionTypeFlag flag;
  @override
  @JsonKey(name: 'type', fromJson: TypeTransaction.fromString)
  final TypeTransaction type;

  @override
  String toString() {
    return 'TransactionType(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, name: $name, code: $code, value: $value, flag: $flag, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionTypeImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, createdAt, updatedAt, id, name, code, value, flag, type);

  /// Create a copy of TransactionType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionTypeImplCopyWith<_$TransactionTypeImpl> get copyWith =>
      __$$TransactionTypeImplCopyWithImpl<_$TransactionTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionTypeImplToJson(
      this,
    );
  }
}

abstract class _TransactionType extends TransactionType {
  const factory _TransactionType(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      required final String id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'code') required final String code,
      @JsonKey(name: 'value') required final String? value,
      @JsonKey(name: 'flag', fromJson: TransactionTypeFlag.fromString)
      required final TransactionTypeFlag flag,
      @JsonKey(name: 'type', fromJson: TypeTransaction.fromString)
      required final TypeTransaction type}) = _$TransactionTypeImpl;
  const _TransactionType._() : super._();

  factory _TransactionType.fromJson(Map<String, dynamic> json) =
      _$TransactionTypeImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'value')
  String? get value;
  @override
  @JsonKey(name: 'flag', fromJson: TransactionTypeFlag.fromString)
  TransactionTypeFlag get flag;
  @override
  @JsonKey(name: 'type', fromJson: TypeTransaction.fromString)
  TypeTransaction get type;

  /// Create a copy of TransactionType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionTypeImplCopyWith<_$TransactionTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
