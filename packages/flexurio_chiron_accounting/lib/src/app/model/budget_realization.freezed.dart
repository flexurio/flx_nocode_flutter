// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_realization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetRealization _$BudgetRealizationFromJson(Map<String, dynamic> json) {
  return _BudgetRealization.fromJson(json);
}

/// @nodoc
mixin _$BudgetRealization {
  @JsonKey(fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_budget')
  String get postBudget => throw _privateConstructorUsedError;
  @JsonKey(name: 'general_manager')
  String get generalManager => throw _privateConstructorUsedError;
  String get january => throw _privateConstructorUsedError;
  String get february => throw _privateConstructorUsedError;
  String get march => throw _privateConstructorUsedError;
  String get april => throw _privateConstructorUsedError;
  String get may => throw _privateConstructorUsedError;
  String get june => throw _privateConstructorUsedError;
  String get july => throw _privateConstructorUsedError;
  String get august => throw _privateConstructorUsedError;
  String get september => throw _privateConstructorUsedError;
  String get october => throw _privateConstructorUsedError;
  String get november => throw _privateConstructorUsedError;
  String get december => throw _privateConstructorUsedError;
  @JsonKey(name: 'year_to_date')
  String get yearToDate => throw _privateConstructorUsedError;

  /// Serializes this BudgetRealization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetRealization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetRealizationCopyWith<BudgetRealization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetRealizationCopyWith<$Res> {
  factory $BudgetRealizationCopyWith(
          BudgetRealization value, $Res Function(BudgetRealization) then) =
      _$BudgetRealizationCopyWithImpl<$Res, BudgetRealization>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: Department.fromJson) Department department,
      String period,
      @JsonKey(name: 'post_budget') String postBudget,
      @JsonKey(name: 'general_manager') String generalManager,
      String january,
      String february,
      String march,
      String april,
      String may,
      String june,
      String july,
      String august,
      String september,
      String october,
      String november,
      String december,
      @JsonKey(name: 'year_to_date') String yearToDate});

  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class _$BudgetRealizationCopyWithImpl<$Res, $Val extends BudgetRealization>
    implements $BudgetRealizationCopyWith<$Res> {
  _$BudgetRealizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetRealization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = null,
    Object? period = null,
    Object? postBudget = null,
    Object? generalManager = null,
    Object? january = null,
    Object? february = null,
    Object? march = null,
    Object? april = null,
    Object? may = null,
    Object? june = null,
    Object? july = null,
    Object? august = null,
    Object? september = null,
    Object? october = null,
    Object? november = null,
    Object? december = null,
    Object? yearToDate = null,
  }) {
    return _then(_value.copyWith(
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      postBudget: null == postBudget
          ? _value.postBudget
          : postBudget // ignore: cast_nullable_to_non_nullable
              as String,
      generalManager: null == generalManager
          ? _value.generalManager
          : generalManager // ignore: cast_nullable_to_non_nullable
              as String,
      january: null == january
          ? _value.january
          : january // ignore: cast_nullable_to_non_nullable
              as String,
      february: null == february
          ? _value.february
          : february // ignore: cast_nullable_to_non_nullable
              as String,
      march: null == march
          ? _value.march
          : march // ignore: cast_nullable_to_non_nullable
              as String,
      april: null == april
          ? _value.april
          : april // ignore: cast_nullable_to_non_nullable
              as String,
      may: null == may
          ? _value.may
          : may // ignore: cast_nullable_to_non_nullable
              as String,
      june: null == june
          ? _value.june
          : june // ignore: cast_nullable_to_non_nullable
              as String,
      july: null == july
          ? _value.july
          : july // ignore: cast_nullable_to_non_nullable
              as String,
      august: null == august
          ? _value.august
          : august // ignore: cast_nullable_to_non_nullable
              as String,
      september: null == september
          ? _value.september
          : september // ignore: cast_nullable_to_non_nullable
              as String,
      october: null == october
          ? _value.october
          : october // ignore: cast_nullable_to_non_nullable
              as String,
      november: null == november
          ? _value.november
          : november // ignore: cast_nullable_to_non_nullable
              as String,
      december: null == december
          ? _value.december
          : december // ignore: cast_nullable_to_non_nullable
              as String,
      yearToDate: null == yearToDate
          ? _value.yearToDate
          : yearToDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of BudgetRealization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BudgetRealizationImplCopyWith<$Res>
    implements $BudgetRealizationCopyWith<$Res> {
  factory _$$BudgetRealizationImplCopyWith(_$BudgetRealizationImpl value,
          $Res Function(_$BudgetRealizationImpl) then) =
      __$$BudgetRealizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: Department.fromJson) Department department,
      String period,
      @JsonKey(name: 'post_budget') String postBudget,
      @JsonKey(name: 'general_manager') String generalManager,
      String january,
      String february,
      String march,
      String april,
      String may,
      String june,
      String july,
      String august,
      String september,
      String october,
      String november,
      String december,
      @JsonKey(name: 'year_to_date') String yearToDate});

  @override
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class __$$BudgetRealizationImplCopyWithImpl<$Res>
    extends _$BudgetRealizationCopyWithImpl<$Res, _$BudgetRealizationImpl>
    implements _$$BudgetRealizationImplCopyWith<$Res> {
  __$$BudgetRealizationImplCopyWithImpl(_$BudgetRealizationImpl _value,
      $Res Function(_$BudgetRealizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetRealization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = null,
    Object? period = null,
    Object? postBudget = null,
    Object? generalManager = null,
    Object? january = null,
    Object? february = null,
    Object? march = null,
    Object? april = null,
    Object? may = null,
    Object? june = null,
    Object? july = null,
    Object? august = null,
    Object? september = null,
    Object? october = null,
    Object? november = null,
    Object? december = null,
    Object? yearToDate = null,
  }) {
    return _then(_$BudgetRealizationImpl(
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      postBudget: null == postBudget
          ? _value.postBudget
          : postBudget // ignore: cast_nullable_to_non_nullable
              as String,
      generalManager: null == generalManager
          ? _value.generalManager
          : generalManager // ignore: cast_nullable_to_non_nullable
              as String,
      january: null == january
          ? _value.january
          : january // ignore: cast_nullable_to_non_nullable
              as String,
      february: null == february
          ? _value.february
          : february // ignore: cast_nullable_to_non_nullable
              as String,
      march: null == march
          ? _value.march
          : march // ignore: cast_nullable_to_non_nullable
              as String,
      april: null == april
          ? _value.april
          : april // ignore: cast_nullable_to_non_nullable
              as String,
      may: null == may
          ? _value.may
          : may // ignore: cast_nullable_to_non_nullable
              as String,
      june: null == june
          ? _value.june
          : june // ignore: cast_nullable_to_non_nullable
              as String,
      july: null == july
          ? _value.july
          : july // ignore: cast_nullable_to_non_nullable
              as String,
      august: null == august
          ? _value.august
          : august // ignore: cast_nullable_to_non_nullable
              as String,
      september: null == september
          ? _value.september
          : september // ignore: cast_nullable_to_non_nullable
              as String,
      october: null == october
          ? _value.october
          : october // ignore: cast_nullable_to_non_nullable
              as String,
      november: null == november
          ? _value.november
          : november // ignore: cast_nullable_to_non_nullable
              as String,
      december: null == december
          ? _value.december
          : december // ignore: cast_nullable_to_non_nullable
              as String,
      yearToDate: null == yearToDate
          ? _value.yearToDate
          : yearToDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetRealizationImpl extends _BudgetRealization {
  const _$BudgetRealizationImpl(
      {@JsonKey(fromJson: Department.fromJson) required this.department,
      required this.period,
      @JsonKey(name: 'post_budget') required this.postBudget,
      @JsonKey(name: 'general_manager') required this.generalManager,
      required this.january,
      required this.february,
      required this.march,
      required this.april,
      required this.may,
      required this.june,
      required this.july,
      required this.august,
      required this.september,
      required this.october,
      required this.november,
      required this.december,
      @JsonKey(name: 'year_to_date') required this.yearToDate})
      : super._();

  factory _$BudgetRealizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetRealizationImplFromJson(json);

  @override
  @JsonKey(fromJson: Department.fromJson)
  final Department department;
  @override
  final String period;
  @override
  @JsonKey(name: 'post_budget')
  final String postBudget;
  @override
  @JsonKey(name: 'general_manager')
  final String generalManager;
  @override
  final String january;
  @override
  final String february;
  @override
  final String march;
  @override
  final String april;
  @override
  final String may;
  @override
  final String june;
  @override
  final String july;
  @override
  final String august;
  @override
  final String september;
  @override
  final String october;
  @override
  final String november;
  @override
  final String december;
  @override
  @JsonKey(name: 'year_to_date')
  final String yearToDate;

  @override
  String toString() {
    return 'BudgetRealization(department: $department, period: $period, postBudget: $postBudget, generalManager: $generalManager, january: $january, february: $february, march: $march, april: $april, may: $may, june: $june, july: $july, august: $august, september: $september, october: $october, november: $november, december: $december, yearToDate: $yearToDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetRealizationImpl &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.postBudget, postBudget) ||
                other.postBudget == postBudget) &&
            (identical(other.generalManager, generalManager) ||
                other.generalManager == generalManager) &&
            (identical(other.january, january) || other.january == january) &&
            (identical(other.february, february) ||
                other.february == february) &&
            (identical(other.march, march) || other.march == march) &&
            (identical(other.april, april) || other.april == april) &&
            (identical(other.may, may) || other.may == may) &&
            (identical(other.june, june) || other.june == june) &&
            (identical(other.july, july) || other.july == july) &&
            (identical(other.august, august) || other.august == august) &&
            (identical(other.september, september) ||
                other.september == september) &&
            (identical(other.october, october) || other.october == october) &&
            (identical(other.november, november) ||
                other.november == november) &&
            (identical(other.december, december) ||
                other.december == december) &&
            (identical(other.yearToDate, yearToDate) ||
                other.yearToDate == yearToDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      department,
      period,
      postBudget,
      generalManager,
      january,
      february,
      march,
      april,
      may,
      june,
      july,
      august,
      september,
      october,
      november,
      december,
      yearToDate);

  /// Create a copy of BudgetRealization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetRealizationImplCopyWith<_$BudgetRealizationImpl> get copyWith =>
      __$$BudgetRealizationImplCopyWithImpl<_$BudgetRealizationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetRealizationImplToJson(
      this,
    );
  }
}

abstract class _BudgetRealization extends BudgetRealization {
  const factory _BudgetRealization(
      {@JsonKey(fromJson: Department.fromJson)
      required final Department department,
      required final String period,
      @JsonKey(name: 'post_budget') required final String postBudget,
      @JsonKey(name: 'general_manager') required final String generalManager,
      required final String january,
      required final String february,
      required final String march,
      required final String april,
      required final String may,
      required final String june,
      required final String july,
      required final String august,
      required final String september,
      required final String october,
      required final String november,
      required final String december,
      @JsonKey(name: 'year_to_date')
      required final String yearToDate}) = _$BudgetRealizationImpl;
  const _BudgetRealization._() : super._();

  factory _BudgetRealization.fromJson(Map<String, dynamic> json) =
      _$BudgetRealizationImpl.fromJson;

  @override
  @JsonKey(fromJson: Department.fromJson)
  Department get department;
  @override
  String get period;
  @override
  @JsonKey(name: 'post_budget')
  String get postBudget;
  @override
  @JsonKey(name: 'general_manager')
  String get generalManager;
  @override
  String get january;
  @override
  String get february;
  @override
  String get march;
  @override
  String get april;
  @override
  String get may;
  @override
  String get june;
  @override
  String get july;
  @override
  String get august;
  @override
  String get september;
  @override
  String get october;
  @override
  String get november;
  @override
  String get december;
  @override
  @JsonKey(name: 'year_to_date')
  String get yearToDate;

  /// Create a copy of BudgetRealization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetRealizationImplCopyWith<_$BudgetRealizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
