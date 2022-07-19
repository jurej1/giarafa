import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:girafa/authentication/authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          const LoginState(
            email: Email.pure(),
            password: Password.pure(),
            status: FormzStatus.pure,
          ),
        ) {
    on<EmailChangedLoginEvent>(_mapEmailChangedToState);

    on<PasswordChangedLoginEvent>(_mapPasswordChangedToState);

    on<SubmitFormLoginEvent>(_mapSubmitFormToState);
  }

  final AuthenticationRepository _authenticationRepository;

  void _mapEmailChangedToState(EmailChangedLoginEvent event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.val);

    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void _mapPasswordChangedToState(PasswordChangedLoginEvent event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.val);

    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.email]),
      ),
    );
  }

  void _mapSubmitFormToState(SubmitFormLoginEvent event, Emitter<LoginState> emit) {
    final password = Password.dirty(state.password.value);
    final email = Email.dirty(state.email.value);

    emit(
      state.copyWith(
        email: email,
        password: password,
        status: Formz.validate([password, email]),
      ),
    );

    if (state.status.isValidated) {}
  }
}
