// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sertificate_documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SertificateDocuments _$SertificateDocumentsFromJson(Map<String, dynamic> json) {
  return _SertificateDocuments.fromJson(json);
}

/// @nodoc
mixin _$SertificateDocuments {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SertificateDocuments to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SertificateDocuments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SertificateDocumentsCopyWith<SertificateDocuments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SertificateDocumentsCopyWith<$Res> {
  factory $SertificateDocumentsCopyWith(SertificateDocuments value,
          $Res Function(SertificateDocuments) then) =
      _$SertificateDocumentsCopyWithImpl<$Res, SertificateDocuments>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$SertificateDocumentsCopyWithImpl<$Res,
        $Val extends SertificateDocuments>
    implements $SertificateDocumentsCopyWith<$Res> {
  _$SertificateDocumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SertificateDocuments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SertificateDocumentsImplCopyWith<$Res>
    implements $SertificateDocumentsCopyWith<$Res> {
  factory _$$SertificateDocumentsImplCopyWith(_$SertificateDocumentsImpl value,
          $Res Function(_$SertificateDocumentsImpl) then) =
      __$$SertificateDocumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$SertificateDocumentsImplCopyWithImpl<$Res>
    extends _$SertificateDocumentsCopyWithImpl<$Res, _$SertificateDocumentsImpl>
    implements _$$SertificateDocumentsImplCopyWith<$Res> {
  __$$SertificateDocumentsImplCopyWithImpl(_$SertificateDocumentsImpl _value,
      $Res Function(_$SertificateDocumentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SertificateDocuments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SertificateDocumentsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SertificateDocumentsImpl extends _SertificateDocuments {
  const _$SertificateDocumentsImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt})
      : super._();

  factory _$SertificateDocumentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SertificateDocumentsImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  /// Create a copy of SertificateDocuments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SertificateDocumentsImplCopyWith<_$SertificateDocumentsImpl>
      get copyWith =>
          __$$SertificateDocumentsImplCopyWithImpl<_$SertificateDocumentsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SertificateDocumentsImplToJson(
      this,
    );
  }
}

abstract class _SertificateDocuments extends SertificateDocuments {
  const factory _SertificateDocuments(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt}) = _$SertificateDocumentsImpl;
  const _SertificateDocuments._() : super._();

  factory _SertificateDocuments.fromJson(Map<String, dynamic> json) =
      _$SertificateDocumentsImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;

  /// Create a copy of SertificateDocuments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SertificateDocumentsImplCopyWith<_$SertificateDocumentsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
