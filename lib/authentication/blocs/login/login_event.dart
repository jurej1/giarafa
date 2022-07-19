part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedLoginEvent extends LoginEvent {
  final String val;

  const EmailChangedLoginEvent(this.val);

  @override
  List<Object> get props => [val];
}

class PasswordChangedLoginEvent extends LoginEvent {
  final String val;

  const PasswordChangedLoginEvent(this.val);

  @override
  List<Object> get props => [val];
}

class SubmitFormLoginEvent extends LoginEvent {}
