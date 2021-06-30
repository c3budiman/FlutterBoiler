import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterboiler/pages/login/screen/login_background.dart';
import 'package:flutterboiler/pages/register/logic/register_logic.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/configs/images.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';
import 'package:flutterboiler/widgets/buttons/button_primary.dart';
import 'package:flutterboiler/widgets/dialogs/error_dialog.dart';
import 'package:flutterboiler/widgets/dialogs/success_dialog.dart';
import 'package:flutterboiler/widgets/forms/input_email.dart';
import 'package:flutterboiler/widgets/forms/input_password.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool loading = false;
  String email = '';
  String password = '';
  bool error = false;
  String pesanerror = 'Login Failed. Try Again';
  bool berhasilLogin = false;

  doRegister() async {
    setState(
      () {
        loading = true;
      },
    );
    var response = await RegisterLogic.doRegister(
      email: email,
      password: password,
    );

    print(response);

    if (response['code'] == 0) {
      showDialog(
        context: context,
        builder: (_) {
          return SuccessDialog(
            message: response['info'],
          );
        },
      ).then(
        (value) async {
          await NavigatorCustom.forwardNavigateReplacement(
            context: context,
            from: 'register',
            to: 'login',
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (_) {
          return ErrorDialog(
            message: response['info'],
          );
        },
      );
    }

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
                            "Register",
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
                                label: "Register",
                                backgroundColor:
                                    Theme.of(context).colorScheme.goldTheme,
                                fontColor:
                                    Theme.of(context).colorScheme.blueOldTheme,
                                onTap: doRegister,
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
