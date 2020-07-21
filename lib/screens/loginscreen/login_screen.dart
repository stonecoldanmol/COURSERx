import 'package:coursesapp/Repositories/user_repository.dart';
import 'package:coursesapp/screens/loginscreen/bloc/login_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<LoginBlocBloc, LoginBlocState>(
        builder: (context, state) => SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 320,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/edu_background_2.png'),
                                fit: BoxFit.fill)),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 30,
                              width: 200,
                              height: 300,
                              child: FadeAnimation(
                                  1.6,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/degree.png'))),
                                  )),
                            ),
                            // Positioned(
                            //   child: FadeAnimation(
                            //       1.6,
                            //       Container(
                            //         margin: EdgeInsets.only(top:310),
                            //         child: Center(
                            //           child: Text(
                            //             "LOGIN",
                            //             style: TextStyle(
                            //                 color: Colors.purple[900],
                            //                 fontSize: 35,
                            //                 fontWeight: FontWeight.bold),
                            //           ),
                            //         ),
                            //       )),
                            // )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Column(
                          children: <Widget>[
                            FadeAnimation(
                                1.8,
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                143, 148, 251, .2),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Email",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            FadeAnimation(
                                2,
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(143, 148, 251, 1),
                                        Color.fromRGBO(143, 148, 251, .8),
                                      ])),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 70,
                            ),
                            FadeAnimation(
                                1.5,
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1)),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
