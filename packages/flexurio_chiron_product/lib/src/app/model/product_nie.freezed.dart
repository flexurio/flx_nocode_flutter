// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_nie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductNie _$ProductNieFromJson(Map<String, dynamic> json) {
  return _ProductNie.fromJson(json);
}

/// @nodoc
mixin _$ProductNie {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
  DateTime get periodStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
  DateTime get periodEnd => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  @JsonKey(name: 'category', fromJson: ProductNieCategory.fromString)
  ProductNieCategory get category => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Product.fromJson)
  Product? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductNieCopyWith<ProductNie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductNieCopyWith<$Res> {
  factory $ProductNieCopyWith(
          ProductNie value, $Res Function(ProductNie) then) =
      _$ProductNieCopyWithImpl<$Res, ProductNie>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
      DateTime periodStart,
      @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
      DateTime periodEnd,
      String publisher,
      @JsonKey(name: 'category', fromJson: ProductNieCategory.fromString)
      ProductNieCategory category,
      @JsonKey(fromJson: Product.fromJson) Product? product});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductNieCopyWithImpl<$Res, $Val extends ProductNie>
    implements $ProductNieCopyWith<$Res> {
  _$ProductNieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? publisher = null,
    Object? category = null,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductNieCategory,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductNieImplCopyWith<$Res>
    implements $ProductNieCopyWith<$Res> {
  factory _$$ProductNieImplCopyWith(
          _$ProductNieImpl value, $Res Function(_$ProductNieImpl) then) =
      __$$ProductNieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
      DateTime periodStart,
      @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
      DateTime periodEnd,
      String publisher,
      @JsonKey(name: 'category', fromJson: ProductNieCategory.fromString)
      ProductNieCategory category,
      @JsonKey(fromJson: Product.fromJson) Product? product});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$ProductNieImplCopyWithImpl<$Res>
    extends _$ProductNieCopyWithImpl<$Res, _$ProductNieImpl>
    implements _$$ProductNieImplCopyWith<$Res> {
  __$$ProductNieImplCopyWithImpl(
      _$ProductNieImpl _value, $Res Function(_$ProductNieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? publisher = null,
    Object? category = null,
    Object? product = freezed,
  }) {
    return _then(_$ProductNieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ProductNieCategory,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductNieImpl extends _ProductNie {
  const _$ProductNieImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
      required this.periodStart,
      @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
      required this.periodEnd,
      required this.publisher,
      @JsonKey(name: 'category', fromJson: ProductNieCategory.fromString)
      required this.category,
      @JsonKey(fromJson: Product.fromJson) this.product})
      : super._();

  factory _$ProductNieImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductNieImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
  final DateTime periodStart;
  @override
  @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
  final DateTime periodEnd;
  @override
  final String publisher;
  @override
  @JsonKey(name: 'category', fromJson: ProductNieCategory.fromString)
  final ProductNieCategory category;
  @override
  @JsonKey(fromJson: Product.fromJson)
  final Product? product;

  @override
  String toString() {
    return 'ProductNie(id: $id, createAt: $createAt, createdById: $createdById, updatedAt: $updatedAt, periodStart: $periodStart, periodEnd: $periodEnd, publisher: $publisher, category: $category, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductNieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createAt, createdById,
      updatedAt, periodStart, periodEnd, publisher, category, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductNieImplCopyWith<_$ProductNieImpl> get copyWith =>
      __$$ProductNieImplCopyWithImpl<_$ProductNieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductNieImplToJson(
      this,
    );
  }
}

abstract class _ProductNie extends ProductNie {
  const factory _ProductNie(
          {required final String id,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createAt,
          @JsonKey(name: 'created_by_id') required final int createdById,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
          required final DateTime periodStart,
          @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
          required final DateTime periodEnd,
          required final String publisher,
          @JsonKey(name: 'category', fromJson: ProductNieCategory.fromString)
          required final ProductNieCategory category,
          @JsonKey(fromJson: Product.fromJson) final Product? product}) =
      _$ProductNieImpl;
  const _ProductNie._() : super._();

  factory _ProductNie.fromJson(Map<String, dynamic> json) =
      _$ProductNieImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
  DateTime get periodStart;
  @override
  @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
  DateTime get periodEnd;
  @override
  String get publisher;
  @override
  @JsonKey(name: 'category', fromJson: ProductNieCategory.fromString)
  ProductNieCategory get category;
  @override
  @JsonKey(fromJson: Product.fromJson)
  Product? get product;
  @override
  @JsonKey(ignore: true)
  _$$ProductNieImplCopyWith<_$ProductNieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
