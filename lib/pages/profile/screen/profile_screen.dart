import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/pages/profile/logic/profile_logic.dart';
import 'package:flutterboiler/utils/provider/auth_provider.dart';
import 'package:flutterboiler/utils/provider/ui_provider.dart';
import 'package:flutterboiler/widgets/appbar/appbar_primary.dart';
import 'package:flutterboiler/widgets/drawer/drawer_primary.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutterboiler/widgets/dialogs/extension_dialog.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = GetIt.I.get<LocalAuthentication>();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  List<String> roleList = ['Member', 'Admin'];
  String? _role;

  fetchProfile() async {
    await ProfileLogic.fetchProfile();
    emailController.text = AuthProvider.instance.userData?.username ?? '-';
    _role = AuthProvider.instance.userData?.role == 1 ? 'Member' : 'Admin';
    aboutMeController.text = AuthProvider.instance.userData?.bio ?? '-';
  }

  doEditProfile() async {
    try {
      await auth.authenticate(
        localizedReason: "Please authenticate to change profile data",
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: false,
      );
    } on PlatformException catch (e) {
      context.showError(
        e.message ?? 'Something went wrong',
      );
      return;
    }

    try {
      context.showLoading();
      var response = await ProfileLogic.editProfile(
        role: _role ?? 'Member',
        aboutMe: aboutMeController.text,
      );
      context.hideDialog();

      if (response['code'] == 0) {
        await fetchProfile();
        await context.showSuccess(response['info']);
      } else {
        context.showError(response['info']);
      }
    } catch (e) {
      context.hideDialog();
    }
  }

  @override
  void initState() {
    emailController.text = AuthProvider.instance.userData?.username ?? '-';
    _role = AuthProvider.instance.userData?.role == 1 ? 'Member' : 'Admin';
    aboutMeController.text = AuthProvider.instance.userData?.bio ?? '-';
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.whiteTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppbarPrimary(
          title: "Profile",
          fontColor: Theme.of(context).colorScheme.whiteTheme,
          backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
        ),
      ),
      endDrawer: DrawerPrimary(),
      onEndDrawerChanged: (val) {
        if (val)
          UIProvider.instance.navbarHide();
        else
          UIProvider.instance.navbarShow();
      },
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: authProvider.userData?.images ??
                      'https://cdn4.iconfinder.com/data/icons/one-piece-anime/48/Sed-02-512.png',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 1.0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        enabled: false,
                        controller: emailController,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Email',
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        underline: SizedBox(),
                        hint: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.person_outline,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Choose a role',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                        value: _role,
                        dropdownColor: Colors.white,
                        items: roleList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 13,
                                ),
                                Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  value,
                                ),
                              ],
                            ),
                            value: value,
                          );
                        }).toList(),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _role = value;
                          });
                        },
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        height: 150,
                        child: TextField(
                          controller: aboutMeController,
                          textAlignVertical: TextAlignVertical.top,
                          autofocus: false,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 12),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            fillColor: Colors.white,
                            hintText: 'About Me',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          maxLines: null,
                          expands: true,
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                            width: MediaQuery.of(context).size.width,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary:
                                  Theme.of(context).colorScheme.blueOldTheme,
                              onPrimary: Colors.white,
                              onSurface:
                                  Theme.of(context).colorScheme.blueOldTheme,
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: (authProvider.userData?.bio !=
                                        aboutMeController.text) ||
                                    ((authProvider.userData?.role == 1
                                            ? 'Member'
                                            : 'Admin') !=
                                        _role)
                                ? doEditProfile
                                : null,
                            child: Text('Save'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
