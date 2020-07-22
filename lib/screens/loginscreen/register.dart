import 'package:coursesapp/Repositories/user_repository.dart';
import 'package:coursesapp/navbar/ProfileHome.dart';
import 'package:flutter/material.dart';
import 'package:coursesapp/Animation/FadeAnimation.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;
  UserRepository _userRepository;

  @override
  void initState() {
    _userRepository = UserRepository();
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
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/edu_background.png'),
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                                        var email = emailController.value.text;
                                        var password =
                                            passwordController.value.text;

                                        user.signUp(
                                            email: email, password: password);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ChangeNotifierProvider.value(
                                                value: user,
                                                child: ProfileHome(),
                                              ),
                                            ));
                                      } else {
                                        print('Error in validation');
                                      }
                                    },
                                    child: user.status == Status.Authenticating
                                        ? CircularProgressIndicator()
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
                                                Center(child: Text('Register')),
                                          ),
                                  ),
                                  color: Colors.transparent,
                                ),
                                SizedBox(height: 10),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
