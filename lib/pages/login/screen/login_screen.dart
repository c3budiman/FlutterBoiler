import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterboiler/pages/login/logic/login_logic.dart';
import 'package:flutterboiler/pages/login/screen/login_background.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/configs/images.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';
import 'package:flutterboiler/utils/provider/ui_provider.dart';
import 'package:flutterboiler/widgets/buttons/button_primary.dart';
import 'package:flutterboiler/widgets/forms/input_email.dart';
import 'package:flutterboiler/widgets/forms/input_password.dart';
import 'package:flutterboiler/widgets/dialogs/extension_dialog.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  doLogin() async {
    try {
      context.showLoading();
      var response = await LoginLogic.doLogin(
        email: _email,
        password: _password,
      );
      context.hideDialog();

      if (response['code'] == 0) {
        await context.showSuccess(response['info']);
        context.pushReplacement(to: 'home');
      } else {
        context.showError(response['info']);
      }
    } catch (e) {
      context.hideDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final deviceSize = MediaQuery.of(context).size;
    final uiProvider = context.watch<UIProvider>();
    return Scaffold(
      backgroundColor: colorScheme.bluelogin,
      body: SingleChildScrollView(
        child: Container(
          color: colorScheme.bluelogin,
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
                    height: deviceSize.height / 2 + 120,
                    width: deviceSize.width,
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
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            InputEmail(
                              label: 'Email Address',
                              onChanged: (text) {
                                print(text);
                                setState(() {
                                  _email = text;
                                });
                              },
                            ),
                            InputPassword(
                              label: 'Password',
                              isBottom: true,
                              onChanged: (text) {
                                print(text);
                                setState(() {
                                  _password = text;
                                });
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ButtonPrimary(
                              label: "Login",
                              backgroundColor: colorScheme.goldTheme,
                              fontColor: colorScheme.blueOldTheme,
                              onTap: () {
                                doLogin();
                              },
                            ),
                            ButtonPrimary(
                              label: "Register",
                              backgroundColor: colorScheme.blueOldTheme,
                              fontColor: colorScheme.goldTheme,
                              onTap: () {
                                context.push(
                                  to: 'register',
                                );
                              },
                            ),
                          ],
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
