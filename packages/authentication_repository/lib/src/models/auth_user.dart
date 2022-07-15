import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String? id;
  final String? username;
  final String? email;

  AuthUser({
    this.id,
    this.username,
    this.email,
  });

  factory AuthUser.empty() {
    return AuthUser(id: '', email: '');
  }

  @override
  List<Object?> get props => [id, username, email];

  AuthUser copyWith({
    String? id,
    String? username,
    String? email,
  }) {
    return AuthUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }
}
