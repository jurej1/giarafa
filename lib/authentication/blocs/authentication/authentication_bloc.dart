import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationRepository authenitcationRepository)
      : _authenticationRepository = authenitcationRepository,
        super(AuthenticationState.initial()) {
    _authSubscription = _authenticationRepository.getUser().listen((user) {
      add(AuthenticationStatusUpdated(user));
    });

    on<AuthenticationStatusUpdated>(_onAuthenticationStatusUpdated);
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription _authSubscription;

  void _onAuthenticationStatusUpdated(
    AuthenticationStatusUpdated event,
    Emitter<AuthenticationState> emit,
  ) {
    return emit(
      AuthenticationState(
        event.user,
        event.user != null ? AuthenticationStatus.authenticated : AuthenticationStatus.unauthenticated,
      ),
    );
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
