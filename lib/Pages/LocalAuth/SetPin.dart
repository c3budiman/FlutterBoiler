import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutterboiler/Configs/Colors.dart';

class SetPin extends StatefulWidget {
  @override
  _SetPinState createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {
  bool isConfirm = false;
  List<int>? pattern;
  String currentText = '';
  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  String confirmText = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
        title: Text("Set Pin"),
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/images/otp.gif"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Column(
                    children: [
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          inactiveFillColor: Colors.black87,
                          inactiveColor:
                              Theme.of(context).colorScheme.goldTheme,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          activeColor:
                              Theme.of(context).colorScheme.blueOldTheme,
                          selectedFillColor:
                              Theme.of(context).colorScheme.whiteTheme,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        // backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          if (!isConfirm) {
                            confirmText = v;
                          }
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          return false;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30),
                        child: ButtonTheme(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              formKey.currentState!.validate();
                              // conditions for validating
                              if (currentText.length < 4) {
                                print('kurang dari 4');
                                errorController.add(ErrorAnimationType
                                    .shake); // Triggering error shake animation
                                setState(() {
                                  hasError = true;
                                });
                              } else {
                                if (isConfirm) {
                                  if (confirmText == currentText) {
                                    Navigator.of(context).pop(currentText);
                                  } else {
                                    print('engga sama');
                                    print('konfirm : ' + confirmText);
                                    print('currentText : ' + currentText);
                                    errorController.add(
                                        ErrorAnimationType.shake); // Trigge
                                    setState(() {
                                      hasError = true;
                                    });
                                  }
                                } else {
                                  print('pas 4');
                                  textEditingController.clear();
                                  setState(() {
                                    isConfirm = true;
                                    currentText = '';
                                  });
                                }

                                setState(
                                  () {
                                    hasError = false;
                                  },
                                );
                              }
                            },
                            child: Center(
                              child: Text(
                                isConfirm ? "Konfirmasi Pin" : "Set Pin",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.goldTheme,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.goldTheme,
                              offset: Offset(1, -2),
                              blurRadius: 5,
                            ),
                            BoxShadow(
                              color: Theme.of(context).colorScheme.goldTheme,
                              offset: Offset(-1, 2),
                              blurRadius: 5,
                            )
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
    );
  }
}
