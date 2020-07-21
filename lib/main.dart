import 'package:coursesapp/navbar/SizeConfig.dart';
import 'package:coursesapp/screens/loginscreen/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              home: LoginScreen(),
            );
          },
        );
      },
    );
  }
}
