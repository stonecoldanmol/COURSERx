import 'package:coursesapp/Repositories/user_repository.dart';
import 'package:provider/provider.dart';

import '../../Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'register.dart';
import '../../navbar/ProfileHome.dart';
import 'package:animations/animations.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController; //Controller for email form field
  TextEditingController passwordController; //Controller for password form field
  GlobalKey<FormState> formKey; //Key for form

  @override
  void initState() {
    //Initialization Block for controllers
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: PageTransitionSwitcher(
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return SharedAxisTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      child: child,
                      transitionType: SharedAxisTransitionType.vertical);
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 300,
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
                            height: 290,
                            child: FadeAnimation(
                                1.6,
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/degree.png'))),
                                )),
                          ),
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
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          controller: emailController,
                                          validator: (value) {
                                            if (value.isNotEmpty) {
                                              return null;
                                            } else
                                              return 'Please input some text';
                                          },
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Email ",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4.0),
                                        child: TextFormField(
                                          controller: passwordController,
                                          validator: (value) {
                                            if (value.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please input some text';
                                            }
                                          },
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          FadeAnimation(
                              2,
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Material(
                                    child: InkWell(
                                      onTap: () {
                                        if (formKey.currentState.validate()) {
                                          print('validated');
                                          user.signInWithCredentials(
                                              email: emailController.value.text,
                                              password: passwordController
                                                  .value.text);
                                        } else {
                                          print('Error in validation');
                                        }
                                      },
                                      child: user.status ==
                                              Status.Authenticating
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient:
                                                      LinearGradient(colors: [
                                                    Color.fromRGBO(
                                                        143, 148, 251, 1),
                                                    Color.fromRGBO(
                                                        143, 148, 251, .8),
                                                  ])),
                                              child:
                                                  Center(child: Text('Login')),
                                            ),
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1)),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              )),
                          FadeAnimation(
                              2.2,
                              Column(
                                children: [
                                  SignInButton(
                                    Buttons.Email,
                                    text: "Sign up with Email",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNotifierProvider.value(
                                                  value: user,
                                                  child: RegisterPage(),
                                                )),
                                      );
                                    },
                                  ),
                                  SignInButton(
                                    Buttons.Google,
                                    text: "Sign in with Google",
                                    onPressed: () {
                                      user.signInWithGoogle().catchError(
                                          // ignore: sdk_version_set_literal
                                          (error) => {print(error)});
                                    },
                                  ),
                                  SignInButton(
                                    Buttons.GitHub,
                                    text: "Sign in with GitHub",
                                    onPressed: () {},
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

// class Buttons extends StatelessWidget {
//   final Widget text;
//   final Function onTap;

//   const Buttons({Key key, this.text, this.onTap}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FadeAnimation(
//         2,
//         Container(
//           height: 50,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               gradient: LinearGradient(colors: [
//                 Color.fromRGBO(143, 148, 251, 1),
//                 Color.fromRGBO(143, 148, 251, .8),
//               ])),
//           child: Center(child: text),
//         ));
//   }
// }
