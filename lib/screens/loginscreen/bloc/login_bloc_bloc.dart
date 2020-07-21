import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coursesapp/Repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final UserRepository _userRepository;

  LoginBlocBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(LoginBlocInitial());

  @override
  Stream<LoginBlocState> mapEventToState(
    LoginBlocEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is LoginStarted) {
      yield* _mapLoginStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<LoginBlocState> _mapLoginStartedToState() async* {
    final isSignedIn = await _userRepository.isSignedIn();
    if (isSignedIn) {
      final name = await _userRepository.getUser();
      yield LoginSuccess(displayName: name);
    } else {
      yield LoginFailure();
    }
  }

  Stream<LoginBlocState> _mapLoggedInToState() async* {
    yield LoginSuccess(displayName: await _userRepository.getUser());
  }

  Stream<LoginBlocState> _mapLoggedOutToState() async* {
    yield LoginFailure();
    _userRepository.signOut();
  }
}
