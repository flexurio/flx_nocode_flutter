// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_comment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketCommentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int commentId) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int commentId)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int commentId)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCommentStateCopyWith<$Res> {
  factory $TicketCommentStateCopyWith(
          TicketCommentState value, $Res Function(TicketCommentState) then) =
      _$TicketCommentStateCopyWithImpl<$Res, TicketCommentState>;
}

/// @nodoc
class _$TicketCommentStateCopyWithImpl<$Res, $Val extends TicketCommentState>
    implements $TicketCommentStateCopyWith<$Res> {
  _$TicketCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TicketCommentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TicketCommentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int commentId) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int commentId)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int commentId)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TicketCommentState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TicketCommentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TicketCommentState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int commentId) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int commentId)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int commentId)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TicketCommentState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int commentId});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$TicketCommentStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
  }) {
    return _then(_$SuccessImpl(
      null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.commentId);

  @override
  final int commentId;

  @override
  String toString() {
    return 'TicketCommentState.success(commentId: $commentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commentId);

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int commentId) success,
    required TResult Function(String error) error,
  }) {
    return success(commentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int commentId)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(commentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int commentId)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(commentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements TicketCommentState {
  const factory _Success(final int commentId) = _$SuccessImpl;

  int get commentId;

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$TicketCommentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TicketCommentState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int commentId) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int commentId)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int commentId)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements TicketCommentState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of TicketCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TicketCommentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String content, Ticket ticket, List<String> participantsNip)
        comment,
    required TResult Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)
        uploadAttachment,
    required TResult Function(String ticketCommentId) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String content, Ticket ticket, List<String> participantsNip)?
        comment,
    TResult? Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)?
        uploadAttachment,
    TResult? Function(String ticketCommentId)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String content, Ticket ticket, List<String> participantsNip)?
        comment,
    TResult Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)?
        uploadAttachment,
    TResult Function(String ticketCommentId)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) comment,
    required TResult Function(_UploadAttachment value) uploadAttachment,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? comment,
    TResult? Function(_UploadAttachment value)? uploadAttachment,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? comment,
    TResult Function(_UploadAttachment value)? uploadAttachment,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCommentEventCopyWith<$Res> {
  factory $TicketCommentEventCopyWith(
          TicketCommentEvent value, $Res Function(TicketCommentEvent) then) =
      _$TicketCommentEventCopyWithImpl<$Res, TicketCommentEvent>;
}

/// @nodoc
class _$TicketCommentEventCopyWithImpl<$Res, $Val extends TicketCommentEvent>
    implements $TicketCommentEventCopyWith<$Res> {
  _$TicketCommentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content, Ticket ticket, List<String> participantsNip});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$TicketCommentEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? ticket = null,
    Object? participantsNip = null,
  }) {
    return _then(_$CreateImpl(
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as Ticket,
      null == participantsNip
          ? _value._participantsNip
          : participantsNip // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      this.content, this.ticket, final List<String> participantsNip)
      : _participantsNip = participantsNip;

  @override
  final String content;
  @override
  final Ticket ticket;
  final List<String> _participantsNip;
  @override
  List<String> get participantsNip {
    if (_participantsNip is EqualUnmodifiableListView) return _participantsNip;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantsNip);
  }

  @override
  String toString() {
    return 'TicketCommentEvent.comment(content: $content, ticket: $ticket, participantsNip: $participantsNip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            const DeepCollectionEquality()
                .equals(other._participantsNip, _participantsNip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, ticket,
      const DeepCollectionEquality().hash(_participantsNip));

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String content, Ticket ticket, List<String> participantsNip)
        comment,
    required TResult Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)
        uploadAttachment,
    required TResult Function(String ticketCommentId) delete,
  }) {
    return comment(content, ticket, participantsNip);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String content, Ticket ticket, List<String> participantsNip)?
        comment,
    TResult? Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)?
        uploadAttachment,
    TResult? Function(String ticketCommentId)? delete,
  }) {
    return comment?.call(content, ticket, participantsNip);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String content, Ticket ticket, List<String> participantsNip)?
        comment,
    TResult Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)?
        uploadAttachment,
    TResult Function(String ticketCommentId)? delete,
    required TResult orElse(),
  }) {
    if (comment != null) {
      return comment(content, ticket, participantsNip);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) comment,
    required TResult Function(_UploadAttachment value) uploadAttachment,
    required TResult Function(_Delete value) delete,
  }) {
    return comment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? comment,
    TResult? Function(_UploadAttachment value)? uploadAttachment,
    TResult? Function(_Delete value)? delete,
  }) {
    return comment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? comment,
    TResult Function(_UploadAttachment value)? uploadAttachment,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (comment != null) {
      return comment(this);
    }
    return orElse();
  }
}

abstract class _Create implements TicketCommentEvent {
  const factory _Create(final String content, final Ticket ticket,
      final List<String> participantsNip) = _$CreateImpl;

  String get content;
  Ticket get ticket;
  List<String> get participantsNip;

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadAttachmentImplCopyWith<$Res> {
  factory _$$UploadAttachmentImplCopyWith(_$UploadAttachmentImpl value,
          $Res Function(_$UploadAttachmentImpl) then) =
      __$$UploadAttachmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PlatformFile attachment, Ticket ticket, List<String> participantsNip});
}

/// @nodoc
class __$$UploadAttachmentImplCopyWithImpl<$Res>
    extends _$TicketCommentEventCopyWithImpl<$Res, _$UploadAttachmentImpl>
    implements _$$UploadAttachmentImplCopyWith<$Res> {
  __$$UploadAttachmentImplCopyWithImpl(_$UploadAttachmentImpl _value,
      $Res Function(_$UploadAttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachment = null,
    Object? ticket = null,
    Object? participantsNip = null,
  }) {
    return _then(_$UploadAttachmentImpl(
      null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
      null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as Ticket,
      null == participantsNip
          ? _value._participantsNip
          : participantsNip // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UploadAttachmentImpl implements _UploadAttachment {
  const _$UploadAttachmentImpl(
      this.attachment, this.ticket, final List<String> participantsNip)
      : _participantsNip = participantsNip;

  @override
  final PlatformFile attachment;
  @override
  final Ticket ticket;
  final List<String> _participantsNip;
  @override
  List<String> get participantsNip {
    if (_participantsNip is EqualUnmodifiableListView) return _participantsNip;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantsNip);
  }

  @override
  String toString() {
    return 'TicketCommentEvent.uploadAttachment(attachment: $attachment, ticket: $ticket, participantsNip: $participantsNip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadAttachmentImpl &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            const DeepCollectionEquality()
                .equals(other._participantsNip, _participantsNip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attachment, ticket,
      const DeepCollectionEquality().hash(_participantsNip));

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadAttachmentImplCopyWith<_$UploadAttachmentImpl> get copyWith =>
      __$$UploadAttachmentImplCopyWithImpl<_$UploadAttachmentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String content, Ticket ticket, List<String> participantsNip)
        comment,
    required TResult Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)
        uploadAttachment,
    required TResult Function(String ticketCommentId) delete,
  }) {
    return uploadAttachment(attachment, ticket, participantsNip);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String content, Ticket ticket, List<String> participantsNip)?
        comment,
    TResult? Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)?
        uploadAttachment,
    TResult? Function(String ticketCommentId)? delete,
  }) {
    return uploadAttachment?.call(attachment, ticket, participantsNip);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String content, Ticket ticket, List<String> participantsNip)?
        comment,
    TResult Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)?
        uploadAttachment,
    TResult Function(String ticketCommentId)? delete,
    required TResult orElse(),
  }) {
    if (uploadAttachment != null) {
      return uploadAttachment(attachment, ticket, participantsNip);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) comment,
    required TResult Function(_UploadAttachment value) uploadAttachment,
    required TResult Function(_Delete value) delete,
  }) {
    return uploadAttachment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? comment,
    TResult? Function(_UploadAttachment value)? uploadAttachment,
    TResult? Function(_Delete value)? delete,
  }) {
    return uploadAttachment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? comment,
    TResult Function(_UploadAttachment value)? uploadAttachment,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (uploadAttachment != null) {
      return uploadAttachment(this);
    }
    return orElse();
  }
}

abstract class _UploadAttachment implements TicketCommentEvent {
  const factory _UploadAttachment(
      final PlatformFile attachment,
      final Ticket ticket,
      final List<String> participantsNip) = _$UploadAttachmentImpl;

  PlatformFile get attachment;
  Ticket get ticket;
  List<String> get participantsNip;

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadAttachmentImplCopyWith<_$UploadAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ticketCommentId});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$TicketCommentEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketCommentId = null,
  }) {
    return _then(_$DeleteImpl(
      null == ticketCommentId
          ? _value.ticketCommentId
          : ticketCommentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.ticketCommentId);

  @override
  final String ticketCommentId;

  @override
  String toString() {
    return 'TicketCommentEvent.delete(ticketCommentId: $ticketCommentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.ticketCommentId, ticketCommentId) ||
                other.ticketCommentId == ticketCommentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketCommentId);

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String content, Ticket ticket, List<String> participantsNip)
        comment,
    required TResult Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)
        uploadAttachment,
    required TResult Function(String ticketCommentId) delete,
  }) {
    return delete(ticketCommentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String content, Ticket ticket, List<String> participantsNip)?
        comment,
    TResult? Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)?
        uploadAttachment,
    TResult? Function(String ticketCommentId)? delete,
  }) {
    return delete?.call(ticketCommentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String content, Ticket ticket, List<String> participantsNip)?
        comment,
    TResult Function(PlatformFile attachment, Ticket ticket,
            List<String> participantsNip)?
        uploadAttachment,
    TResult Function(String ticketCommentId)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(ticketCommentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) comment,
    required TResult Function(_UploadAttachment value) uploadAttachment,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? comment,
    TResult? Function(_UploadAttachment value)? uploadAttachment,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? comment,
    TResult Function(_UploadAttachment value)? uploadAttachment,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements TicketCommentEvent {
  const factory _Delete(final String ticketCommentId) = _$DeleteImpl;

  String get ticketCommentId;

  /// Create a copy of TicketCommentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
