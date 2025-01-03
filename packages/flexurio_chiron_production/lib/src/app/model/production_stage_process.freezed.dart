// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_stage_process.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionStageProcess _$ProductionStageProcessFromJson(
    Map<String, dynamic> json) {
  return _ProductionStageProcess.fromJson(json);
}

/// @nodoc
mixin _$ProductionStageProcess {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get ordinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'lead_time')
  double get leadTime => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'production_type', fromJson: ProductionStageProcessType.fromString)
  ProductionStageProcessType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine', fromJson: ProductionMachine.fromJson)
  ProductionMachine get productionMachine => throw _privateConstructorUsedError;
  @JsonKey(name: 'line', fromJson: ProductionLine.fromJson)
  ProductionLine get productionLine => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_substage', fromJson: ProductionSubStage.fromJson)
  ProductionSubStage get productionSubStage =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionStageProcessCopyWith<ProductionStageProcess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionStageProcessCopyWith<$Res> {
  factory $ProductionStageProcessCopyWith(ProductionStageProcess value,
          $Res Function(ProductionStageProcess) then) =
      _$ProductionStageProcessCopyWithImpl<$Res, ProductionStageProcess>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      int ordinal,
      @JsonKey(name: 'lead_time') double leadTime,
      @JsonKey(
          name: 'production_type',
          fromJson: ProductionStageProcessType.fromString)
      ProductionStageProcessType type,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'machine', fromJson: ProductionMachine.fromJson)
      ProductionMachine productionMachine,
      @JsonKey(name: 'line', fromJson: ProductionLine.fromJson)
      ProductionLine productionLine,
      @JsonKey(
          name: 'production_substage', fromJson: ProductionSubStage.fromJson)
      ProductionSubStage productionSubStage});

  $ProductCopyWith<$Res> get product;
  $ProductionMachineCopyWith<$Res> get productionMachine;
  $ProductionLineCopyWith<$Res> get productionLine;
  $ProductionSubStageCopyWith<$Res> get productionSubStage;
}

/// @nodoc
class _$ProductionStageProcessCopyWithImpl<$Res,
        $Val extends ProductionStageProcess>
    implements $ProductionStageProcessCopyWith<$Res> {
  _$ProductionStageProcessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? ordinal = null,
    Object? leadTime = null,
    Object? type = null,
    Object? product = null,
    Object? productionMachine = null,
    Object? productionLine = null,
    Object? productionSubStage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ordinal: null == ordinal
          ? _value.ordinal
          : ordinal // ignore: cast_nullable_to_non_nullable
              as int,
      leadTime: null == leadTime
          ? _value.leadTime
          : leadTime // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductionStageProcessType,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productionMachine: null == productionMachine
          ? _value.productionMachine
          : productionMachine // ignore: cast_nullable_to_non_nullable
              as ProductionMachine,
      productionLine: null == productionLine
          ? _value.productionLine
          : productionLine // ignore: cast_nullable_to_non_nullable
              as ProductionLine,
      productionSubStage: null == productionSubStage
          ? _value.productionSubStage
          : productionSubStage // ignore: cast_nullable_to_non_nullable
              as ProductionSubStage,
    ) as $Val);
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
  $ProductionMachineCopyWith<$Res> get productionMachine {
    return $ProductionMachineCopyWith<$Res>(_value.productionMachine, (value) {
      return _then(_value.copyWith(productionMachine: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionLineCopyWith<$Res> get productionLine {
    return $ProductionLineCopyWith<$Res>(_value.productionLine, (value) {
      return _then(_value.copyWith(productionLine: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionSubStageCopyWith<$Res> get productionSubStage {
    return $ProductionSubStageCopyWith<$Res>(_value.productionSubStage,
        (value) {
      return _then(_value.copyWith(productionSubStage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductionStageProcessImplCopyWith<$Res>
    implements $ProductionStageProcessCopyWith<$Res> {
  factory _$$ProductionStageProcessImplCopyWith(
          _$ProductionStageProcessImpl value,
          $Res Function(_$ProductionStageProcessImpl) then) =
      __$$ProductionStageProcessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      int ordinal,
      @JsonKey(name: 'lead_time') double leadTime,
      @JsonKey(
          name: 'production_type',
          fromJson: ProductionStageProcessType.fromString)
      ProductionStageProcessType type,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'machine', fromJson: ProductionMachine.fromJson)
      ProductionMachine productionMachine,
      @JsonKey(name: 'line', fromJson: ProductionLine.fromJson)
      ProductionLine productionLine,
      @JsonKey(
          name: 'production_substage', fromJson: ProductionSubStage.fromJson)
      ProductionSubStage productionSubStage});

  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductionMachineCopyWith<$Res> get productionMachine;
  @override
  $ProductionLineCopyWith<$Res> get productionLine;
  @override
  $ProductionSubStageCopyWith<$Res> get productionSubStage;
}

/// @nodoc
class __$$ProductionStageProcessImplCopyWithImpl<$Res>
    extends _$ProductionStageProcessCopyWithImpl<$Res,
        _$ProductionStageProcessImpl>
    implements _$$ProductionStageProcessImplCopyWith<$Res> {
  __$$ProductionStageProcessImplCopyWithImpl(
      _$ProductionStageProcessImpl _value,
      $Res Function(_$ProductionStageProcessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? ordinal = null,
    Object? leadTime = null,
    Object? type = null,
    Object? product = null,
    Object? productionMachine = null,
    Object? productionLine = null,
    Object? productionSubStage = null,
  }) {
    return _then(_$ProductionStageProcessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ordinal: null == ordinal
          ? _value.ordinal
          : ordinal // ignore: cast_nullable_to_non_nullable
              as int,
      leadTime: null == leadTime
          ? _value.leadTime
          : leadTime // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductionStageProcessType,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productionMachine: null == productionMachine
          ? _value.productionMachine
          : productionMachine // ignore: cast_nullable_to_non_nullable
              as ProductionMachine,
      productionLine: null == productionLine
          ? _value.productionLine
          : productionLine // ignore: cast_nullable_to_non_nullable
              as ProductionLine,
      productionSubStage: null == productionSubStage
          ? _value.productionSubStage
          : productionSubStage // ignore: cast_nullable_to_non_nullable
              as ProductionSubStage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionStageProcessImpl extends _ProductionStageProcess {
  _$ProductionStageProcessImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      required this.ordinal,
      @JsonKey(name: 'lead_time') required this.leadTime,
      @JsonKey(
          name: 'production_type',
          fromJson: ProductionStageProcessType.fromString)
      required this.type,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'machine', fromJson: ProductionMachine.fromJson)
      required this.productionMachine,
      @JsonKey(name: 'line', fromJson: ProductionLine.fromJson)
      required this.productionLine,
      @JsonKey(
          name: 'production_substage', fromJson: ProductionSubStage.fromJson)
      required this.productionSubStage})
      : super._();

  factory _$ProductionStageProcessImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionStageProcessImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final int ordinal;
  @override
  @JsonKey(name: 'lead_time')
  final double leadTime;
  @override
  @JsonKey(
      name: 'production_type', fromJson: ProductionStageProcessType.fromString)
  final ProductionStageProcessType type;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'machine', fromJson: ProductionMachine.fromJson)
  final ProductionMachine productionMachine;
  @override
  @JsonKey(name: 'line', fromJson: ProductionLine.fromJson)
  final ProductionLine productionLine;
  @override
  @JsonKey(name: 'production_substage', fromJson: ProductionSubStage.fromJson)
  final ProductionSubStage productionSubStage;

  @override
  String toString() {
    return 'ProductionStageProcess(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, ordinal: $ordinal, leadTime: $leadTime, type: $type, product: $product, productionMachine: $productionMachine, productionLine: $productionLine, productionSubStage: $productionSubStage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionStageProcessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.ordinal, ordinal) || other.ordinal == ordinal) &&
            (identical(other.leadTime, leadTime) ||
                other.leadTime == leadTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productionMachine, productionMachine) ||
                other.productionMachine == productionMachine) &&
            (identical(other.productionLine, productionLine) ||
                other.productionLine == productionLine) &&
            (identical(other.productionSubStage, productionSubStage) ||
                other.productionSubStage == productionSubStage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      ordinal,
      leadTime,
      type,
      product,
      productionMachine,
      productionLine,
      productionSubStage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionStageProcessImplCopyWith<_$ProductionStageProcessImpl>
      get copyWith => __$$ProductionStageProcessImplCopyWithImpl<
          _$ProductionStageProcessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionStageProcessImplToJson(
      this,
    );
  }
}

abstract class _ProductionStageProcess extends ProductionStageProcess {
  factory _ProductionStageProcess(
          {required final int id,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          required final int ordinal,
          @JsonKey(name: 'lead_time') required final double leadTime,
          @JsonKey(
              name: 'production_type',
              fromJson: ProductionStageProcessType.fromString)
          required final ProductionStageProcessType type,
          @JsonKey(name: 'product', fromJson: Product.fromJson)
          required final Product product,
          @JsonKey(name: 'machine', fromJson: ProductionMachine.fromJson)
          required final ProductionMachine productionMachine,
          @JsonKey(name: 'line', fromJson: ProductionLine.fromJson)
          required final ProductionLine productionLine,
          @JsonKey(
              name: 'production_substage',
              fromJson: ProductionSubStage.fromJson)
          required final ProductionSubStage productionSubStage}) =
      _$ProductionStageProcessImpl;
  _ProductionStageProcess._() : super._();

  factory _ProductionStageProcess.fromJson(Map<String, dynamic> json) =
      _$ProductionStageProcessImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  int get ordinal;
  @override
  @JsonKey(name: 'lead_time')
  double get leadTime;
  @override
  @JsonKey(
      name: 'production_type', fromJson: ProductionStageProcessType.fromString)
  ProductionStageProcessType get type;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'machine', fromJson: ProductionMachine.fromJson)
  ProductionMachine get productionMachine;
  @override
  @JsonKey(name: 'line', fromJson: ProductionLine.fromJson)
  ProductionLine get productionLine;
  @override
  @JsonKey(name: 'production_substage', fromJson: ProductionSubStage.fromJson)
  ProductionSubStage get productionSubStage;
  @override
  @JsonKey(ignore: true)
  _$$ProductionStageProcessImplCopyWith<_$ProductionStageProcessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
