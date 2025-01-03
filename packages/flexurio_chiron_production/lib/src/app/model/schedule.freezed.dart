// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_man')
  int get quantityMan => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  DateTime get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  DateTime get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
  DateTime get actualStartTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_end_time', fromJson: isoDateToDateTime)
  DateTime get actualEndTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'yield')
  double get yield => throw _privateConstructorUsedError;
  @JsonKey(name: 'over_time')
  int get overTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_hour_type', fromJson: WorkHourType.fromString)
  WorkHourType get workHourType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_close', defaultValue: false)
  bool get isClose => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_toll', defaultValue: false)
  bool get isToll => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_order', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_hour_shift', fromJson: WorkHourShift.fromJson)
  WorkHourShift get workHourShift => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'production_stage_process',
      fromJson: ProductionStageProcess.fromJson)
  ProductionStageProcess get productionStageProcess =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'quantity_man') int quantityMan,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) DateTime endTime,
      @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
      DateTime actualStartTime,
      @JsonKey(name: 'actual_end_time', fromJson: isoDateToDateTime)
      DateTime actualEndTime,
      @JsonKey(name: 'yield') double yield,
      @JsonKey(name: 'over_time') int overTime,
      @JsonKey(name: 'notes') String notes,
      @JsonKey(name: 'work_hour_type', fromJson: WorkHourType.fromString)
      WorkHourType workHourType,
      @JsonKey(name: 'is_close', defaultValue: false) bool isClose,
      @JsonKey(name: 'is_toll', defaultValue: false) bool isToll,
      @JsonKey(name: 'production_order', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'work_hour_shift', fromJson: WorkHourShift.fromJson)
      WorkHourShift workHourShift,
      @JsonKey(
          name: 'production_stage_process',
          fromJson: ProductionStageProcess.fromJson)
      ProductionStageProcess productionStageProcess,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  $ProductionOrderCopyWith<$Res> get productionOrder;
  $ProductCopyWith<$Res> get product;
  $WorkHourShiftCopyWith<$Res> get workHourShift;
  $ProductionStageProcessCopyWith<$Res> get productionStageProcess;
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantityMan = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? actualStartTime = null,
    Object? actualEndTime = null,
    Object? yield = null,
    Object? overTime = null,
    Object? notes = null,
    Object? workHourType = null,
    Object? isClose = null,
    Object? isToll = null,
    Object? productionOrder = null,
    Object? product = null,
    Object? workHourShift = null,
    Object? productionStageProcess = null,
    Object? materialUnit = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantityMan: null == quantityMan
          ? _value.quantityMan
          : quantityMan // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualStartTime: null == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualEndTime: null == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yield: null == yield
          ? _value.yield
          : yield // ignore: cast_nullable_to_non_nullable
              as double,
      overTime: null == overTime
          ? _value.overTime
          : overTime // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      workHourType: null == workHourType
          ? _value.workHourType
          : workHourType // ignore: cast_nullable_to_non_nullable
              as WorkHourType,
      isClose: null == isClose
          ? _value.isClose
          : isClose // ignore: cast_nullable_to_non_nullable
              as bool,
      isToll: null == isToll
          ? _value.isToll
          : isToll // ignore: cast_nullable_to_non_nullable
              as bool,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      workHourShift: null == workHourShift
          ? _value.workHourShift
          : workHourShift // ignore: cast_nullable_to_non_nullable
              as WorkHourShift,
      productionStageProcess: null == productionStageProcess
          ? _value.productionStageProcess
          : productionStageProcess // ignore: cast_nullable_to_non_nullable
              as ProductionStageProcess,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get productionOrder {
    return $ProductionOrderCopyWith<$Res>(_value.productionOrder, (value) {
      return _then(_value.copyWith(productionOrder: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkHourShiftCopyWith<$Res> get workHourShift {
    return $WorkHourShiftCopyWith<$Res>(_value.workHourShift, (value) {
      return _then(_value.copyWith(workHourShift: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionStageProcessCopyWith<$Res> get productionStageProcess {
    return $ProductionStageProcessCopyWith<$Res>(_value.productionStageProcess,
        (value) {
      return _then(_value.copyWith(productionStageProcess: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleImplCopyWith(
          _$ScheduleImpl value, $Res Function(_$ScheduleImpl) then) =
      __$$ScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'quantity_man') int quantityMan,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) DateTime endTime,
      @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
      DateTime actualStartTime,
      @JsonKey(name: 'actual_end_time', fromJson: isoDateToDateTime)
      DateTime actualEndTime,
      @JsonKey(name: 'yield') double yield,
      @JsonKey(name: 'over_time') int overTime,
      @JsonKey(name: 'notes') String notes,
      @JsonKey(name: 'work_hour_type', fromJson: WorkHourType.fromString)
      WorkHourType workHourType,
      @JsonKey(name: 'is_close', defaultValue: false) bool isClose,
      @JsonKey(name: 'is_toll', defaultValue: false) bool isToll,
      @JsonKey(name: 'production_order', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'work_hour_shift', fromJson: WorkHourShift.fromJson)
      WorkHourShift workHourShift,
      @JsonKey(
          name: 'production_stage_process',
          fromJson: ProductionStageProcess.fromJson)
      ProductionStageProcess productionStageProcess,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  @override
  $ProductionOrderCopyWith<$Res> get productionOrder;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $WorkHourShiftCopyWith<$Res> get workHourShift;
  @override
  $ProductionStageProcessCopyWith<$Res> get productionStageProcess;
  @override
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class __$$ScheduleImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleImpl>
    implements _$$ScheduleImplCopyWith<$Res> {
  __$$ScheduleImplCopyWithImpl(
      _$ScheduleImpl _value, $Res Function(_$ScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantityMan = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? actualStartTime = null,
    Object? actualEndTime = null,
    Object? yield = null,
    Object? overTime = null,
    Object? notes = null,
    Object? workHourType = null,
    Object? isClose = null,
    Object? isToll = null,
    Object? productionOrder = null,
    Object? product = null,
    Object? workHourShift = null,
    Object? productionStageProcess = null,
    Object? materialUnit = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ScheduleImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == quantityMan
          ? _value.quantityMan
          : quantityMan // ignore: cast_nullable_to_non_nullable
              as int,
      null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == yield
          ? _value.yield
          : yield // ignore: cast_nullable_to_non_nullable
              as double,
      null == overTime
          ? _value.overTime
          : overTime // ignore: cast_nullable_to_non_nullable
              as int,
      null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      null == workHourType
          ? _value.workHourType
          : workHourType // ignore: cast_nullable_to_non_nullable
              as WorkHourType,
      null == isClose
          ? _value.isClose
          : isClose // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isToll
          ? _value.isToll
          : isToll // ignore: cast_nullable_to_non_nullable
              as bool,
      null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      null == workHourShift
          ? _value.workHourShift
          : workHourShift // ignore: cast_nullable_to_non_nullable
              as WorkHourShift,
      null == productionStageProcess
          ? _value.productionStageProcess
          : productionStageProcess // ignore: cast_nullable_to_non_nullable
              as ProductionStageProcess,
      null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleImpl extends _Schedule {
  _$ScheduleImpl(
      this.id,
      @JsonKey(name: 'quantity_man') this.quantityMan,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime) this.startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime) this.endTime,
      @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
      this.actualStartTime,
      @JsonKey(name: 'actual_end_time', fromJson: isoDateToDateTime)
      this.actualEndTime,
      @JsonKey(name: 'yield') this.yield,
      @JsonKey(name: 'over_time') this.overTime,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'work_hour_type', fromJson: WorkHourType.fromString)
      this.workHourType,
      @JsonKey(name: 'is_close', defaultValue: false) this.isClose,
      @JsonKey(name: 'is_toll', defaultValue: false) this.isToll,
      @JsonKey(name: 'production_order', fromJson: ProductionOrder.fromJson)
      this.productionOrder,
      @JsonKey(name: 'product', fromJson: Product.fromJson) this.product,
      @JsonKey(name: 'work_hour_shift', fromJson: WorkHourShift.fromJson)
      this.workHourShift,
      @JsonKey(
          name: 'production_stage_process',
          fromJson: ProductionStageProcess.fromJson)
      this.productionStageProcess,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) this.materialUnit,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt)
      : super._();

  factory _$ScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'quantity_man')
  final int quantityMan;
  @override
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  final DateTime startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  final DateTime endTime;
  @override
  @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
  final DateTime actualStartTime;
  @override
  @JsonKey(name: 'actual_end_time', fromJson: isoDateToDateTime)
  final DateTime actualEndTime;
  @override
  @JsonKey(name: 'yield')
  final double yield;
  @override
  @JsonKey(name: 'over_time')
  final int overTime;
  @override
  @JsonKey(name: 'notes')
  final String notes;
  @override
  @JsonKey(name: 'work_hour_type', fromJson: WorkHourType.fromString)
  final WorkHourType workHourType;
  @override
  @JsonKey(name: 'is_close', defaultValue: false)
  final bool isClose;
  @override
  @JsonKey(name: 'is_toll', defaultValue: false)
  final bool isToll;
  @override
  @JsonKey(name: 'production_order', fromJson: ProductionOrder.fromJson)
  final ProductionOrder productionOrder;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'work_hour_shift', fromJson: WorkHourShift.fromJson)
  final WorkHourShift workHourShift;
  @override
  @JsonKey(
      name: 'production_stage_process',
      fromJson: ProductionStageProcess.fromJson)
  final ProductionStageProcess productionStageProcess;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit materialUnit;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Schedule(id: $id, quantityMan: $quantityMan, startTime: $startTime, endTime: $endTime, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, yield: $yield, overTime: $overTime, notes: $notes, workHourType: $workHourType, isClose: $isClose, isToll: $isToll, productionOrder: $productionOrder, product: $product, workHourShift: $workHourShift, productionStageProcess: $productionStageProcess, materialUnit: $materialUnit, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantityMan, quantityMan) ||
                other.quantityMan == quantityMan) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.actualStartTime, actualStartTime) ||
                other.actualStartTime == actualStartTime) &&
            (identical(other.actualEndTime, actualEndTime) ||
                other.actualEndTime == actualEndTime) &&
            (identical(other.yield, yield) || other.yield == yield) &&
            (identical(other.overTime, overTime) ||
                other.overTime == overTime) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.workHourType, workHourType) ||
                other.workHourType == workHourType) &&
            (identical(other.isClose, isClose) || other.isClose == isClose) &&
            (identical(other.isToll, isToll) || other.isToll == isToll) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.workHourShift, workHourShift) ||
                other.workHourShift == workHourShift) &&
            (identical(other.productionStageProcess, productionStageProcess) ||
                other.productionStageProcess == productionStageProcess) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        quantityMan,
        startTime,
        endTime,
        actualStartTime,
        actualEndTime,
        yield,
        overTime,
        notes,
        workHourType,
        isClose,
        isToll,
        productionOrder,
        product,
        workHourShift,
        productionStageProcess,
        materialUnit,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      __$$ScheduleImplCopyWithImpl<_$ScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleImplToJson(
      this,
    );
  }
}

abstract class _Schedule extends Schedule {
  factory _Schedule(
      final int id,
      @JsonKey(name: 'quantity_man') final int quantityMan,
      @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
      final DateTime startTime,
      @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
      final DateTime endTime,
      @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
      final DateTime actualStartTime,
      @JsonKey(name: 'actual_end_time', fromJson: isoDateToDateTime)
      final DateTime actualEndTime,
      @JsonKey(name: 'yield') final double yield,
      @JsonKey(name: 'over_time') final int overTime,
      @JsonKey(name: 'notes') final String notes,
      @JsonKey(name: 'work_hour_type', fromJson: WorkHourType.fromString)
      final WorkHourType workHourType,
      @JsonKey(name: 'is_close', defaultValue: false) final bool isClose,
      @JsonKey(name: 'is_toll', defaultValue: false) final bool isToll,
      @JsonKey(name: 'production_order', fromJson: ProductionOrder.fromJson)
      final ProductionOrder productionOrder,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      final Product product,
      @JsonKey(name: 'work_hour_shift', fromJson: WorkHourShift.fromJson)
      final WorkHourShift workHourShift,
      @JsonKey(
          name: 'production_stage_process',
          fromJson: ProductionStageProcess.fromJson)
      final ProductionStageProcess productionStageProcess,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      final MaterialUnit materialUnit,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt) = _$ScheduleImpl;
  _Schedule._() : super._();

  factory _Schedule.fromJson(Map<String, dynamic> json) =
      _$ScheduleImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'quantity_man')
  int get quantityMan;
  @override
  @JsonKey(name: 'start_time', fromJson: isoDateToDateTime)
  DateTime get startTime;
  @override
  @JsonKey(name: 'end_time', fromJson: isoDateToDateTime)
  DateTime get endTime;
  @override
  @JsonKey(name: 'actual_start_time', fromJson: isoDateToDateTime)
  DateTime get actualStartTime;
  @override
  @JsonKey(name: 'actual_end_time', fromJson: isoDateToDateTime)
  DateTime get actualEndTime;
  @override
  @JsonKey(name: 'yield')
  double get yield;
  @override
  @JsonKey(name: 'over_time')
  int get overTime;
  @override
  @JsonKey(name: 'notes')
  String get notes;
  @override
  @JsonKey(name: 'work_hour_type', fromJson: WorkHourType.fromString)
  WorkHourType get workHourType;
  @override
  @JsonKey(name: 'is_close', defaultValue: false)
  bool get isClose;
  @override
  @JsonKey(name: 'is_toll', defaultValue: false)
  bool get isToll;
  @override
  @JsonKey(name: 'production_order', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'work_hour_shift', fromJson: WorkHourShift.fromJson)
  WorkHourShift get workHourShift;
  @override
  @JsonKey(
      name: 'production_stage_process',
      fromJson: ProductionStageProcess.fromJson)
  ProductionStageProcess get productionStageProcess;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleImplCopyWith<_$ScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
