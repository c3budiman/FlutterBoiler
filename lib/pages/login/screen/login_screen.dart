import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterboiler/pages/login/logic/login_logic.dart';
import 'package:flutterboiler/pages/login/screen/login_background.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/configs/images.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';
import 'package:flutterboiler/widgets/buttons/button_primary.dart';
import 'package:flutterboiler/widgets/forms/input_email.dart';
import 'package:flutterboiler/widgets/forms/input_password.dart';

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
    LoginLogic.checkLogin(context);
  }

  doLogin() async {
    setState(
      () {
        loading = true;
      },
    );

    // var response = await LoginLogic.doLogin(
    //   email: email,
    //   password: password,
    // );
    // print(response);

    await NavigatorCustom.forwardNavigateReplacement(
      context: context,
      from: 'login',
      to: 'home',
    );

    // if (response['code'] == 0) {
    //   showDialog(
    //     context: context,
    //     builder: (_) {
    //       return SuccessDialog(
    //         title: "Sukses",
    //         message: response['info'],
    //       );
    //     },
    //   ).then(
    //     (value) async {
    //       await NavigatorCustom.forwardNavigate(
    //         context: context,
    //         from: 'login',
    //         to: 'home',
    //       );
    //     },
    //   );
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (_) {
    //       return ErrorDialog(
    //         title: "Error",
    //         message: response['info'],
    //       );
    //     },
    //   );
    // }

    if (mounted) {
      setState(
        () {
          loading = false;
        },
      );
    }
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
                          child: Column(
                            children: [
                              SpinKitFoldingCube(
                                color: Colors.white,
                                size: 70.0,
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !loading,
                          child: Column(
                            children: [
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
                                fontColor:
                                    Theme.of(context).colorScheme.blueOldTheme,
                                onTap: () {
                                  doLogin();
                                },
                              ),
                              ButtonPrimary(
                                label: "Register",
                                backgroundColor:
                                    Theme.of(context).colorScheme.blueOldTheme,
                                fontColor:
                                    Theme.of(context).colorScheme.goldTheme,
                                onTap: () {
                                  NavigatorCustom.forwardNavigate(
                                    context: context,
                                    from: 'login',
                                    to: 'register',
                                  );
                                },
                              ),
                            ],
                          ),
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
