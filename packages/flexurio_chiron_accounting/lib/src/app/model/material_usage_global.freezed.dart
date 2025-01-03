// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_usage_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialUsageGlobal _$MaterialUsageGlobalFromJson(Map<String, dynamic> json) {
  return _MaterialUsageGlobal.fromJson(json);
}

/// @nodoc
mixin _$MaterialUsageGlobal {
  @JsonKey(name: 'material_issue_id')
  String get materialIssueId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_issue_date', fromJson: isoDateToDateTime)
  DateTime get materialIssueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_summary')
  double get subtotalSummary => throw _privateConstructorUsedError;

  /// Serializes this MaterialUsageGlobal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialUsageGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialUsageGlobalCopyWith<MaterialUsageGlobal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialUsageGlobalCopyWith<$Res> {
  factory $MaterialUsageGlobalCopyWith(
          MaterialUsageGlobal value, $Res Function(MaterialUsageGlobal) then) =
      _$MaterialUsageGlobalCopyWithImpl<$Res, MaterialUsageGlobal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_issue_id') String materialIssueId,
      String description,
      @JsonKey(name: 'material_issue_date', fromJson: isoDateToDateTime)
      DateTime materialIssueDate,
      @JsonKey(name: 'total_price') int totalPrice,
      @JsonKey(name: 'subtotal_summary') double subtotalSummary});
}

/// @nodoc
class _$MaterialUsageGlobalCopyWithImpl<$Res, $Val extends MaterialUsageGlobal>
    implements $MaterialUsageGlobalCopyWith<$Res> {
  _$MaterialUsageGlobalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialUsageGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialIssueId = null,
    Object? description = null,
    Object? materialIssueDate = null,
    Object? totalPrice = null,
    Object? subtotalSummary = null,
  }) {
    return _then(_value.copyWith(
      materialIssueId: null == materialIssueId
          ? _value.materialIssueId
          : materialIssueId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialIssueDate: null == materialIssueDate
          ? _value.materialIssueDate
          : materialIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      subtotalSummary: null == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialUsageGlobalImplCopyWith<$Res>
    implements $MaterialUsageGlobalCopyWith<$Res> {
  factory _$$MaterialUsageGlobalImplCopyWith(_$MaterialUsageGlobalImpl value,
          $Res Function(_$MaterialUsageGlobalImpl) then) =
      __$$MaterialUsageGlobalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_issue_id') String materialIssueId,
      String description,
      @JsonKey(name: 'material_issue_date', fromJson: isoDateToDateTime)
      DateTime materialIssueDate,
      @JsonKey(name: 'total_price') int totalPrice,
      @JsonKey(name: 'subtotal_summary') double subtotalSummary});
}

/// @nodoc
class __$$MaterialUsageGlobalImplCopyWithImpl<$Res>
    extends _$MaterialUsageGlobalCopyWithImpl<$Res, _$MaterialUsageGlobalImpl>
    implements _$$MaterialUsageGlobalImplCopyWith<$Res> {
  __$$MaterialUsageGlobalImplCopyWithImpl(_$MaterialUsageGlobalImpl _value,
      $Res Function(_$MaterialUsageGlobalImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialUsageGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialIssueId = null,
    Object? description = null,
    Object? materialIssueDate = null,
    Object? totalPrice = null,
    Object? subtotalSummary = null,
  }) {
    return _then(_$MaterialUsageGlobalImpl(
      materialIssueId: null == materialIssueId
          ? _value.materialIssueId
          : materialIssueId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialIssueDate: null == materialIssueDate
          ? _value.materialIssueDate
          : materialIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      subtotalSummary: null == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialUsageGlobalImpl extends _MaterialUsageGlobal {
  const _$MaterialUsageGlobalImpl(
      {@JsonKey(name: 'material_issue_id') required this.materialIssueId,
      required this.description,
      @JsonKey(name: 'material_issue_date', fromJson: isoDateToDateTime)
      required this.materialIssueDate,
      @JsonKey(name: 'total_price') required this.totalPrice,
      @JsonKey(name: 'subtotal_summary') required this.subtotalSummary})
      : super._();

  factory _$MaterialUsageGlobalImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialUsageGlobalImplFromJson(json);

  @override
  @JsonKey(name: 'material_issue_id')
  final String materialIssueId;
  @override
  final String description;
  @override
  @JsonKey(name: 'material_issue_date', fromJson: isoDateToDateTime)
  final DateTime materialIssueDate;
  @override
  @JsonKey(name: 'total_price')
  final int totalPrice;
  @override
  @JsonKey(name: 'subtotal_summary')
  final double subtotalSummary;

  @override
  String toString() {
    return 'MaterialUsageGlobal(materialIssueId: $materialIssueId, description: $description, materialIssueDate: $materialIssueDate, totalPrice: $totalPrice, subtotalSummary: $subtotalSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialUsageGlobalImpl &&
            (identical(other.materialIssueId, materialIssueId) ||
                other.materialIssueId == materialIssueId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.materialIssueDate, materialIssueDate) ||
                other.materialIssueDate == materialIssueDate) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.subtotalSummary, subtotalSummary) ||
                other.subtotalSummary == subtotalSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, materialIssueId, description,
      materialIssueDate, totalPrice, subtotalSummary);

  /// Create a copy of MaterialUsageGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialUsageGlobalImplCopyWith<_$MaterialUsageGlobalImpl> get copyWith =>
      __$$MaterialUsageGlobalImplCopyWithImpl<_$MaterialUsageGlobalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialUsageGlobalImplToJson(
      this,
    );
  }
}

abstract class _MaterialUsageGlobal extends MaterialUsageGlobal {
  const factory _MaterialUsageGlobal(
      {@JsonKey(name: 'material_issue_id')
      required final String materialIssueId,
      required final String description,
      @JsonKey(name: 'material_issue_date', fromJson: isoDateToDateTime)
      required final DateTime materialIssueDate,
      @JsonKey(name: 'total_price') required final int totalPrice,
      @JsonKey(name: 'subtotal_summary')
      required final double subtotalSummary}) = _$MaterialUsageGlobalImpl;
  const _MaterialUsageGlobal._() : super._();

  factory _MaterialUsageGlobal.fromJson(Map<String, dynamic> json) =
      _$MaterialUsageGlobalImpl.fromJson;

  @override
  @JsonKey(name: 'material_issue_id')
  String get materialIssueId;
  @override
  String get description;
  @override
  @JsonKey(name: 'material_issue_date', fromJson: isoDateToDateTime)
  DateTime get materialIssueDate;
  @override
  @JsonKey(name: 'total_price')
  int get totalPrice;
  @override
  @JsonKey(name: 'subtotal_summary')
  double get subtotalSummary;

  /// Create a copy of MaterialUsageGlobal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialUsageGlobalImplCopyWith<_$MaterialUsageGlobalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
