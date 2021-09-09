import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterboiler/pages/login/screen/login_background.dart';
import 'package:flutterboiler/pages/register/logic/register_logic.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';
import 'package:flutterboiler/widgets/buttons/button_primary.dart';
import 'package:flutterboiler/widgets/forms/dropdown_role.dart';
import 'package:flutterboiler/widgets/forms/input_about.dart';
import 'package:flutterboiler/widgets/forms/input_email.dart';
import 'package:flutterboiler/widgets/forms/input_password.dart';
import 'package:flutterboiler/widgets/dialogs/extension_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _email = '';
  String? _password = '';
  String? _aboutMe = '';
  String? _role;
  String? _fileImage;
  final picker = ImagePicker();

  ///Get image from Gallery
  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile == null) {
      return;
    }

    final croppedFile = await ImageCropper.cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Theme.of(context).colorScheme.goldTheme,
        toolbarWidgetColor: Theme.of(context).colorScheme.blueOldTheme,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: true,
      ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
        aspectRatioLockEnabled: true,
      ),
    );

    if (croppedFile != null) {
      context.showLoading();
      try {
        setState(() {
          _fileImage = croppedFile.path;
        });
      } catch (e) {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(e is String ? e : 'Something went wrong'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      context.hideDialog();
    }
  }

  ///Get image from Camera
  Future getImageCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile == null) {
      return;
    }

    final croppedFile = await ImageCropper.cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Theme.of(context).colorScheme.goldTheme,
        toolbarWidgetColor: Theme.of(context).colorScheme.blueOldTheme,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: true,
      ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
        aspectRatioLockEnabled: true,
      ),
    );

    if (croppedFile != null) {
      context.showLoading();
      try {
        setState(() {
          _fileImage = croppedFile.path;
        });
      } catch (e) {
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(e is String ? e : 'Something went wrong'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      context.hideDialog();
    }
  }

  doRegister() async {
    if (_aboutMe == null ||
        _email == null ||
        _fileImage == null ||
        _password == null ||
        _role == null) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red.shade700,
        content: Text('Please fill the data'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    try {
      context.showLoading();
      var response = await RegisterLogic.doRegister(
        email: _email ?? '',
        password: _password ?? '',
        role: _role ?? 'Member',
        aboutMe: _aboutMe ?? '',
        imagePath: _fileImage ?? '',
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
                top: 0,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
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
                              height: 20,
                            ),
                            avatarEdit(_fileImage),
                            SizedBox(
                              height: 20,
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
                                  fontColor: Theme.of(context)
                                      .colorScheme
                                      .blueOldTheme,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget avatarEdit(String? imagePath) => Material(
        type: MaterialType.circle,
        color: Colors.grey.withOpacity(0.8),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () async {
            final value = await context.showChooseCamera(
                'Choose where you want to pick your image from');
            switch (value) {
              case true:
                getImageCamera();
                break;
              case false:
                getImageGallery();
                break;
              default:
            }
          },
          child: Container(
            height: 140,
            width: 140,
            child: Stack(
              fit: StackFit.expand,
              children: [
                imagePath != null
                    ? Positioned.fill(
                        child:
                            Image.file(File(imagePath), fit: BoxFit.fitHeight),
                      )
                    : Positioned.fill(
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4),
                    color: Theme.of(context)
                        .colorScheme
                        .goldTheme
                        .withOpacity(0.8),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context).colorScheme.blueOldTheme,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
