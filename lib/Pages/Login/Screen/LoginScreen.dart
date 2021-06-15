import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterboiler/Configs/Colors.dart';
import 'package:flutterboiler/Configs/Images.dart';
import 'package:flutterboiler/Pages/Home/Screen/HomeScreen.dart';
import 'package:flutterboiler/Pages/Login/Screen/LoginBackground.dart';
import 'package:flutterboiler/Widgets/Buttons/ButtonPrimary.dart';
import 'package:flutterboiler/Widgets/Forms/InputEmail.dart';
import 'package:flutterboiler/Widgets/Forms/InputPassword.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  String email = '';
  String password = '';
  bool error = false;
  String pesanerror = 'Login Failed. Try Again';
  List<int>? pattern;
  bool berhasilLogin = false;

  @override
  void initState() {
    super.initState();
  }

  doLogin() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.bluelogin,
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.bluelogin,
          child: Stack(
            children: [
              LoginBackground(),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Image.asset(
                  Images.logo,
                  height: 140,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2 + 120,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Just Another Boiler",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Templates",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !error,
                          child: SizedBox(height: 40),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Visibility(
                          visible: loading,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Loading...",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        InputEmail(
                          label: 'Email Address',
                          onChanged: (text) {
                            print(text);
                            setState(() {
                              email = text;
                            });
                          },
                        ),
                        InputPassword(
                          label: 'Password',
                          onChanged: (text) {
                            print(text);
                            setState(() {
                              password = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ButtonPrimary(
                          label: "Login",
                          backgroundColor:
                              Theme.of(context).colorScheme.goldTheme,
                          fontColor: Theme.of(context).colorScheme.blueOldTheme,
                          onTap: () {
                            doLogin();
                          },
                        ),
                        ButtonPrimary(
                          label: "Register",
                          backgroundColor:
                              Theme.of(context).colorScheme.blueOldTheme,
                          fontColor: Theme.of(context).colorScheme.goldTheme,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
