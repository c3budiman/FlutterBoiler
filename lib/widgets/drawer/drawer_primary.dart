import 'package:flutterboiler/pages/login/logic/login_logic.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/images.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';
import 'package:flutterboiler/utils/print_utils.dart';
import 'package:flutterboiler/widgets/dialogs/confirmation_dialog.dart';
import 'package:flutterboiler/widgets/drawer/widgets/drawer_items.dart';

class DrawerPrimary extends StatefulWidget {
  DrawerPrimary();

  @override
  _DrawerPrimaryState createState() => _DrawerPrimaryState();
}

class _DrawerPrimaryState extends State<DrawerPrimary> {
  doLogout() {
    NavigatorCustom.forwardNavigateReplacement(
      context: context,
      from: 'home',
      to: 'login',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).colorScheme.blueOldTheme,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.logo,
                          height: 60,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              'Cecep Budiman',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.goldTheme,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              LoginLogic.user['username'],
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.whiteTheme,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Divider(
                  //   color: Theme.of(context).colorScheme.whiteTheme,
                  //   height: 4,
                  //   thickness: 4,
                  // ),
                  SizedBox(height: 40),
                  DrawerItems(
                    title: 'Menu 1',
                    icon: Icons.ramen_dining,
                    color: Theme.of(context).colorScheme.whiteTheme,
                    onTap: () {
                      PrintUtils.printWhite('Tapped on menu 1');
                    },
                  ),
                  DrawerItems(
                    title: 'Menu 2',
                    icon: Icons.train,
                    color: Theme.of(context).colorScheme.whiteTheme,
                    onTap: () {
                      PrintUtils.printWhite('Tapped on menu 2');
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 50, left: 50),
                height: 100,
                // color: Colors.black,
                child: Container(
                  margin: EdgeInsets.only(bottom: 46),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.goldTheme,
                  ),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) {
                          return ConfirmationDialog(
                            message:
                                "Are you sure you want to logout from the application?",
                          );
                        },
                      ).then(
                        (value) async {
                          if (value) {
                            Navigator.pop(context);
                            doLogout();
                          }
                        },
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
