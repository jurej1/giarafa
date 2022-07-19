part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class EmailUpdatedRegistrationEvent extends RegistrationEvent {
  final String val;

  const EmailUpdatedRegistrationEvent(this.val);

  @override
  List<Object> get props => [val];
}

class PasswordUpdatedRegistrationEvent extends RegistrationEvent {
  final String val;

  const PasswordUpdatedRegistrationEvent(this.val);

  @override
  List<Object> get props => [val];
}

class SubmitRegistrationEvent extends RegistrationEvent {}
