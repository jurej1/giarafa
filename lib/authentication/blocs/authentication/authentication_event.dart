part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationStatusUpdated extends AuthenticationEvent {
  final AuthUser? user;

  AuthenticationStatusUpdated(this.user);

  @override
  List<Object?> get props => [user];
}
