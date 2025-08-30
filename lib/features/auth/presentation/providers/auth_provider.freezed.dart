// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingLogin value)?  loadingLogin,TResult Function( SuccessLogin value)?  successLogin,TResult Function( ErrorLogin value)?  errorLogin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingLogin() when loadingLogin != null:
return loadingLogin(_that);case SuccessLogin() when successLogin != null:
return successLogin(_that);case ErrorLogin() when errorLogin != null:
return errorLogin(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingLogin value)  loadingLogin,required TResult Function( SuccessLogin value)  successLogin,required TResult Function( ErrorLogin value)  errorLogin,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingLogin():
return loadingLogin(_that);case SuccessLogin():
return successLogin(_that);case ErrorLogin():
return errorLogin(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingLogin value)?  loadingLogin,TResult? Function( SuccessLogin value)?  successLogin,TResult? Function( ErrorLogin value)?  errorLogin,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingLogin() when loadingLogin != null:
return loadingLogin(_that);case SuccessLogin() when successLogin != null:
return successLogin(_that);case ErrorLogin() when errorLogin != null:
return errorLogin(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingLogin,TResult Function( String token)?  successLogin,TResult Function( Failure failure)?  errorLogin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingLogin() when loadingLogin != null:
return loadingLogin();case SuccessLogin() when successLogin != null:
return successLogin(_that.token);case ErrorLogin() when errorLogin != null:
return errorLogin(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingLogin,required TResult Function( String token)  successLogin,required TResult Function( Failure failure)  errorLogin,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingLogin():
return loadingLogin();case SuccessLogin():
return successLogin(_that.token);case ErrorLogin():
return errorLogin(_that.failure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingLogin,TResult? Function( String token)?  successLogin,TResult? Function( Failure failure)?  errorLogin,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingLogin() when loadingLogin != null:
return loadingLogin();case SuccessLogin() when successLogin != null:
return successLogin(_that.token);case ErrorLogin() when errorLogin != null:
return errorLogin(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class LoadingLogin implements AuthState {
  const LoadingLogin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loadingLogin()';
}


}




/// @nodoc


class SuccessLogin implements AuthState {
  const SuccessLogin(this.token);
  

 final  String token;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessLoginCopyWith<SuccessLogin> get copyWith => _$SuccessLoginCopyWithImpl<SuccessLogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessLogin&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'AuthState.successLogin(token: $token)';
}


}

/// @nodoc
abstract mixin class $SuccessLoginCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SuccessLoginCopyWith(SuccessLogin value, $Res Function(SuccessLogin) _then) = _$SuccessLoginCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$SuccessLoginCopyWithImpl<$Res>
    implements $SuccessLoginCopyWith<$Res> {
  _$SuccessLoginCopyWithImpl(this._self, this._then);

  final SuccessLogin _self;
  final $Res Function(SuccessLogin) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(SuccessLogin(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ErrorLogin implements AuthState {
  const ErrorLogin({required this.failure});
  

 final  Failure failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorLoginCopyWith<ErrorLogin> get copyWith => _$ErrorLoginCopyWithImpl<ErrorLogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorLogin&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.errorLogin(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ErrorLoginCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ErrorLoginCopyWith(ErrorLogin value, $Res Function(ErrorLogin) _then) = _$ErrorLoginCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ErrorLoginCopyWithImpl<$Res>
    implements $ErrorLoginCopyWith<$Res> {
  _$ErrorLoginCopyWithImpl(this._self, this._then);

  final ErrorLogin _self;
  final $Res Function(ErrorLogin) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ErrorLogin(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
