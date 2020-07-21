part of 'login_bloc_bloc.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();

  @override
  List<Object> get props => [];
}

class LoginBlocInitial extends LoginBlocState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginBlocState {
  final String displayName;

  const LoginSuccess({this.displayName});

  @override
  List<Object> get props => [displayName];

  @override
  String toString() {
    return 'AuthenticationSuccess { displayName: $displayName}';
  }
}

class LoginFailure extends LoginBlocState {}
