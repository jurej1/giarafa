part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({required this.status, required this.email, required this.password});

  final FormzStatus status;
  final Email email;
  final Password password;

  @override
  List<Object> get props => [status, email, password];

  LoginState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
