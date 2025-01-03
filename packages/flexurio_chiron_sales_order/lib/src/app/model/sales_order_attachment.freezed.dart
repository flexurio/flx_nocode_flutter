// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrderAttachment _$SalesOrderAttachmentFromJson(Map<String, dynamic> json) {
  return _SalesOrderAttachment.fromJson(json);
}

/// @nodoc
mixin _$SalesOrderAttachment {
  String get document => throw _privateConstructorUsedError;
  @JsonKey(name: 'revision_no')
  int get revisionNo => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'extension_document')
  String? get extensionDocument => throw _privateConstructorUsedError;

  /// Serializes this SalesOrderAttachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesOrderAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderAttachmentCopyWith<SalesOrderAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderAttachmentCopyWith<$Res> {
  factory $SalesOrderAttachmentCopyWith(SalesOrderAttachment value,
          $Res Function(SalesOrderAttachment) then) =
      _$SalesOrderAttachmentCopyWithImpl<$Res, SalesOrderAttachment>;
  @useResult
  $Res call(
      {String document,
      @JsonKey(name: 'revision_no') int revisionNo,
      String? description,
      @JsonKey(name: 'extension_document') String? extensionDocument});
}

/// @nodoc
class _$SalesOrderAttachmentCopyWithImpl<$Res,
        $Val extends SalesOrderAttachment>
    implements $SalesOrderAttachmentCopyWith<$Res> {
  _$SalesOrderAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
    Object? revisionNo = null,
    Object? description = freezed,
    Object? extensionDocument = freezed,
  }) {
    return _then(_value.copyWith(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as String,
      revisionNo: null == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extensionDocument: freezed == extensionDocument
          ? _value.extensionDocument
          : extensionDocument // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrderAttachmentImplCopyWith<$Res>
    implements $SalesOrderAttachmentCopyWith<$Res> {
  factory _$$SalesOrderAttachmentImplCopyWith(_$SalesOrderAttachmentImpl value,
          $Res Function(_$SalesOrderAttachmentImpl) then) =
      __$$SalesOrderAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String document,
      @JsonKey(name: 'revision_no') int revisionNo,
      String? description,
      @JsonKey(name: 'extension_document') String? extensionDocument});
}

/// @nodoc
class __$$SalesOrderAttachmentImplCopyWithImpl<$Res>
    extends _$SalesOrderAttachmentCopyWithImpl<$Res, _$SalesOrderAttachmentImpl>
    implements _$$SalesOrderAttachmentImplCopyWith<$Res> {
  __$$SalesOrderAttachmentImplCopyWithImpl(_$SalesOrderAttachmentImpl _value,
      $Res Function(_$SalesOrderAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderAttachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
    Object? revisionNo = null,
    Object? description = freezed,
    Object? extensionDocument = freezed,
  }) {
    return _then(_$SalesOrderAttachmentImpl(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as String,
      revisionNo: null == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extensionDocument: freezed == extensionDocument
          ? _value.extensionDocument
          : extensionDocument // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrderAttachmentImpl extends _SalesOrderAttachment {
  const _$SalesOrderAttachmentImpl(
      {required this.document,
      @JsonKey(name: 'revision_no') required this.revisionNo,
      this.description,
      @JsonKey(name: 'extension_document') this.extensionDocument})
      : super._();

  factory _$SalesOrderAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesOrderAttachmentImplFromJson(json);

  @override
  final String document;
  @override
  @JsonKey(name: 'revision_no')
  final int revisionNo;
  @override
  final String? description;
  @override
  @JsonKey(name: 'extension_document')
  final String? extensionDocument;

  @override
  String toString() {
    return 'SalesOrderAttachment(document: $document, revisionNo: $revisionNo, description: $description, extensionDocument: $extensionDocument)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderAttachmentImpl &&
            (identical(other.document, document) ||
                other.document == document) &&
            (identical(other.revisionNo, revisionNo) ||
                other.revisionNo == revisionNo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.extensionDocument, extensionDocument) ||
                other.extensionDocument == extensionDocument));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, document, revisionNo, description, extensionDocument);

  /// Create a copy of SalesOrderAttachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderAttachmentImplCopyWith<_$SalesOrderAttachmentImpl>
      get copyWith =>
          __$$SalesOrderAttachmentImplCopyWithImpl<_$SalesOrderAttachmentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrderAttachmentImplToJson(
      this,
    );
  }
}

abstract class _SalesOrderAttachment extends SalesOrderAttachment {
  const factory _SalesOrderAttachment(
      {required final String document,
      @JsonKey(name: 'revision_no') required final int revisionNo,
      final String? description,
      @JsonKey(name: 'extension_document')
      final String? extensionDocument}) = _$SalesOrderAttachmentImpl;
  const _SalesOrderAttachment._() : super._();

  factory _SalesOrderAttachment.fromJson(Map<String, dynamic> json) =
      _$SalesOrderAttachmentImpl.fromJson;

  @override
  String get document;
  @override
  @JsonKey(name: 'revision_no')
  int get revisionNo;
  @override
  String? get description;
  @override
  @JsonKey(name: 'extension_document')
  String? get extensionDocument;

  /// Create a copy of SalesOrderAttachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesOrderAttachmentImplCopyWith<_$SalesOrderAttachmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
