part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthUser? authUser;
  final AuthenticationStatus status;

  const AuthenticationState(this.authUser, [this.status = AuthenticationStatus.unknown]);

  factory AuthenticationState.initial() {
    return AuthenticationState(AuthUser.empty());
  }

  @override
  List<Object?> get props => [authUser, status];
}
