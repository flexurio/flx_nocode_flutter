// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_issue_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialIssueReport _$MaterialIssueReportFromJson(Map<String, dynamic> json) {
  return _MaterialIssueReport.fromJson(json);
}

/// @nodoc
mixin _$MaterialIssueReport {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date')
  String get expiredDate => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialIssueReportCopyWith<MaterialIssueReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialIssueReportCopyWith<$Res> {
  factory $MaterialIssueReportCopyWith(
          MaterialIssueReport value, $Res Function(MaterialIssueReport) then) =
      _$MaterialIssueReportCopyWithImpl<$Res, MaterialIssueReport>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'expired_date') String expiredDate,
      String unit,
      @JsonKey(name: 'qty') int quantity});
}

/// @nodoc
class _$MaterialIssueReportCopyWithImpl<$Res, $Val extends MaterialIssueReport>
    implements $MaterialIssueReportCopyWith<$Res> {
  _$MaterialIssueReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? expiredDate = null,
    Object? unit = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialIssueReportImplCopyWith<$Res>
    implements $MaterialIssueReportCopyWith<$Res> {
  factory _$$MaterialIssueReportImplCopyWith(_$MaterialIssueReportImpl value,
          $Res Function(_$MaterialIssueReportImpl) then) =
      __$$MaterialIssueReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'expired_date') String expiredDate,
      String unit,
      @JsonKey(name: 'qty') int quantity});
}

/// @nodoc
class __$$MaterialIssueReportImplCopyWithImpl<$Res>
    extends _$MaterialIssueReportCopyWithImpl<$Res, _$MaterialIssueReportImpl>
    implements _$$MaterialIssueReportImplCopyWith<$Res> {
  __$$MaterialIssueReportImplCopyWithImpl(_$MaterialIssueReportImpl _value,
      $Res Function(_$MaterialIssueReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? expiredDate = null,
    Object? unit = null,
    Object? quantity = null,
  }) {
    return _then(_$MaterialIssueReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIssueReportImpl extends _MaterialIssueReport {
  const _$MaterialIssueReportImpl(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'expired_date') required this.expiredDate,
      required this.unit,
      @JsonKey(name: 'qty') required this.quantity})
      : super._();

  factory _$MaterialIssueReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialIssueReportImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'expired_date')
  final String expiredDate;
  @override
  final String unit;
  @override
  @JsonKey(name: 'qty')
  final int quantity;

  @override
  String toString() {
    return 'MaterialIssueReport(id: $id, title: $title, description: $description, expiredDate: $expiredDate, unit: $unit, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIssueReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, expiredDate, unit, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIssueReportImplCopyWith<_$MaterialIssueReportImpl> get copyWith =>
      __$$MaterialIssueReportImplCopyWithImpl<_$MaterialIssueReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIssueReportImplToJson(
      this,
    );
  }
}

abstract class _MaterialIssueReport extends MaterialIssueReport {
  const factory _MaterialIssueReport(
          {required final String id,
          required final String title,
          required final String description,
          @JsonKey(name: 'expired_date') required final String expiredDate,
          required final String unit,
          @JsonKey(name: 'qty') required final int quantity}) =
      _$MaterialIssueReportImpl;
  const _MaterialIssueReport._() : super._();

  factory _MaterialIssueReport.fromJson(Map<String, dynamic> json) =
      _$MaterialIssueReportImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'expired_date')
  String get expiredDate;
  @override
  String get unit;
  @override
  @JsonKey(name: 'qty')
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$MaterialIssueReportImplCopyWith<_$MaterialIssueReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
