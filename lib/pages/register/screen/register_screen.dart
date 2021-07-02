import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterboiler/pages/login/screen/login_background.dart';
import 'package:flutterboiler/pages/register/logic/register_logic.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/configs/images.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';
import 'package:flutterboiler/widgets/buttons/button_primary.dart';
import 'package:flutterboiler/widgets/forms/dropdown_role.dart';
import 'package:flutterboiler/widgets/forms/input_about.dart';
import 'package:flutterboiler/widgets/forms/input_email.dart';
import 'package:flutterboiler/widgets/forms/input_password.dart';
import 'package:flutterboiler/widgets/dialogs/extension_dialog.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _password = '';
  String _aboutMe = '';
  String? _role;

  doRegister() async {
    try {
      context.showLoading();
      var response = await RegisterLogic.doRegister(
        email: _email,
        password: _password,
        role: _role ?? 'Member',
        aboutMe: _aboutMe,
      );
      context.hideDialog();

      if (response['code'] == 0) {
        await context.showSuccess(response['info']);
        context.pushReplacement(to: 'login');
      } else {
        context.showError(response['info']);
      }
    } catch (e) {
      context.hideDialog();
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
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
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
                                onChanged: (text) {
                                  print(text);
                                  setState(() {
                                    _password = text;
                                  });
                                },
                              ),
                              DropdownRole(
                                hintText: 'Choose your role',
                                choice: ['Member', 'Admin'],
                                onChanged: (value) {
                                  setState(() {
                                    _role = value;
                                  });
                                },
                                value: _role,
                              ),
                              InputAbout(
                                label: 'About me',
                                onChanged: (text) {
                                  setState(() {
                                    _aboutMe = text;
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
                        ],
                      ),
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
