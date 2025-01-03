// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_loans_borrowings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialLoansBorrowings _$MaterialLoansBorrowingsFromJson(
    Map<String, dynamic> json) {
  return _MaterialLoansBorrowings.fromJson(json);
}

/// @nodoc
mixin _$MaterialLoansBorrowings {
  @JsonKey(name: 'value_summary')
  int get valueSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_issue_type_id')
  String? get materialIssueTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_issue_type_name')
  String? get materialIssueTypeName => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;

  /// Serializes this MaterialLoansBorrowings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialLoansBorrowings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialLoansBorrowingsCopyWith<MaterialLoansBorrowings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialLoansBorrowingsCopyWith<$Res> {
  factory $MaterialLoansBorrowingsCopyWith(MaterialLoansBorrowings value,
          $Res Function(MaterialLoansBorrowings) then) =
      _$MaterialLoansBorrowingsCopyWithImpl<$Res, MaterialLoansBorrowings>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value_summary') int valueSummary,
      @JsonKey(name: 'material_issue_type_id') String? materialIssueTypeId,
      @JsonKey(name: 'material_issue_type_name') String? materialIssueTypeName,
      int? value});
}

/// @nodoc
class _$MaterialLoansBorrowingsCopyWithImpl<$Res,
        $Val extends MaterialLoansBorrowings>
    implements $MaterialLoansBorrowingsCopyWith<$Res> {
  _$MaterialLoansBorrowingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialLoansBorrowings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueSummary = null,
    Object? materialIssueTypeId = freezed,
    Object? materialIssueTypeName = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      valueSummary: null == valueSummary
          ? _value.valueSummary
          : valueSummary // ignore: cast_nullable_to_non_nullable
              as int,
      materialIssueTypeId: freezed == materialIssueTypeId
          ? _value.materialIssueTypeId
          : materialIssueTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      materialIssueTypeName: freezed == materialIssueTypeName
          ? _value.materialIssueTypeName
          : materialIssueTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialLoansBorrowingsImplCopyWith<$Res>
    implements $MaterialLoansBorrowingsCopyWith<$Res> {
  factory _$$MaterialLoansBorrowingsImplCopyWith(
          _$MaterialLoansBorrowingsImpl value,
          $Res Function(_$MaterialLoansBorrowingsImpl) then) =
      __$$MaterialLoansBorrowingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value_summary') int valueSummary,
      @JsonKey(name: 'material_issue_type_id') String? materialIssueTypeId,
      @JsonKey(name: 'material_issue_type_name') String? materialIssueTypeName,
      int? value});
}

/// @nodoc
class __$$MaterialLoansBorrowingsImplCopyWithImpl<$Res>
    extends _$MaterialLoansBorrowingsCopyWithImpl<$Res,
        _$MaterialLoansBorrowingsImpl>
    implements _$$MaterialLoansBorrowingsImplCopyWith<$Res> {
  __$$MaterialLoansBorrowingsImplCopyWithImpl(
      _$MaterialLoansBorrowingsImpl _value,
      $Res Function(_$MaterialLoansBorrowingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialLoansBorrowings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueSummary = null,
    Object? materialIssueTypeId = freezed,
    Object? materialIssueTypeName = freezed,
    Object? value = freezed,
  }) {
    return _then(_$MaterialLoansBorrowingsImpl(
      valueSummary: null == valueSummary
          ? _value.valueSummary
          : valueSummary // ignore: cast_nullable_to_non_nullable
              as int,
      materialIssueTypeId: freezed == materialIssueTypeId
          ? _value.materialIssueTypeId
          : materialIssueTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      materialIssueTypeName: freezed == materialIssueTypeName
          ? _value.materialIssueTypeName
          : materialIssueTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialLoansBorrowingsImpl extends _MaterialLoansBorrowings {
  const _$MaterialLoansBorrowingsImpl(
      {@JsonKey(name: 'value_summary') required this.valueSummary,
      @JsonKey(name: 'material_issue_type_id') this.materialIssueTypeId,
      @JsonKey(name: 'material_issue_type_name') this.materialIssueTypeName,
      this.value})
      : super._();

  factory _$MaterialLoansBorrowingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialLoansBorrowingsImplFromJson(json);

  @override
  @JsonKey(name: 'value_summary')
  final int valueSummary;
  @override
  @JsonKey(name: 'material_issue_type_id')
  final String? materialIssueTypeId;
  @override
  @JsonKey(name: 'material_issue_type_name')
  final String? materialIssueTypeName;
  @override
  final int? value;

  @override
  String toString() {
    return 'MaterialLoansBorrowings(valueSummary: $valueSummary, materialIssueTypeId: $materialIssueTypeId, materialIssueTypeName: $materialIssueTypeName, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialLoansBorrowingsImpl &&
            (identical(other.valueSummary, valueSummary) ||
                other.valueSummary == valueSummary) &&
            (identical(other.materialIssueTypeId, materialIssueTypeId) ||
                other.materialIssueTypeId == materialIssueTypeId) &&
            (identical(other.materialIssueTypeName, materialIssueTypeName) ||
                other.materialIssueTypeName == materialIssueTypeName) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valueSummary,
      materialIssueTypeId, materialIssueTypeName, value);

  /// Create a copy of MaterialLoansBorrowings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialLoansBorrowingsImplCopyWith<_$MaterialLoansBorrowingsImpl>
      get copyWith => __$$MaterialLoansBorrowingsImplCopyWithImpl<
          _$MaterialLoansBorrowingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialLoansBorrowingsImplToJson(
      this,
    );
  }
}

abstract class _MaterialLoansBorrowings extends MaterialLoansBorrowings {
  const factory _MaterialLoansBorrowings(
      {@JsonKey(name: 'value_summary') required final int valueSummary,
      @JsonKey(name: 'material_issue_type_id')
      final String? materialIssueTypeId,
      @JsonKey(name: 'material_issue_type_name')
      final String? materialIssueTypeName,
      final int? value}) = _$MaterialLoansBorrowingsImpl;
  const _MaterialLoansBorrowings._() : super._();

  factory _MaterialLoansBorrowings.fromJson(Map<String, dynamic> json) =
      _$MaterialLoansBorrowingsImpl.fromJson;

  @override
  @JsonKey(name: 'value_summary')
  int get valueSummary;
  @override
  @JsonKey(name: 'material_issue_type_id')
  String? get materialIssueTypeId;
  @override
  @JsonKey(name: 'material_issue_type_name')
  String? get materialIssueTypeName;
  @override
  int? get value;

  /// Create a copy of MaterialLoansBorrowings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialLoansBorrowingsImplCopyWith<_$MaterialLoansBorrowingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
