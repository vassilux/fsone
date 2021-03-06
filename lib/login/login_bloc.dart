import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fsone/authentication/bloc.dart';
import 'package:fsone/authentication/authentication_bloc.dart';
import 'package:fsone/login/validators.dart';

import 'package:fsone/repositories/user_repository.dart';
import 'package:meta/meta.dart';

import 'login.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginState.empty();

  @override
  /*Stream<LoginState> transformEvents(
    Stream<LoginEvent> events,
    Stream<LoginState> Function(LoginEvent event) next,
  ) {
    final observableStream = events as Observable<LoginEvent>;
    final nonDebounceStream = observableStream.where((event) {
      return (event is! UserNameChanged && event is! PasswordChanged);
    });
    final debounceStream = observableStream.where((event) {
      return (event is UserNameChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }*/

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is UserNameChanged) {
      yield* _mapusernameChangedToState(event.username);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginButtonPressed) {
      yield* _mapLoginButtonPressedToState(
        username: event.username,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapusernameChangedToState(String email) async* {
    yield state.update(
      isUsernameValid: Validators.isValidUsername(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<LoginState> _mapLoginButtonPressedToState({
    String username,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      final token = await userRepository.authenticate(username: username, password: password);

      await userRepository.persistToken(token);
      authenticationBloc.add(LoggedIn(token: token));
      yield LoginState.success();
      
    } catch (_) {
      yield LoginState.failure();
    }
  }

}
