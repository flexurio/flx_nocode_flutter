// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_force_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FieldForceSummary _$FieldForceSummaryFromJson(Map<String, dynamic> json) {
  return _FieldForceSummary.fromJson(json);
}

/// @nodoc
mixin _$FieldForceSummary {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_code')
  String get areaCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_boss')
  String get areaCodeBoss => throw _privateConstructorUsedError;
  String get nip => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fieldForceSummaryCategoryFromString)
  FieldForceSummaryCategory get category => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'category_sub', fromJson: FieldForceSummaryCategorySub.fromString)
  FieldForceSummaryCategorySub get categorySub =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage')
  double get scale => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag1')
  String get flag1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag1_desc')
  String get flag1Desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag2')
  String get flag2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag2_desc')
  String get flag2Desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag3')
  String get flag3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag3_desc')
  String get flag3Desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag4')
  String get flag4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag4_desc')
  String get flag4Desc => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag5')
  String get flag5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag5_desc')
  String get flag5Desc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldForceSummaryCopyWith<FieldForceSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldForceSummaryCopyWith<$Res> {
  factory $FieldForceSummaryCopyWith(
          FieldForceSummary value, $Res Function(FieldForceSummary) then) =
      _$FieldForceSummaryCopyWithImpl<$Res, FieldForceSummary>;
  @useResult
  $Res call(
      {int year,
      int month,
      int date,
      @JsonKey(name: 'area_code') String areaCode,
      @JsonKey(name: 'area_boss') String areaCodeBoss,
      String nip,
      String name,
      @JsonKey(fromJson: _fieldForceSummaryCategoryFromString)
      FieldForceSummaryCategory category,
      @JsonKey(
          name: 'category_sub',
          fromJson: FieldForceSummaryCategorySub.fromString)
      FieldForceSummaryCategorySub categorySub,
      @JsonKey(name: 'value') String amount,
      @JsonKey(name: 'percentage') double scale,
      @JsonKey(name: 'flag1') String flag1,
      @JsonKey(name: 'flag1_desc') String flag1Desc,
      @JsonKey(name: 'flag2') String flag2,
      @JsonKey(name: 'flag2_desc') String flag2Desc,
      @JsonKey(name: 'flag3') String flag3,
      @JsonKey(name: 'flag3_desc') String flag3Desc,
      @JsonKey(name: 'flag4') String flag4,
      @JsonKey(name: 'flag4_desc') String flag4Desc,
      @JsonKey(name: 'flag5') String flag5,
      @JsonKey(name: 'flag5_desc') String flag5Desc});
}

/// @nodoc
class _$FieldForceSummaryCopyWithImpl<$Res, $Val extends FieldForceSummary>
    implements $FieldForceSummaryCopyWith<$Res> {
  _$FieldForceSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? date = null,
    Object? areaCode = null,
    Object? areaCodeBoss = null,
    Object? nip = null,
    Object? name = null,
    Object? category = null,
    Object? categorySub = null,
    Object? amount = null,
    Object? scale = null,
    Object? flag1 = null,
    Object? flag1Desc = null,
    Object? flag2 = null,
    Object? flag2Desc = null,
    Object? flag3 = null,
    Object? flag3Desc = null,
    Object? flag4 = null,
    Object? flag4Desc = null,
    Object? flag5 = null,
    Object? flag5Desc = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      areaCode: null == areaCode
          ? _value.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as String,
      areaCodeBoss: null == areaCodeBoss
          ? _value.areaCodeBoss
          : areaCodeBoss // ignore: cast_nullable_to_non_nullable
              as String,
      nip: null == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FieldForceSummaryCategory,
      categorySub: null == categorySub
          ? _value.categorySub
          : categorySub // ignore: cast_nullable_to_non_nullable
              as FieldForceSummaryCategorySub,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      flag1: null == flag1
          ? _value.flag1
          : flag1 // ignore: cast_nullable_to_non_nullable
              as String,
      flag1Desc: null == flag1Desc
          ? _value.flag1Desc
          : flag1Desc // ignore: cast_nullable_to_non_nullable
              as String,
      flag2: null == flag2
          ? _value.flag2
          : flag2 // ignore: cast_nullable_to_non_nullable
              as String,
      flag2Desc: null == flag2Desc
          ? _value.flag2Desc
          : flag2Desc // ignore: cast_nullable_to_non_nullable
              as String,
      flag3: null == flag3
          ? _value.flag3
          : flag3 // ignore: cast_nullable_to_non_nullable
              as String,
      flag3Desc: null == flag3Desc
          ? _value.flag3Desc
          : flag3Desc // ignore: cast_nullable_to_non_nullable
              as String,
      flag4: null == flag4
          ? _value.flag4
          : flag4 // ignore: cast_nullable_to_non_nullable
              as String,
      flag4Desc: null == flag4Desc
          ? _value.flag4Desc
          : flag4Desc // ignore: cast_nullable_to_non_nullable
              as String,
      flag5: null == flag5
          ? _value.flag5
          : flag5 // ignore: cast_nullable_to_non_nullable
              as String,
      flag5Desc: null == flag5Desc
          ? _value.flag5Desc
          : flag5Desc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldForceSummaryImplCopyWith<$Res>
    implements $FieldForceSummaryCopyWith<$Res> {
  factory _$$FieldForceSummaryImplCopyWith(_$FieldForceSummaryImpl value,
          $Res Function(_$FieldForceSummaryImpl) then) =
      __$$FieldForceSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int year,
      int month,
      int date,
      @JsonKey(name: 'area_code') String areaCode,
      @JsonKey(name: 'area_boss') String areaCodeBoss,
      String nip,
      String name,
      @JsonKey(fromJson: _fieldForceSummaryCategoryFromString)
      FieldForceSummaryCategory category,
      @JsonKey(
          name: 'category_sub',
          fromJson: FieldForceSummaryCategorySub.fromString)
      FieldForceSummaryCategorySub categorySub,
      @JsonKey(name: 'value') String amount,
      @JsonKey(name: 'percentage') double scale,
      @JsonKey(name: 'flag1') String flag1,
      @JsonKey(name: 'flag1_desc') String flag1Desc,
      @JsonKey(name: 'flag2') String flag2,
      @JsonKey(name: 'flag2_desc') String flag2Desc,
      @JsonKey(name: 'flag3') String flag3,
      @JsonKey(name: 'flag3_desc') String flag3Desc,
      @JsonKey(name: 'flag4') String flag4,
      @JsonKey(name: 'flag4_desc') String flag4Desc,
      @JsonKey(name: 'flag5') String flag5,
      @JsonKey(name: 'flag5_desc') String flag5Desc});
}

/// @nodoc
class __$$FieldForceSummaryImplCopyWithImpl<$Res>
    extends _$FieldForceSummaryCopyWithImpl<$Res, _$FieldForceSummaryImpl>
    implements _$$FieldForceSummaryImplCopyWith<$Res> {
  __$$FieldForceSummaryImplCopyWithImpl(_$FieldForceSummaryImpl _value,
      $Res Function(_$FieldForceSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? date = null,
    Object? areaCode = null,
    Object? areaCodeBoss = null,
    Object? nip = null,
    Object? name = null,
    Object? category = null,
    Object? categorySub = null,
    Object? amount = null,
    Object? scale = null,
    Object? flag1 = null,
    Object? flag1Desc = null,
    Object? flag2 = null,
    Object? flag2Desc = null,
    Object? flag3 = null,
    Object? flag3Desc = null,
    Object? flag4 = null,
    Object? flag4Desc = null,
    Object? flag5 = null,
    Object? flag5Desc = null,
  }) {
    return _then(_$FieldForceSummaryImpl(
      null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      null == areaCode
          ? _value.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == areaCodeBoss
          ? _value.areaCodeBoss
          : areaCodeBoss // ignore: cast_nullable_to_non_nullable
              as String,
      null == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FieldForceSummaryCategory,
      null == categorySub
          ? _value.categorySub
          : categorySub // ignore: cast_nullable_to_non_nullable
              as FieldForceSummaryCategorySub,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      null == flag1
          ? _value.flag1
          : flag1 // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag1Desc
          ? _value.flag1Desc
          : flag1Desc // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag2
          ? _value.flag2
          : flag2 // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag2Desc
          ? _value.flag2Desc
          : flag2Desc // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag3
          ? _value.flag3
          : flag3 // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag3Desc
          ? _value.flag3Desc
          : flag3Desc // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag4
          ? _value.flag4
          : flag4 // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag4Desc
          ? _value.flag4Desc
          : flag4Desc // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag5
          ? _value.flag5
          : flag5 // ignore: cast_nullable_to_non_nullable
              as String,
      null == flag5Desc
          ? _value.flag5Desc
          : flag5Desc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldForceSummaryImpl extends _FieldForceSummary {
  const _$FieldForceSummaryImpl(
      this.year,
      this.month,
      this.date,
      @JsonKey(name: 'area_code') this.areaCode,
      @JsonKey(name: 'area_boss') this.areaCodeBoss,
      this.nip,
      this.name,
      @JsonKey(fromJson: _fieldForceSummaryCategoryFromString) this.category,
      @JsonKey(
          name: 'category_sub',
          fromJson: FieldForceSummaryCategorySub.fromString)
      this.categorySub,
      @JsonKey(name: 'value') this.amount,
      @JsonKey(name: 'percentage') this.scale,
      @JsonKey(name: 'flag1') this.flag1,
      @JsonKey(name: 'flag1_desc') this.flag1Desc,
      @JsonKey(name: 'flag2') this.flag2,
      @JsonKey(name: 'flag2_desc') this.flag2Desc,
      @JsonKey(name: 'flag3') this.flag3,
      @JsonKey(name: 'flag3_desc') this.flag3Desc,
      @JsonKey(name: 'flag4') this.flag4,
      @JsonKey(name: 'flag4_desc') this.flag4Desc,
      @JsonKey(name: 'flag5') this.flag5,
      @JsonKey(name: 'flag5_desc') this.flag5Desc)
      : super._();

  factory _$FieldForceSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldForceSummaryImplFromJson(json);

  @override
  final int year;
  @override
  final int month;
  @override
  final int date;
  @override
  @JsonKey(name: 'area_code')
  final String areaCode;
  @override
  @JsonKey(name: 'area_boss')
  final String areaCodeBoss;
  @override
  final String nip;
  @override
  final String name;
  @override
  @JsonKey(fromJson: _fieldForceSummaryCategoryFromString)
  final FieldForceSummaryCategory category;
  @override
  @JsonKey(
      name: 'category_sub', fromJson: FieldForceSummaryCategorySub.fromString)
  final FieldForceSummaryCategorySub categorySub;
  @override
  @JsonKey(name: 'value')
  final String amount;
  @override
  @JsonKey(name: 'percentage')
  final double scale;
  @override
  @JsonKey(name: 'flag1')
  final String flag1;
  @override
  @JsonKey(name: 'flag1_desc')
  final String flag1Desc;
  @override
  @JsonKey(name: 'flag2')
  final String flag2;
  @override
  @JsonKey(name: 'flag2_desc')
  final String flag2Desc;
  @override
  @JsonKey(name: 'flag3')
  final String flag3;
  @override
  @JsonKey(name: 'flag3_desc')
  final String flag3Desc;
  @override
  @JsonKey(name: 'flag4')
  final String flag4;
  @override
  @JsonKey(name: 'flag4_desc')
  final String flag4Desc;
  @override
  @JsonKey(name: 'flag5')
  final String flag5;
  @override
  @JsonKey(name: 'flag5_desc')
  final String flag5Desc;

  @override
  String toString() {
    return 'FieldForceSummary(year: $year, month: $month, date: $date, areaCode: $areaCode, areaCodeBoss: $areaCodeBoss, nip: $nip, name: $name, category: $category, categorySub: $categorySub, amount: $amount, scale: $scale, flag1: $flag1, flag1Desc: $flag1Desc, flag2: $flag2, flag2Desc: $flag2Desc, flag3: $flag3, flag3Desc: $flag3Desc, flag4: $flag4, flag4Desc: $flag4Desc, flag5: $flag5, flag5Desc: $flag5Desc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldForceSummaryImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.areaCode, areaCode) ||
                other.areaCode == areaCode) &&
            (identical(other.areaCodeBoss, areaCodeBoss) ||
                other.areaCodeBoss == areaCodeBoss) &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.categorySub, categorySub) ||
                other.categorySub == categorySub) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.flag1, flag1) || other.flag1 == flag1) &&
            (identical(other.flag1Desc, flag1Desc) ||
                other.flag1Desc == flag1Desc) &&
            (identical(other.flag2, flag2) || other.flag2 == flag2) &&
            (identical(other.flag2Desc, flag2Desc) ||
                other.flag2Desc == flag2Desc) &&
            (identical(other.flag3, flag3) || other.flag3 == flag3) &&
            (identical(other.flag3Desc, flag3Desc) ||
                other.flag3Desc == flag3Desc) &&
            (identical(other.flag4, flag4) || other.flag4 == flag4) &&
            (identical(other.flag4Desc, flag4Desc) ||
                other.flag4Desc == flag4Desc) &&
            (identical(other.flag5, flag5) || other.flag5 == flag5) &&
            (identical(other.flag5Desc, flag5Desc) ||
                other.flag5Desc == flag5Desc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        year,
        month,
        date,
        areaCode,
        areaCodeBoss,
        nip,
        name,
        category,
        categorySub,
        amount,
        scale,
        flag1,
        flag1Desc,
        flag2,
        flag2Desc,
        flag3,
        flag3Desc,
        flag4,
        flag4Desc,
        flag5,
        flag5Desc
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldForceSummaryImplCopyWith<_$FieldForceSummaryImpl> get copyWith =>
      __$$FieldForceSummaryImplCopyWithImpl<_$FieldForceSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldForceSummaryImplToJson(
      this,
    );
  }
}

abstract class _FieldForceSummary extends FieldForceSummary {
  const factory _FieldForceSummary(
          final int year,
          final int month,
          final int date,
          @JsonKey(name: 'area_code') final String areaCode,
          @JsonKey(name: 'area_boss') final String areaCodeBoss,
          final String nip,
          final String name,
          @JsonKey(fromJson: _fieldForceSummaryCategoryFromString)
          final FieldForceSummaryCategory category,
          @JsonKey(
              name: 'category_sub',
              fromJson: FieldForceSummaryCategorySub.fromString)
          final FieldForceSummaryCategorySub categorySub,
          @JsonKey(name: 'value') final String amount,
          @JsonKey(name: 'percentage') final double scale,
          @JsonKey(name: 'flag1') final String flag1,
          @JsonKey(name: 'flag1_desc') final String flag1Desc,
          @JsonKey(name: 'flag2') final String flag2,
          @JsonKey(name: 'flag2_desc') final String flag2Desc,
          @JsonKey(name: 'flag3') final String flag3,
          @JsonKey(name: 'flag3_desc') final String flag3Desc,
          @JsonKey(name: 'flag4') final String flag4,
          @JsonKey(name: 'flag4_desc') final String flag4Desc,
          @JsonKey(name: 'flag5') final String flag5,
          @JsonKey(name: 'flag5_desc') final String flag5Desc) =
      _$FieldForceSummaryImpl;
  const _FieldForceSummary._() : super._();

  factory _FieldForceSummary.fromJson(Map<String, dynamic> json) =
      _$FieldForceSummaryImpl.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  int get date;
  @override
  @JsonKey(name: 'area_code')
  String get areaCode;
  @override
  @JsonKey(name: 'area_boss')
  String get areaCodeBoss;
  @override
  String get nip;
  @override
  String get name;
  @override
  @JsonKey(fromJson: _fieldForceSummaryCategoryFromString)
  FieldForceSummaryCategory get category;
  @override
  @JsonKey(
      name: 'category_sub', fromJson: FieldForceSummaryCategorySub.fromString)
  FieldForceSummaryCategorySub get categorySub;
  @override
  @JsonKey(name: 'value')
  String get amount;
  @override
  @JsonKey(name: 'percentage')
  double get scale;
  @override
  @JsonKey(name: 'flag1')
  String get flag1;
  @override
  @JsonKey(name: 'flag1_desc')
  String get flag1Desc;
  @override
  @JsonKey(name: 'flag2')
  String get flag2;
  @override
  @JsonKey(name: 'flag2_desc')
  String get flag2Desc;
  @override
  @JsonKey(name: 'flag3')
  String get flag3;
  @override
  @JsonKey(name: 'flag3_desc')
  String get flag3Desc;
  @override
  @JsonKey(name: 'flag4')
  String get flag4;
  @override
  @JsonKey(name: 'flag4_desc')
  String get flag4Desc;
  @override
  @JsonKey(name: 'flag5')
  String get flag5;
  @override
  @JsonKey(name: 'flag5_desc')
  String get flag5Desc;
  @override
  @JsonKey(ignore: true)
  _$$FieldForceSummaryImplCopyWith<_$FieldForceSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
