// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_issues.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialIssues _$MaterialIssuesFromJson(Map<String, dynamic> json) {
  return _MaterialIssues.fromJson(json);
}

/// @nodoc
mixin _$MaterialIssues {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialIssuesCopyWith<MaterialIssues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialIssuesCopyWith<$Res> {
  factory $MaterialIssuesCopyWith(
          MaterialIssues value, $Res Function(MaterialIssues) then) =
      _$MaterialIssuesCopyWithImpl<$Res, MaterialIssues>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MaterialIssuesCopyWithImpl<$Res, $Val extends MaterialIssues>
    implements $MaterialIssuesCopyWith<$Res> {
  _$MaterialIssuesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialIssuesImplCopyWith<$Res>
    implements $MaterialIssuesCopyWith<$Res> {
  factory _$$MaterialIssuesImplCopyWith(_$MaterialIssuesImpl value,
          $Res Function(_$MaterialIssuesImpl) then) =
      __$$MaterialIssuesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MaterialIssuesImplCopyWithImpl<$Res>
    extends _$MaterialIssuesCopyWithImpl<$Res, _$MaterialIssuesImpl>
    implements _$$MaterialIssuesImplCopyWith<$Res> {
  __$$MaterialIssuesImplCopyWithImpl(
      _$MaterialIssuesImpl _value, $Res Function(_$MaterialIssuesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MaterialIssuesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIssuesImpl extends _MaterialIssues {
  const _$MaterialIssuesImpl({required this.id}) : super._();

  factory _$MaterialIssuesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialIssuesImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'MaterialIssues(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIssuesImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIssuesImplCopyWith<_$MaterialIssuesImpl> get copyWith =>
      __$$MaterialIssuesImplCopyWithImpl<_$MaterialIssuesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIssuesImplToJson(
      this,
    );
  }
}

abstract class _MaterialIssues extends MaterialIssues {
  const factory _MaterialIssues({required final String id}) =
      _$MaterialIssuesImpl;
  const _MaterialIssues._() : super._();

  factory _MaterialIssues.fromJson(Map<String, dynamic> json) =
      _$MaterialIssuesImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$MaterialIssuesImplCopyWith<_$MaterialIssuesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
