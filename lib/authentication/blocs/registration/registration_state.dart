part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;

  const RegistrationState({
    required this.email,
    required this.password,
    required this.status,
  });

  @override
  List<Object> get props => [email, password, status];

  RegistrationState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
