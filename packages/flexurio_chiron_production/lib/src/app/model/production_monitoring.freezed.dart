// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_monitoring.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionMonitoring _$ProductionMonitoringFromJson(Map<String, dynamic> json) {
  return _ProductionMonitoring.fromJson(json);
}

/// @nodoc
mixin _$ProductionMonitoring {
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_sub_stage_id')
  int get productionSubStageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_sub_stage_name')
  String get productionSubStageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_stage_name')
  String get productionStageName => throw _privateConstructorUsedError;
  String get ordinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine_id')
  int get machineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine_name')
  String get machineName => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  DateTime get endTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'quarantine_date', fromJson: dateTimeNullable)
  DateTime? get quarantineDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  DateTime? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date', fromJson: dateTimeNullable)
  DateTime? get releaseDate => throw _privateConstructorUsedError;

  /// Serializes this ProductionMonitoring to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductionMonitoring
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductionMonitoringCopyWith<ProductionMonitoring> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionMonitoringCopyWith<$Res> {
  factory $ProductionMonitoringCopyWith(ProductionMonitoring value,
          $Res Function(ProductionMonitoring) then) =
      _$ProductionMonitoringCopyWithImpl<$Res, ProductionMonitoring>;
  @useResult
  $Res call(
      {@JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'production_sub_stage_id') int productionSubStageId,
      @JsonKey(name: 'production_sub_stage_name') String productionSubStageName,
      @JsonKey(name: 'production_stage_name') String productionStageName,
      String ordinal,
      @JsonKey(name: 'machine_id') int machineId,
      @JsonKey(name: 'machine_name') String machineName,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) DateTime endTime,
      String status,
      String description,
      @JsonKey(name: 'quarantine_date', fromJson: dateTimeNullable)
      DateTime? quarantineDate,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      DateTime? expiredDate,
      @JsonKey(name: 'release_date', fromJson: dateTimeNullable)
      DateTime? releaseDate});
}

/// @nodoc
class _$ProductionMonitoringCopyWithImpl<$Res,
        $Val extends ProductionMonitoring>
    implements $ProductionMonitoringCopyWith<$Res> {
  _$ProductionMonitoringCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductionMonitoring
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchNo = null,
    Object? productId = null,
    Object? productName = null,
    Object? productionSubStageId = null,
    Object? productionSubStageName = null,
    Object? productionStageName = null,
    Object? ordinal = null,
    Object? machineId = null,
    Object? machineName = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? description = null,
    Object? quarantineDate = freezed,
    Object? expiredDate = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_value.copyWith(
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productionSubStageId: null == productionSubStageId
          ? _value.productionSubStageId
          : productionSubStageId // ignore: cast_nullable_to_non_nullable
              as int,
      productionSubStageName: null == productionSubStageName
          ? _value.productionSubStageName
          : productionSubStageName // ignore: cast_nullable_to_non_nullable
              as String,
      productionStageName: null == productionStageName
          ? _value.productionStageName
          : productionStageName // ignore: cast_nullable_to_non_nullable
              as String,
      ordinal: null == ordinal
          ? _value.ordinal
          : ordinal // ignore: cast_nullable_to_non_nullable
              as String,
      machineId: null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as int,
      machineName: null == machineName
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quarantineDate: freezed == quarantineDate
          ? _value.quarantineDate
          : quarantineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionMonitoringImplCopyWith<$Res>
    implements $ProductionMonitoringCopyWith<$Res> {
  factory _$$ProductionMonitoringImplCopyWith(_$ProductionMonitoringImpl value,
          $Res Function(_$ProductionMonitoringImpl) then) =
      __$$ProductionMonitoringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'production_sub_stage_id') int productionSubStageId,
      @JsonKey(name: 'production_sub_stage_name') String productionSubStageName,
      @JsonKey(name: 'production_stage_name') String productionStageName,
      String ordinal,
      @JsonKey(name: 'machine_id') int machineId,
      @JsonKey(name: 'machine_name') String machineName,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) DateTime endTime,
      String status,
      String description,
      @JsonKey(name: 'quarantine_date', fromJson: dateTimeNullable)
      DateTime? quarantineDate,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      DateTime? expiredDate,
      @JsonKey(name: 'release_date', fromJson: dateTimeNullable)
      DateTime? releaseDate});
}

/// @nodoc
class __$$ProductionMonitoringImplCopyWithImpl<$Res>
    extends _$ProductionMonitoringCopyWithImpl<$Res, _$ProductionMonitoringImpl>
    implements _$$ProductionMonitoringImplCopyWith<$Res> {
  __$$ProductionMonitoringImplCopyWithImpl(_$ProductionMonitoringImpl _value,
      $Res Function(_$ProductionMonitoringImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductionMonitoring
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchNo = null,
    Object? productId = null,
    Object? productName = null,
    Object? productionSubStageId = null,
    Object? productionSubStageName = null,
    Object? productionStageName = null,
    Object? ordinal = null,
    Object? machineId = null,
    Object? machineName = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? description = null,
    Object? quarantineDate = freezed,
    Object? expiredDate = freezed,
    Object? releaseDate = freezed,
  }) {
    return _then(_$ProductionMonitoringImpl(
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productionSubStageId: null == productionSubStageId
          ? _value.productionSubStageId
          : productionSubStageId // ignore: cast_nullable_to_non_nullable
              as int,
      productionSubStageName: null == productionSubStageName
          ? _value.productionSubStageName
          : productionSubStageName // ignore: cast_nullable_to_non_nullable
              as String,
      productionStageName: null == productionStageName
          ? _value.productionStageName
          : productionStageName // ignore: cast_nullable_to_non_nullable
              as String,
      ordinal: null == ordinal
          ? _value.ordinal
          : ordinal // ignore: cast_nullable_to_non_nullable
              as String,
      machineId: null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as int,
      machineName: null == machineName
          ? _value.machineName
          : machineName // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quarantineDate: freezed == quarantineDate
          ? _value.quarantineDate
          : quarantineDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionMonitoringImpl extends _ProductionMonitoring {
  const _$ProductionMonitoringImpl(
      {@JsonKey(name: 'batch_no') required this.batchNo,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'production_sub_stage_id')
      required this.productionSubStageId,
      @JsonKey(name: 'production_sub_stage_name')
      required this.productionSubStageName,
      @JsonKey(name: 'production_stage_name') required this.productionStageName,
      required this.ordinal,
      @JsonKey(name: 'machine_id') required this.machineId,
      @JsonKey(name: 'machine_name') required this.machineName,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      required this.startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
      required this.endTime,
      required this.status,
      required this.description,
      @JsonKey(name: 'quarantine_date', fromJson: dateTimeNullable)
      this.quarantineDate,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      this.expiredDate,
      @JsonKey(name: 'release_date', fromJson: dateTimeNullable)
      this.releaseDate})
      : super._();

  factory _$ProductionMonitoringImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionMonitoringImplFromJson(json);

  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'production_sub_stage_id')
  final int productionSubStageId;
  @override
  @JsonKey(name: 'production_sub_stage_name')
  final String productionSubStageName;
  @override
  @JsonKey(name: 'production_stage_name')
  final String productionStageName;
  @override
  final String ordinal;
  @override
  @JsonKey(name: 'machine_id')
  final int machineId;
  @override
  @JsonKey(name: 'machine_name')
  final String machineName;
  @override
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  final DateTime startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  final DateTime endTime;
  @override
  final String status;
  @override
  final String description;
  @override
  @JsonKey(name: 'quarantine_date', fromJson: dateTimeNullable)
  final DateTime? quarantineDate;
  @override
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  final DateTime? expiredDate;
  @override
  @JsonKey(name: 'release_date', fromJson: dateTimeNullable)
  final DateTime? releaseDate;

  @override
  String toString() {
    return 'ProductionMonitoring(batchNo: $batchNo, productId: $productId, productName: $productName, productionSubStageId: $productionSubStageId, productionSubStageName: $productionSubStageName, productionStageName: $productionStageName, ordinal: $ordinal, machineId: $machineId, machineName: $machineName, startTime: $startTime, endTime: $endTime, status: $status, description: $description, quarantineDate: $quarantineDate, expiredDate: $expiredDate, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionMonitoringImpl &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productionSubStageId, productionSubStageId) ||
                other.productionSubStageId == productionSubStageId) &&
            (identical(other.productionSubStageName, productionSubStageName) ||
                other.productionSubStageName == productionSubStageName) &&
            (identical(other.productionStageName, productionStageName) ||
                other.productionStageName == productionStageName) &&
            (identical(other.ordinal, ordinal) || other.ordinal == ordinal) &&
            (identical(other.machineId, machineId) ||
                other.machineId == machineId) &&
            (identical(other.machineName, machineName) ||
                other.machineName == machineName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quarantineDate, quarantineDate) ||
                other.quarantineDate == quarantineDate) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      batchNo,
      productId,
      productName,
      productionSubStageId,
      productionSubStageName,
      productionStageName,
      ordinal,
      machineId,
      machineName,
      startTime,
      endTime,
      status,
      description,
      quarantineDate,
      expiredDate,
      releaseDate);

  /// Create a copy of ProductionMonitoring
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionMonitoringImplCopyWith<_$ProductionMonitoringImpl>
      get copyWith =>
          __$$ProductionMonitoringImplCopyWithImpl<_$ProductionMonitoringImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionMonitoringImplToJson(
      this,
    );
  }
}

abstract class _ProductionMonitoring extends ProductionMonitoring {
  const factory _ProductionMonitoring(
      {@JsonKey(name: 'batch_no') required final String batchNo,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'production_sub_stage_id')
      required final int productionSubStageId,
      @JsonKey(name: 'production_sub_stage_name')
      required final String productionSubStageName,
      @JsonKey(name: 'production_stage_name')
      required final String productionStageName,
      required final String ordinal,
      @JsonKey(name: 'machine_id') required final int machineId,
      @JsonKey(name: 'machine_name') required final String machineName,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      required final DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
      required final DateTime endTime,
      required final String status,
      required final String description,
      @JsonKey(name: 'quarantine_date', fromJson: dateTimeNullable)
      final DateTime? quarantineDate,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      final DateTime? expiredDate,
      @JsonKey(name: 'release_date', fromJson: dateTimeNullable)
      final DateTime? releaseDate}) = _$ProductionMonitoringImpl;
  const _ProductionMonitoring._() : super._();

  factory _ProductionMonitoring.fromJson(Map<String, dynamic> json) =
      _$ProductionMonitoringImpl.fromJson;

  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'production_sub_stage_id')
  int get productionSubStageId;
  @override
  @JsonKey(name: 'production_sub_stage_name')
  String get productionSubStageName;
  @override
  @JsonKey(name: 'production_stage_name')
  String get productionStageName;
  @override
  String get ordinal;
  @override
  @JsonKey(name: 'machine_id')
  int get machineId;
  @override
  @JsonKey(name: 'machine_name')
  String get machineName;
  @override
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  DateTime get startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  DateTime get endTime;
  @override
  String get status;
  @override
  String get description;
  @override
  @JsonKey(name: 'quarantine_date', fromJson: dateTimeNullable)
  DateTime? get quarantineDate;
  @override
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  DateTime? get expiredDate;
  @override
  @JsonKey(name: 'release_date', fromJson: dateTimeNullable)
  DateTime? get releaseDate;

  /// Create a copy of ProductionMonitoring
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductionMonitoringImplCopyWith<_$ProductionMonitoringImpl>
      get copyWith => throw _privateConstructorUsedError;
}
