// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signupLoading,
    required TResult Function(T data) signupSuccess,
    required TResult Function(String error) signupError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signupLoading,
    TResult? Function(T data)? signupSuccess,
    TResult? Function(String error)? signupError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signupLoading,
    TResult Function(T data)? signupSuccess,
    TResult Function(String error)? signupError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignupLoadind<T> value) signupLoading,
    required TResult Function(SignupSUCCESS<T> value) signupSuccess,
    required TResult Function(SignupError<T> value) signupError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignupLoadind<T> value)? signupLoading,
    TResult? Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult? Function(SignupError<T> value)? signupError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignupLoadind<T> value)? signupLoading,
    TResult Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult Function(SignupError<T> value)? signupError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<T, $Res> {
  factory $SignupStateCopyWith(
          SignupState<T> value, $Res Function(SignupState<T>) then) =
      _$SignupStateCopyWithImpl<T, $Res, SignupState<T>>;
}

/// @nodoc
class _$SignupStateCopyWithImpl<T, $Res, $Val extends SignupState<T>>
    implements $SignupStateCopyWith<T, $Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$SignupStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> with DiagnosticableTreeMixin implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignupState<$T>.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SignupState<$T>.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signupLoading,
    required TResult Function(T data) signupSuccess,
    required TResult Function(String error) signupError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signupLoading,
    TResult? Function(T data)? signupSuccess,
    TResult? Function(String error)? signupError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signupLoading,
    TResult Function(T data)? signupSuccess,
    TResult Function(String error)? signupError,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignupLoadind<T> value) signupLoading,
    required TResult Function(SignupSUCCESS<T> value) signupSuccess,
    required TResult Function(SignupError<T> value) signupError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignupLoadind<T> value)? signupLoading,
    TResult? Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult? Function(SignupError<T> value)? signupError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignupLoadind<T> value)? signupLoading,
    TResult Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult Function(SignupError<T> value)? signupError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements SignupState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$SignupLoadindImplCopyWith<T, $Res> {
  factory _$$SignupLoadindImplCopyWith(_$SignupLoadindImpl<T> value,
          $Res Function(_$SignupLoadindImpl<T>) then) =
      __$$SignupLoadindImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SignupLoadindImplCopyWithImpl<T, $Res>
    extends _$SignupStateCopyWithImpl<T, $Res, _$SignupLoadindImpl<T>>
    implements _$$SignupLoadindImplCopyWith<T, $Res> {
  __$$SignupLoadindImplCopyWithImpl(_$SignupLoadindImpl<T> _value,
      $Res Function(_$SignupLoadindImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignupLoadindImpl<T>
    with DiagnosticableTreeMixin
    implements SignupLoadind<T> {
  const _$SignupLoadindImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignupState<$T>.signupLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'SignupState<$T>.signupLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignupLoadindImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signupLoading,
    required TResult Function(T data) signupSuccess,
    required TResult Function(String error) signupError,
  }) {
    return signupLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signupLoading,
    TResult? Function(T data)? signupSuccess,
    TResult? Function(String error)? signupError,
  }) {
    return signupLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signupLoading,
    TResult Function(T data)? signupSuccess,
    TResult Function(String error)? signupError,
    required TResult orElse(),
  }) {
    if (signupLoading != null) {
      return signupLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignupLoadind<T> value) signupLoading,
    required TResult Function(SignupSUCCESS<T> value) signupSuccess,
    required TResult Function(SignupError<T> value) signupError,
  }) {
    return signupLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignupLoadind<T> value)? signupLoading,
    TResult? Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult? Function(SignupError<T> value)? signupError,
  }) {
    return signupLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignupLoadind<T> value)? signupLoading,
    TResult Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult Function(SignupError<T> value)? signupError,
    required TResult orElse(),
  }) {
    if (signupLoading != null) {
      return signupLoading(this);
    }
    return orElse();
  }
}

abstract class SignupLoadind<T> implements SignupState<T> {
  const factory SignupLoadind() = _$SignupLoadindImpl<T>;
}

/// @nodoc
abstract class _$$SignupSUCCESSImplCopyWith<T, $Res> {
  factory _$$SignupSUCCESSImplCopyWith(_$SignupSUCCESSImpl<T> value,
          $Res Function(_$SignupSUCCESSImpl<T>) then) =
      __$$SignupSUCCESSImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SignupSUCCESSImplCopyWithImpl<T, $Res>
    extends _$SignupStateCopyWithImpl<T, $Res, _$SignupSUCCESSImpl<T>>
    implements _$$SignupSUCCESSImplCopyWith<T, $Res> {
  __$$SignupSUCCESSImplCopyWithImpl(_$SignupSUCCESSImpl<T> _value,
      $Res Function(_$SignupSUCCESSImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SignupSUCCESSImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SignupSUCCESSImpl<T>
    with DiagnosticableTreeMixin
    implements SignupSUCCESS<T> {
  const _$SignupSUCCESSImpl(this.data);

  @override
  final T data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignupState<$T>.signupSuccess(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignupState<$T>.signupSuccess'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupSUCCESSImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupSUCCESSImplCopyWith<T, _$SignupSUCCESSImpl<T>> get copyWith =>
      __$$SignupSUCCESSImplCopyWithImpl<T, _$SignupSUCCESSImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signupLoading,
    required TResult Function(T data) signupSuccess,
    required TResult Function(String error) signupError,
  }) {
    return signupSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signupLoading,
    TResult? Function(T data)? signupSuccess,
    TResult? Function(String error)? signupError,
  }) {
    return signupSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signupLoading,
    TResult Function(T data)? signupSuccess,
    TResult Function(String error)? signupError,
    required TResult orElse(),
  }) {
    if (signupSuccess != null) {
      return signupSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignupLoadind<T> value) signupLoading,
    required TResult Function(SignupSUCCESS<T> value) signupSuccess,
    required TResult Function(SignupError<T> value) signupError,
  }) {
    return signupSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignupLoadind<T> value)? signupLoading,
    TResult? Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult? Function(SignupError<T> value)? signupError,
  }) {
    return signupSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignupLoadind<T> value)? signupLoading,
    TResult Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult Function(SignupError<T> value)? signupError,
    required TResult orElse(),
  }) {
    if (signupSuccess != null) {
      return signupSuccess(this);
    }
    return orElse();
  }
}

abstract class SignupSUCCESS<T> implements SignupState<T> {
  const factory SignupSUCCESS(final T data) = _$SignupSUCCESSImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SignupSUCCESSImplCopyWith<T, _$SignupSUCCESSImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignupErrorImplCopyWith<T, $Res> {
  factory _$$SignupErrorImplCopyWith(_$SignupErrorImpl<T> value,
          $Res Function(_$SignupErrorImpl<T>) then) =
      __$$SignupErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SignupErrorImplCopyWithImpl<T, $Res>
    extends _$SignupStateCopyWithImpl<T, $Res, _$SignupErrorImpl<T>>
    implements _$$SignupErrorImplCopyWith<T, $Res> {
  __$$SignupErrorImplCopyWithImpl(
      _$SignupErrorImpl<T> _value, $Res Function(_$SignupErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SignupErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignupErrorImpl<T>
    with DiagnosticableTreeMixin
    implements SignupError<T> {
  const _$SignupErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignupState<$T>.signupError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignupState<$T>.signupError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupErrorImplCopyWith<T, _$SignupErrorImpl<T>> get copyWith =>
      __$$SignupErrorImplCopyWithImpl<T, _$SignupErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signupLoading,
    required TResult Function(T data) signupSuccess,
    required TResult Function(String error) signupError,
  }) {
    return signupError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signupLoading,
    TResult? Function(T data)? signupSuccess,
    TResult? Function(String error)? signupError,
  }) {
    return signupError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signupLoading,
    TResult Function(T data)? signupSuccess,
    TResult Function(String error)? signupError,
    required TResult orElse(),
  }) {
    if (signupError != null) {
      return signupError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(SignupLoadind<T> value) signupLoading,
    required TResult Function(SignupSUCCESS<T> value) signupSuccess,
    required TResult Function(SignupError<T> value) signupError,
  }) {
    return signupError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(SignupLoadind<T> value)? signupLoading,
    TResult? Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult? Function(SignupError<T> value)? signupError,
  }) {
    return signupError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(SignupLoadind<T> value)? signupLoading,
    TResult Function(SignupSUCCESS<T> value)? signupSuccess,
    TResult Function(SignupError<T> value)? signupError,
    required TResult orElse(),
  }) {
    if (signupError != null) {
      return signupError(this);
    }
    return orElse();
  }
}

abstract class SignupError<T> implements SignupState<T> {
  const factory SignupError({required final String error}) =
      _$SignupErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$SignupErrorImplCopyWith<T, _$SignupErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
