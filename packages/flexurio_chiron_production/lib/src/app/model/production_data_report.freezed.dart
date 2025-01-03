// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_data_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionDataReport _$ProductionDataReportFromJson(Map<String, dynamic> json) {
  return _ProductionDataReport.fromJson(json);
}

/// @nodoc
mixin _$ProductionDataReport {
  @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
  DateTime get actualStartTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_order')
  String get productionOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_stage_name')
  String get productionStageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine')
  String get machine => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_sub_stage_name')
  String get productionSubStageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine_name')
  String get machineName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_stage_name')
  String get subStageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'yield')
  int get yield => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionDataReportCopyWith<ProductionDataReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionDataReportCopyWith<$Res> {
  factory $ProductionDataReportCopyWith(ProductionDataReport value,
          $Res Function(ProductionDataReport) then) =
      _$ProductionDataReportCopyWithImpl<$Res, ProductionDataReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
      DateTime actualStartTime,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'production_order') String productionOrder,
      @JsonKey(name: 'production_stage_name') String productionStageName,
      @JsonKey(name: 'machine') String machine,
      @JsonKey(name: 'production_sub_stage_name') String productionSubStageName,
      @JsonKey(name: 'machine_name') String machineName,
      @JsonKey(name: 'sub_stage_name') String subStageName,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'yield') int yield});
}

/// @nodoc
class _$ProductionDataReportCopyWithImpl<$Res,
        $Val extends ProductionDataReport>
    implements $ProductionDataReportCopyWith<$Res> {
  _$ProductionDataReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actualStartTime = null,
    Object? productName = null,
    Object? productionOrder = null,
    Object? productionStageName = null,
    Object? machine = null,
    Object? productionSubStageName = null,
    Object? machineName = null,
    Object? subStageName = null,
    Object? status = null,
    Object? yield = null,
  }) {
    return _then(_value.copyWith(
      actualStartTime: null == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as String,
      productionStageName: null == productionStageName
          ? _value.productionStageName
          : productionStageName // ignore: cast_nullable_to_non_nullable
              as String,
      machine: null == machine
          ? _value.machine
          : machine // ignore: cast_nullable_to_non_nullable
              as String,
      productionSubStageName: null == productionSubStageName
          ? _value.productionSubStageName
          : productionSubStageName // ignore: cast_nullable_to_non_nullable
              as String,
      machineName: null == machineName
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
      subStageName: null == subStageName
          ? _value.subStageName
          : subStageName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      yield: null == yield
          ? _value.yield
          : yield // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionDataReportImplCopyWith<$Res>
    implements $ProductionDataReportCopyWith<$Res> {
  factory _$$ProductionDataReportImplCopyWith(_$ProductionDataReportImpl value,
          $Res Function(_$ProductionDataReportImpl) then) =
      __$$ProductionDataReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
      DateTime actualStartTime,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'production_order') String productionOrder,
      @JsonKey(name: 'production_stage_name') String productionStageName,
      @JsonKey(name: 'machine') String machine,
      @JsonKey(name: 'production_sub_stage_name') String productionSubStageName,
      @JsonKey(name: 'machine_name') String machineName,
      @JsonKey(name: 'sub_stage_name') String subStageName,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'yield') int yield});
}

/// @nodoc
class __$$ProductionDataReportImplCopyWithImpl<$Res>
    extends _$ProductionDataReportCopyWithImpl<$Res, _$ProductionDataReportImpl>
    implements _$$ProductionDataReportImplCopyWith<$Res> {
  __$$ProductionDataReportImplCopyWithImpl(_$ProductionDataReportImpl _value,
      $Res Function(_$ProductionDataReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actualStartTime = null,
    Object? productName = null,
    Object? productionOrder = null,
    Object? productionStageName = null,
    Object? machine = null,
    Object? productionSubStageName = null,
    Object? machineName = null,
    Object? subStageName = null,
    Object? status = null,
    Object? yield = null,
  }) {
    return _then(_$ProductionDataReportImpl(
      actualStartTime: null == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as String,
      productionStageName: null == productionStageName
          ? _value.productionStageName
          : productionStageName // ignore: cast_nullable_to_non_nullable
              as String,
      machine: null == machine
          ? _value.machine
          : machine // ignore: cast_nullable_to_non_nullable
              as String,
      productionSubStageName: null == productionSubStageName
          ? _value.productionSubStageName
          : productionSubStageName // ignore: cast_nullable_to_non_nullable
              as String,
      machineName: null == machineName
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
      subStageName: null == subStageName
          ? _value.subStageName
          : subStageName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      yield: null == yield
          ? _value.yield
          : yield // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionDataReportImpl extends _ProductionDataReport {
  _$ProductionDataReportImpl(
      {@JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
      required this.actualStartTime,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'production_order') required this.productionOrder,
      @JsonKey(name: 'production_stage_name') required this.productionStageName,
      @JsonKey(name: 'machine') required this.machine,
      @JsonKey(name: 'production_sub_stage_name')
      required this.productionSubStageName,
      @JsonKey(name: 'machine_name') required this.machineName,
      @JsonKey(name: 'sub_stage_name') required this.subStageName,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'yield') required this.yield})
      : super._();

  factory _$ProductionDataReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionDataReportImplFromJson(json);

  @override
  @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
  final DateTime actualStartTime;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'production_order')
  final String productionOrder;
  @override
  @JsonKey(name: 'production_stage_name')
  final String productionStageName;
  @override
  @JsonKey(name: 'machine')
  final String machine;
  @override
  @JsonKey(name: 'production_sub_stage_name')
  final String productionSubStageName;
  @override
  @JsonKey(name: 'machine_name')
  final String machineName;
  @override
  @JsonKey(name: 'sub_stage_name')
  final String subStageName;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'yield')
  final int yield;

  @override
  String toString() {
    return 'ProductionDataReport(actualStartTime: $actualStartTime, productName: $productName, productionOrder: $productionOrder, productionStageName: $productionStageName, machine: $machine, productionSubStageName: $productionSubStageName, machineName: $machineName, subStageName: $subStageName, status: $status, yield: $yield)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionDataReportImpl &&
            (identical(other.actualStartTime, actualStartTime) ||
                other.actualStartTime == actualStartTime) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.productionStageName, productionStageName) ||
                other.productionStageName == productionStageName) &&
            (identical(other.machine, machine) || other.machine == machine) &&
            (identical(other.productionSubStageName, productionSubStageName) ||
                other.productionSubStageName == productionSubStageName) &&
            (identical(other.machineName, machineName) ||
                other.machineName == machineName) &&
            (identical(other.subStageName, subStageName) ||
                other.subStageName == subStageName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.yield, yield) || other.yield == yield));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      actualStartTime,
      productName,
      productionOrder,
      productionStageName,
      machine,
      productionSubStageName,
      machineName,
      subStageName,
      status,
      yield);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionDataReportImplCopyWith<_$ProductionDataReportImpl>
      get copyWith =>
          __$$ProductionDataReportImplCopyWithImpl<_$ProductionDataReportImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionDataReportImplToJson(
      this,
    );
  }
}

abstract class _ProductionDataReport extends ProductionDataReport {
  factory _ProductionDataReport(
      {@JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
      required final DateTime actualStartTime,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'production_order') required final String productionOrder,
      @JsonKey(name: 'production_stage_name')
      required final String productionStageName,
      @JsonKey(name: 'machine') required final String machine,
      @JsonKey(name: 'production_sub_stage_name')
      required final String productionSubStageName,
      @JsonKey(name: 'machine_name') required final String machineName,
      @JsonKey(name: 'sub_stage_name') required final String subStageName,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'yield')
      required final int yield}) = _$ProductionDataReportImpl;
  _ProductionDataReport._() : super._();

  factory _ProductionDataReport.fromJson(Map<String, dynamic> json) =
      _$ProductionDataReportImpl.fromJson;

  @override
  @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
  DateTime get actualStartTime;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'production_order')
  String get productionOrder;
  @override
  @JsonKey(name: 'production_stage_name')
  String get productionStageName;
  @override
  @JsonKey(name: 'machine')
  String get machine;
  @override
  @JsonKey(name: 'production_sub_stage_name')
  String get productionSubStageName;
  @override
  @JsonKey(name: 'machine_name')
  String get machineName;
  @override
  @JsonKey(name: 'sub_stage_name')
  String get subStageName;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'yield')
  int get yield;
  @override
  @JsonKey(ignore: true)
  _$$ProductionDataReportImplCopyWith<_$ProductionDataReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
