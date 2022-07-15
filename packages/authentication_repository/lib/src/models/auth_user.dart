import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String? username;
  final String email;

  AuthUser({
    required this.id,
    this.username,
    required this.email,
  });

  factory AuthUser.empty() {
    return AuthUser(id: '', email: '');
  }

  @override
  List<Object?> get props => [id, username, email];
}
