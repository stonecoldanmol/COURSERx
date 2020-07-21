import 'package:coursesapp/Repositories/user_repository.dart';
import 'package:coursesapp/screens/loginscreen/login_screen.dart';
import 'package:coursesapp/navbar/ProfileHome.dart';
import 'package:coursesapp/navbar/SizeConfig.dart';
import 'package:coursesapp/screens/loginscreen/bloc/login_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider<LoginBlocBloc>(
    create: (context) =>
        LoginBlocBloc(userRepository: userRepository)..add(LoginStarted()),
    child: LoginScreen(
      userRepository: userRepository,
    ),
  ));
}
