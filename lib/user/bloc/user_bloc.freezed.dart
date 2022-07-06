// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUser,
    required TResult Function() deleteUser,
    required TResult Function(User user) updateUser,
    required TResult Function() logout,
    required TResult Function(User? user) changeSupervisor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUser value) getUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(Logout value) logout,
    required TResult Function(ChangeSupervisor value) changeSupervisor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res> implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  final UserEvent _value;
  // ignore: unused_field
  final $Res Function(UserEvent) _then;
}

/// @nodoc
abstract class _$$GetUserCopyWith<$Res> {
  factory _$$GetUserCopyWith(_$GetUser value, $Res Function(_$GetUser) then) =
      __$$GetUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$$GetUserCopyWith<$Res> {
  __$$GetUserCopyWithImpl(_$GetUser _value, $Res Function(_$GetUser) _then)
      : super(_value, (v) => _then(v as _$GetUser));

  @override
  _$GetUser get _value => super._value as _$GetUser;
}

/// @nodoc

class _$GetUser implements GetUser {
  const _$GetUser();

  @override
  String toString() {
    return 'UserEvent.getUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUser,
    required TResult Function() deleteUser,
    required TResult Function(User user) updateUser,
    required TResult Function() logout,
    required TResult Function(User? user) changeSupervisor,
  }) {
    return getUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
  }) {
    return getUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUser value) getUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(Logout value) logout,
    required TResult Function(ChangeSupervisor value) changeSupervisor,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class GetUser implements UserEvent {
  const factory GetUser() = _$GetUser;
}

/// @nodoc
abstract class _$$DeleteUserCopyWith<$Res> {
  factory _$$DeleteUserCopyWith(
          _$DeleteUser value, $Res Function(_$DeleteUser) then) =
      __$$DeleteUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$$DeleteUserCopyWith<$Res> {
  __$$DeleteUserCopyWithImpl(
      _$DeleteUser _value, $Res Function(_$DeleteUser) _then)
      : super(_value, (v) => _then(v as _$DeleteUser));

  @override
  _$DeleteUser get _value => super._value as _$DeleteUser;
}

/// @nodoc

class _$DeleteUser implements DeleteUser {
  const _$DeleteUser();

  @override
  String toString() {
    return 'UserEvent.deleteUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUser,
    required TResult Function() deleteUser,
    required TResult Function(User user) updateUser,
    required TResult Function() logout,
    required TResult Function(User? user) changeSupervisor,
  }) {
    return deleteUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
  }) {
    return deleteUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUser value) getUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(Logout value) logout,
    required TResult Function(ChangeSupervisor value) changeSupervisor,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class DeleteUser implements UserEvent {
  const factory DeleteUser() = _$DeleteUser;
}

/// @nodoc
abstract class _$$UpdateUserCopyWith<$Res> {
  factory _$$UpdateUserCopyWith(
          _$UpdateUser value, $Res Function(_$UpdateUser) then) =
      __$$UpdateUserCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UpdateUserCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$$UpdateUserCopyWith<$Res> {
  __$$UpdateUserCopyWithImpl(
      _$UpdateUser _value, $Res Function(_$UpdateUser) _then)
      : super(_value, (v) => _then(v as _$UpdateUser));

  @override
  _$UpdateUser get _value => super._value as _$UpdateUser;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UpdateUser(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UpdateUser implements UpdateUser {
  const _$UpdateUser(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserEvent.updateUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUser &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$UpdateUserCopyWith<_$UpdateUser> get copyWith =>
      __$$UpdateUserCopyWithImpl<_$UpdateUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUser,
    required TResult Function() deleteUser,
    required TResult Function(User user) updateUser,
    required TResult Function() logout,
    required TResult Function(User? user) changeSupervisor,
  }) {
    return updateUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
  }) {
    return updateUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUser value) getUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(Logout value) logout,
    required TResult Function(ChangeSupervisor value) changeSupervisor,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class UpdateUser implements UserEvent {
  const factory UpdateUser(final User user) = _$UpdateUser;

  User get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UpdateUserCopyWith<_$UpdateUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutCopyWith<$Res> {
  factory _$$LogoutCopyWith(_$Logout value, $Res Function(_$Logout) then) =
      __$$LogoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$$LogoutCopyWith<$Res> {
  __$$LogoutCopyWithImpl(_$Logout _value, $Res Function(_$Logout) _then)
      : super(_value, (v) => _then(v as _$Logout));

  @override
  _$Logout get _value => super._value as _$Logout;
}

/// @nodoc

class _$Logout implements Logout {
  const _$Logout();

  @override
  String toString() {
    return 'UserEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUser,
    required TResult Function() deleteUser,
    required TResult Function(User user) updateUser,
    required TResult Function() logout,
    required TResult Function(User? user) changeSupervisor,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUser value) getUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(Logout value) logout,
    required TResult Function(ChangeSupervisor value) changeSupervisor,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class Logout implements UserEvent {
  const factory Logout() = _$Logout;
}

/// @nodoc
abstract class _$$ChangeSupervisorCopyWith<$Res> {
  factory _$$ChangeSupervisorCopyWith(
          _$ChangeSupervisor value, $Res Function(_$ChangeSupervisor) then) =
      __$$ChangeSupervisorCopyWithImpl<$Res>;
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ChangeSupervisorCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res>
    implements _$$ChangeSupervisorCopyWith<$Res> {
  __$$ChangeSupervisorCopyWithImpl(
      _$ChangeSupervisor _value, $Res Function(_$ChangeSupervisor) _then)
      : super(_value, (v) => _then(v as _$ChangeSupervisor));

  @override
  _$ChangeSupervisor get _value => super._value as _$ChangeSupervisor;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ChangeSupervisor(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$ChangeSupervisor implements ChangeSupervisor {
  const _$ChangeSupervisor(this.user);

  @override
  final User? user;

  @override
  String toString() {
    return 'UserEvent.changeSupervisor(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSupervisor &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$ChangeSupervisorCopyWith<_$ChangeSupervisor> get copyWith =>
      __$$ChangeSupervisorCopyWithImpl<_$ChangeSupervisor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUser,
    required TResult Function() deleteUser,
    required TResult Function(User user) updateUser,
    required TResult Function() logout,
    required TResult Function(User? user) changeSupervisor,
  }) {
    return changeSupervisor(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
  }) {
    return changeSupervisor?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUser,
    TResult Function()? deleteUser,
    TResult Function(User user)? updateUser,
    TResult Function()? logout,
    TResult Function(User? user)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (changeSupervisor != null) {
      return changeSupervisor(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUser value) getUser,
    required TResult Function(DeleteUser value) deleteUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(Logout value) logout,
    required TResult Function(ChangeSupervisor value) changeSupervisor,
  }) {
    return changeSupervisor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
  }) {
    return changeSupervisor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUser value)? getUser,
    TResult Function(DeleteUser value)? deleteUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(Logout value)? logout,
    TResult Function(ChangeSupervisor value)? changeSupervisor,
    required TResult orElse(),
  }) {
    if (changeSupervisor != null) {
      return changeSupervisor(this);
    }
    return orElse();
  }
}

abstract class ChangeSupervisor implements UserEvent {
  const factory ChangeSupervisor(final User? user) = _$ChangeSupervisor;

  User? get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ChangeSupervisorCopyWith<_$ChangeSupervisor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User? currentUser, User? supervising) success,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$$_InitialStateCopyWith<$Res> {
  factory _$$_InitialStateCopyWith(
          _$_InitialState value, $Res Function(_$_InitialState) then) =
      __$$_InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_InitialStateCopyWith<$Res> {
  __$$_InitialStateCopyWithImpl(
      _$_InitialState _value, $Res Function(_$_InitialState) _then)
      : super(_value, (v) => _then(v as _$_InitialState));

  @override
  _$_InitialState get _value => super._value as _$_InitialState;
}

/// @nodoc

class _$_InitialState implements _InitialState {
  const _$_InitialState();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User? currentUser, User? supervising) success,
    required TResult Function(String errorMessage) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
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
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState implements UserState {
  const factory _InitialState() = _$_InitialState;
}

/// @nodoc
abstract class _$$_LoadingStateCopyWith<$Res> {
  factory _$$_LoadingStateCopyWith(
          _$_LoadingState value, $Res Function(_$_LoadingState) then) =
      __$$_LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_LoadingStateCopyWith<$Res> {
  __$$_LoadingStateCopyWithImpl(
      _$_LoadingState _value, $Res Function(_$_LoadingState) _then)
      : super(_value, (v) => _then(v as _$_LoadingState));

  @override
  _$_LoadingState get _value => super._value as _$_LoadingState;
}

/// @nodoc

class _$_LoadingState implements _LoadingState {
  const _$_LoadingState();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User? currentUser, User? supervising) success,
    required TResult Function(String errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
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
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements UserState {
  const factory _LoadingState() = _$_LoadingState;
}

/// @nodoc
abstract class _$$_SuccessStateCopyWith<$Res> {
  factory _$$_SuccessStateCopyWith(
          _$_SuccessState value, $Res Function(_$_SuccessState) then) =
      __$$_SuccessStateCopyWithImpl<$Res>;
  $Res call({User? currentUser, User? supervising});

  $UserCopyWith<$Res>? get currentUser;
  $UserCopyWith<$Res>? get supervising;
}

/// @nodoc
class __$$_SuccessStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_SuccessStateCopyWith<$Res> {
  __$$_SuccessStateCopyWithImpl(
      _$_SuccessState _value, $Res Function(_$_SuccessState) _then)
      : super(_value, (v) => _then(v as _$_SuccessState));

  @override
  _$_SuccessState get _value => super._value as _$_SuccessState;

  @override
  $Res call({
    Object? currentUser = freezed,
    Object? supervising = freezed,
  }) {
    return _then(_$_SuccessState(
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User?,
      supervising: supervising == freezed
          ? _value.supervising
          : supervising // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value));
    });
  }

  @override
  $UserCopyWith<$Res>? get supervising {
    if (_value.supervising == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.supervising!, (value) {
      return _then(_value.copyWith(supervising: value));
    });
  }
}

/// @nodoc

class _$_SuccessState implements _SuccessState {
  const _$_SuccessState({this.currentUser, this.supervising});

  @override
  final User? currentUser;
  @override
  final User? supervising;

  @override
  String toString() {
    return 'UserState.success(currentUser: $currentUser, supervising: $supervising)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessState &&
            const DeepCollectionEquality()
                .equals(other.currentUser, currentUser) &&
            const DeepCollectionEquality()
                .equals(other.supervising, supervising));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentUser),
      const DeepCollectionEquality().hash(supervising));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessStateCopyWith<_$_SuccessState> get copyWith =>
      __$$_SuccessStateCopyWithImpl<_$_SuccessState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User? currentUser, User? supervising) success,
    required TResult Function(String errorMessage) error,
  }) {
    return success(currentUser, supervising);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
  }) {
    return success?.call(currentUser, supervising);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(currentUser, supervising);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessState implements UserState {
  const factory _SuccessState(
      {final User? currentUser, final User? supervising}) = _$_SuccessState;

  User? get currentUser => throw _privateConstructorUsedError;
  User? get supervising => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_SuccessStateCopyWith<_$_SuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorStateCopyWith<$Res> {
  factory _$$_ErrorStateCopyWith(
          _$_ErrorState value, $Res Function(_$_ErrorState) then) =
      __$$_ErrorStateCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class __$$_ErrorStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_ErrorStateCopyWith<$Res> {
  __$$_ErrorStateCopyWithImpl(
      _$_ErrorState _value, $Res Function(_$_ErrorState) _then)
      : super(_value, (v) => _then(v as _$_ErrorState));

  @override
  _$_ErrorState get _value => super._value as _$_ErrorState;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ErrorState(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorState implements _ErrorState {
  const _$_ErrorState(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'UserState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorState &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      __$$_ErrorStateCopyWithImpl<_$_ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(User? currentUser, User? supervising) success,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(User? currentUser, User? supervising)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SuccessState value)? success,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements UserState {
  const factory _ErrorState(final String errorMessage) = _$_ErrorState;

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
