// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_receive_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceReceiveDocument _$InvoiceReceiveDocumentFromJson(
    Map<String, dynamic> json) {
  return _InvoiceReceiveDocument.fromJson(json);
}

/// @nodoc
mixin _$InvoiceReceiveDocument {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'document')
  String get documentPath => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this InvoiceReceiveDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceReceiveDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceReceiveDocumentCopyWith<InvoiceReceiveDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceReceiveDocumentCopyWith<$Res> {
  factory $InvoiceReceiveDocumentCopyWith(InvoiceReceiveDocument value,
          $Res Function(InvoiceReceiveDocument) then) =
      _$InvoiceReceiveDocumentCopyWithImpl<$Res, InvoiceReceiveDocument>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'document') String documentPath,
      String description,
      String name});
}

/// @nodoc
class _$InvoiceReceiveDocumentCopyWithImpl<$Res,
        $Val extends InvoiceReceiveDocument>
    implements $InvoiceReceiveDocumentCopyWith<$Res> {
  _$InvoiceReceiveDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceReceiveDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentPath = null,
    Object? description = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      documentPath: null == documentPath
          ? _value.documentPath
          : documentPath // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceReceiveDocumentImplCopyWith<$Res>
    implements $InvoiceReceiveDocumentCopyWith<$Res> {
  factory _$$InvoiceReceiveDocumentImplCopyWith(
          _$InvoiceReceiveDocumentImpl value,
          $Res Function(_$InvoiceReceiveDocumentImpl) then) =
      __$$InvoiceReceiveDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'document') String documentPath,
      String description,
      String name});
}

/// @nodoc
class __$$InvoiceReceiveDocumentImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveDocumentCopyWithImpl<$Res,
        _$InvoiceReceiveDocumentImpl>
    implements _$$InvoiceReceiveDocumentImplCopyWith<$Res> {
  __$$InvoiceReceiveDocumentImplCopyWithImpl(
      _$InvoiceReceiveDocumentImpl _value,
      $Res Function(_$InvoiceReceiveDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentPath = null,
    Object? description = null,
    Object? name = null,
  }) {
    return _then(_$InvoiceReceiveDocumentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      documentPath: null == documentPath
          ? _value.documentPath
          : documentPath // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceReceiveDocumentImpl extends _InvoiceReceiveDocument {
  const _$InvoiceReceiveDocumentImpl(
      {required this.id,
      @JsonKey(name: 'document') required this.documentPath,
      required this.description,
      required this.name})
      : super._();

  factory _$InvoiceReceiveDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceReceiveDocumentImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'document')
  final String documentPath;
  @override
  final String description;
  @override
  final String name;

  @override
  String toString() {
    return 'InvoiceReceiveDocument(id: $id, documentPath: $documentPath, description: $description, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceReceiveDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentPath, documentPath) ||
                other.documentPath == documentPath) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, documentPath, description, name);

  /// Create a copy of InvoiceReceiveDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceReceiveDocumentImplCopyWith<_$InvoiceReceiveDocumentImpl>
      get copyWith => __$$InvoiceReceiveDocumentImplCopyWithImpl<
          _$InvoiceReceiveDocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceReceiveDocumentImplToJson(
      this,
    );
  }
}

abstract class _InvoiceReceiveDocument extends InvoiceReceiveDocument {
  const factory _InvoiceReceiveDocument(
      {required final int id,
      @JsonKey(name: 'document') required final String documentPath,
      required final String description,
      required final String name}) = _$InvoiceReceiveDocumentImpl;
  const _InvoiceReceiveDocument._() : super._();

  factory _InvoiceReceiveDocument.fromJson(Map<String, dynamic> json) =
      _$InvoiceReceiveDocumentImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'document')
  String get documentPath;
  @override
  String get description;
  @override
  String get name;

  /// Create a copy of InvoiceReceiveDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceReceiveDocumentImplCopyWith<_$InvoiceReceiveDocumentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
