// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_estimation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JournalEstimation _$JournalEstimationFromJson(Map<String, dynamic> json) {
  return _JournalEstimation.fromJson(json);
}

/// @nodoc
mixin _$JournalEstimation {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', fromJson: JournalEstimationType.fromString)
  JournalEstimationType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get upudatedById => throw _privateConstructorUsedError;

  /// Serializes this JournalEstimation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalEstimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalEstimationCopyWith<JournalEstimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEstimationCopyWith<$Res> {
  factory $JournalEstimationCopyWith(
          JournalEstimation value, $Res Function(JournalEstimation) then) =
      _$JournalEstimationCopyWithImpl<$Res, JournalEstimation>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'type', fromJson: JournalEstimationType.fromString)
      JournalEstimationType type,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int upudatedById});
}

/// @nodoc
class _$JournalEstimationCopyWithImpl<$Res, $Val extends JournalEstimation>
    implements $JournalEstimationCopyWith<$Res> {
  _$JournalEstimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEstimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? upudatedById = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JournalEstimationType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      upudatedById: null == upudatedById
          ? _value.upudatedById
          : upudatedById // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalEstimationImplCopyWith<$Res>
    implements $JournalEstimationCopyWith<$Res> {
  factory _$$JournalEstimationImplCopyWith(_$JournalEstimationImpl value,
          $Res Function(_$JournalEstimationImpl) then) =
      __$$JournalEstimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'type', fromJson: JournalEstimationType.fromString)
      JournalEstimationType type,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int upudatedById});
}

/// @nodoc
class __$$JournalEstimationImplCopyWithImpl<$Res>
    extends _$JournalEstimationCopyWithImpl<$Res, _$JournalEstimationImpl>
    implements _$$JournalEstimationImplCopyWith<$Res> {
  __$$JournalEstimationImplCopyWithImpl(_$JournalEstimationImpl _value,
      $Res Function(_$JournalEstimationImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEstimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? upudatedById = null,
  }) {
    return _then(_$JournalEstimationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JournalEstimationType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      upudatedById: null == upudatedById
          ? _value.upudatedById
          : upudatedById // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalEstimationImpl extends _JournalEstimation {
  _$JournalEstimationImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'type', fromJson: JournalEstimationType.fromString)
      required this.type,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.upudatedById})
      : super._();

  factory _$JournalEstimationImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEstimationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'type', fromJson: JournalEstimationType.fromString)
  final JournalEstimationType type;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int upudatedById;

  @override
  String toString() {
    return 'JournalEstimation(id: $id, name: $name, type: $type, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, upudatedById: $upudatedById)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEstimationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.upudatedById, upudatedById) ||
                other.upudatedById == upudatedById));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, createdAt,
      createdById, updatedAt, upudatedById);

  /// Create a copy of JournalEstimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEstimationImplCopyWith<_$JournalEstimationImpl> get copyWith =>
      __$$JournalEstimationImplCopyWithImpl<_$JournalEstimationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEstimationImplToJson(
      this,
    );
  }
}

abstract class _JournalEstimation extends JournalEstimation {
  factory _JournalEstimation(
          {required final String id,
          required final String name,
          @JsonKey(name: 'type', fromJson: JournalEstimationType.fromString)
          required final JournalEstimationType type,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'created_by_id') required final int createdById,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'updated_by_id') required final int upudatedById}) =
      _$JournalEstimationImpl;
  _JournalEstimation._() : super._();

  factory _JournalEstimation.fromJson(Map<String, dynamic> json) =
      _$JournalEstimationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'type', fromJson: JournalEstimationType.fromString)
  JournalEstimationType get type;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get upudatedById;

  /// Create a copy of JournalEstimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalEstimationImplCopyWith<_$JournalEstimationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
