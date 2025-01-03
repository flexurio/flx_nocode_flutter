// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_return_note_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReturnNoteDetail _$MaterialReturnNoteDetailFromJson(
    Map<String, dynamic> json) {
  return _MaterialReturnNoteDetail.fromJson(json);
}

/// @nodoc
mixin _$MaterialReturnNoteDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_note', fromJson: MaterialReturnNote.fromJson)
  MaterialReturnNote get returnNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency', fromJson: Currency.fromJson)
  Currency get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_total')
  int get subtotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReturnNoteDetailCopyWith<MaterialReturnNoteDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReturnNoteDetailCopyWith<$Res> {
  factory $MaterialReturnNoteDetailCopyWith(MaterialReturnNoteDetail value,
          $Res Function(MaterialReturnNoteDetail) then) =
      _$MaterialReturnNoteDetailCopyWithImpl<$Res, MaterialReturnNoteDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'return_note', fromJson: MaterialReturnNote.fromJson)
      MaterialReturnNote returnNote,
      @JsonKey(name: 'currency', fromJson: Currency.fromJson) Currency currency,
      String description,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      String unit,
      int quantity,
      int price,
      @JsonKey(name: 'sub_total') int subtotal});

  $MaterialReturnNoteCopyWith<$Res> get returnNote;
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$MaterialReturnNoteDetailCopyWithImpl<$Res,
        $Val extends MaterialReturnNoteDetail>
    implements $MaterialReturnNoteDetailCopyWith<$Res> {
  _$MaterialReturnNoteDetailCopyWithImpl(this._value, this._then);

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
    Object? returnNote = null,
    Object? currency = null,
    Object? description = null,
    Object? productId = null,
    Object? productName = null,
    Object? unit = null,
    Object? quantity = null,
    Object? price = null,
    Object? subtotal = null,
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
      returnNote: null == returnNote
          ? _value.returnNote
          : returnNote // ignore: cast_nullable_to_non_nullable
              as MaterialReturnNote,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialReturnNoteCopyWith<$Res> get returnNote {
    return $MaterialReturnNoteCopyWith<$Res>(_value.returnNote, (value) {
      return _then(_value.copyWith(returnNote: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialReturnNoteDetailImplCopyWith<$Res>
    implements $MaterialReturnNoteDetailCopyWith<$Res> {
  factory _$$MaterialReturnNoteDetailImplCopyWith(
          _$MaterialReturnNoteDetailImpl value,
          $Res Function(_$MaterialReturnNoteDetailImpl) then) =
      __$$MaterialReturnNoteDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'return_note', fromJson: MaterialReturnNote.fromJson)
      MaterialReturnNote returnNote,
      @JsonKey(name: 'currency', fromJson: Currency.fromJson) Currency currency,
      String description,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      String unit,
      int quantity,
      int price,
      @JsonKey(name: 'sub_total') int subtotal});

  @override
  $MaterialReturnNoteCopyWith<$Res> get returnNote;
  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$MaterialReturnNoteDetailImplCopyWithImpl<$Res>
    extends _$MaterialReturnNoteDetailCopyWithImpl<$Res,
        _$MaterialReturnNoteDetailImpl>
    implements _$$MaterialReturnNoteDetailImplCopyWith<$Res> {
  __$$MaterialReturnNoteDetailImplCopyWithImpl(
      _$MaterialReturnNoteDetailImpl _value,
      $Res Function(_$MaterialReturnNoteDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? returnNote = null,
    Object? currency = null,
    Object? description = null,
    Object? productId = null,
    Object? productName = null,
    Object? unit = null,
    Object? quantity = null,
    Object? price = null,
    Object? subtotal = null,
  }) {
    return _then(_$MaterialReturnNoteDetailImpl(
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
      returnNote: null == returnNote
          ? _value.returnNote
          : returnNote // ignore: cast_nullable_to_non_nullable
              as MaterialReturnNote,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReturnNoteDetailImpl extends _MaterialReturnNoteDetail {
  _$MaterialReturnNoteDetailImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'return_note', fromJson: MaterialReturnNote.fromJson)
      required this.returnNote,
      @JsonKey(name: 'currency', fromJson: Currency.fromJson)
      required this.currency,
      required this.description,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      required this.unit,
      required this.quantity,
      required this.price,
      @JsonKey(name: 'sub_total') required this.subtotal})
      : super._();

  factory _$MaterialReturnNoteDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReturnNoteDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'return_note', fromJson: MaterialReturnNote.fromJson)
  final MaterialReturnNote returnNote;
  @override
  @JsonKey(name: 'currency', fromJson: Currency.fromJson)
  final Currency currency;
  @override
  final String description;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  final String unit;
  @override
  final int quantity;
  @override
  final int price;
  @override
  @JsonKey(name: 'sub_total')
  final int subtotal;

  @override
  String toString() {
    return 'MaterialReturnNoteDetail(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, returnNote: $returnNote, currency: $currency, description: $description, productId: $productId, productName: $productName, unit: $unit, quantity: $quantity, price: $price, subtotal: $subtotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReturnNoteDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.returnNote, returnNote) ||
                other.returnNote == returnNote) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      returnNote,
      currency,
      description,
      productId,
      productName,
      unit,
      quantity,
      price,
      subtotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReturnNoteDetailImplCopyWith<_$MaterialReturnNoteDetailImpl>
      get copyWith => __$$MaterialReturnNoteDetailImplCopyWithImpl<
          _$MaterialReturnNoteDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReturnNoteDetailImplToJson(
      this,
    );
  }
}

abstract class _MaterialReturnNoteDetail extends MaterialReturnNoteDetail {
  factory _MaterialReturnNoteDetail(
          {required final int id,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'return_note', fromJson: MaterialReturnNote.fromJson)
          required final MaterialReturnNote returnNote,
          @JsonKey(name: 'currency', fromJson: Currency.fromJson)
          required final Currency currency,
          required final String description,
          @JsonKey(name: 'product_id') required final String productId,
          @JsonKey(name: 'product_name') required final String productName,
          required final String unit,
          required final int quantity,
          required final int price,
          @JsonKey(name: 'sub_total') required final int subtotal}) =
      _$MaterialReturnNoteDetailImpl;
  _MaterialReturnNoteDetail._() : super._();

  factory _MaterialReturnNoteDetail.fromJson(Map<String, dynamic> json) =
      _$MaterialReturnNoteDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'return_note', fromJson: MaterialReturnNote.fromJson)
  MaterialReturnNote get returnNote;
  @override
  @JsonKey(name: 'currency', fromJson: Currency.fromJson)
  Currency get currency;
  @override
  String get description;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  String get unit;
  @override
  int get quantity;
  @override
  int get price;
  @override
  @JsonKey(name: 'sub_total')
  int get subtotal;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReturnNoteDetailImplCopyWith<_$MaterialReturnNoteDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
