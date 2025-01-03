// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_receive_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReceiveReport _$MaterialReceiveReportFromJson(
    Map<String, dynamic> json) {
  return _MaterialReceiveReport.fromJson(json);
}

/// @nodoc
mixin _$MaterialReceiveReport {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReceiveReportCopyWith<MaterialReceiveReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReceiveReportCopyWith<$Res> {
  factory $MaterialReceiveReportCopyWith(MaterialReceiveReport value,
          $Res Function(MaterialReceiveReport) then) =
      _$MaterialReceiveReportCopyWithImpl<$Res, MaterialReceiveReport>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      String unit,
      int qty});
}

/// @nodoc
class _$MaterialReceiveReportCopyWithImpl<$Res,
        $Val extends MaterialReceiveReport>
    implements $MaterialReceiveReportCopyWith<$Res> {
  _$MaterialReceiveReportCopyWithImpl(this._value, this._then);

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
    Object? qty = null,
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
              as DateTime,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialReceiveReportImplCopyWith<$Res>
    implements $MaterialReceiveReportCopyWith<$Res> {
  factory _$$MaterialReceiveReportImplCopyWith(
          _$MaterialReceiveReportImpl value,
          $Res Function(_$MaterialReceiveReportImpl) then) =
      __$$MaterialReceiveReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      String unit,
      int qty});
}

/// @nodoc
class __$$MaterialReceiveReportImplCopyWithImpl<$Res>
    extends _$MaterialReceiveReportCopyWithImpl<$Res,
        _$MaterialReceiveReportImpl>
    implements _$$MaterialReceiveReportImplCopyWith<$Res> {
  __$$MaterialReceiveReportImplCopyWithImpl(_$MaterialReceiveReportImpl _value,
      $Res Function(_$MaterialReceiveReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? expiredDate = null,
    Object? unit = null,
    Object? qty = null,
  }) {
    return _then(_$MaterialReceiveReportImpl(
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
              as DateTime,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReceiveReportImpl extends _MaterialReceiveReport {
  _$MaterialReceiveReportImpl(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      required this.unit,
      required this.qty})
      : super._();

  factory _$MaterialReceiveReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReceiveReportImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  final String unit;
  @override
  final int qty;

  @override
  String toString() {
    return 'MaterialReceiveReport(id: $id, title: $title, description: $description, expiredDate: $expiredDate, unit: $unit, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReceiveReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, expiredDate, unit, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReceiveReportImplCopyWith<_$MaterialReceiveReportImpl>
      get copyWith => __$$MaterialReceiveReportImplCopyWithImpl<
          _$MaterialReceiveReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReceiveReportImplToJson(
      this,
    );
  }
}

abstract class _MaterialReceiveReport extends MaterialReceiveReport {
  factory _MaterialReceiveReport(
      {required final String id,
      required final String title,
      required final String description,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      required final String unit,
      required final int qty}) = _$MaterialReceiveReportImpl;
  _MaterialReceiveReport._() : super._();

  factory _MaterialReceiveReport.fromJson(Map<String, dynamic> json) =
      _$MaterialReceiveReportImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  String get unit;
  @override
  int get qty;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReceiveReportImplCopyWith<_$MaterialReceiveReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
