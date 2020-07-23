import 'package:coursesapp/Repositories/user_repository.dart';
import 'package:coursesapp/navbar/ProfileHome.dart';
import 'package:coursesapp/navbar/SizeConfig.dart';
import 'package:coursesapp/screens/loginscreen/login_screen.dart';
import 'package:coursesapp/screens/loginscreen/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var _firebaseauth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              // home: ProfileHome(),
              home: LoginWrapper(),
            );
          },
        );
      },
    );
  }
}
class LoginWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserRepository.instance(),
      child: Consumer(builder: (context, UserRepository user, _) {
        switch (user.status) {
          case Status.Uninitialized:
            return Splash();
          case Status.Unauthenticated:
          case Status.Authenticating:
            return LoginScreen();
          case Status.Authenticated:
            return ProfileHome();
          default:
            return Text('lol');
        }
      }),
    );
  }
}

