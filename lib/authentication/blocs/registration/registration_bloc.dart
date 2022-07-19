import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:girafa/authentication/authentication.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc()
      : super(
          const RegistrationState(
            email: Email.pure(),
            password: Password.pure(),
            status: FormzStatus.pure,
          ),
        ) {
    //TODO
  }
}
