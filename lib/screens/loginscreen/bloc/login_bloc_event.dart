part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}

class LoginStarted extends LoginBlocEvent {}

class LoggedIn extends LoginBlocEvent {}

class LoggedOut extends LoginBlocEvent {}
