import 'package:flutter/material.dart';
import 'package:flutterboiler/pages/examples/screen/example_screen.dart';
import 'package:flutterboiler/pages/home/screen/home_screen.dart';
import 'package:flutterboiler/pages/middleware.dart';
import 'package:flutterboiler/pages/profile/screen/profile_screen.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/utils/provider/auth_provider.dart';
import 'package:flutterboiler/utils/provider/ui_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBarPrimary extends StatefulWidget {
  final int currentIndexes;

  BottomNavBarPrimary({Key? key, this.currentIndexes = 0}) : super(key: key);

  @override
  BottomNavBarPrimaryState createState() => BottomNavBarPrimaryState();
}

class BottomNavBarPrimaryState extends MiddlewareState<BottomNavBarPrimary> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.currentIndexes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final uiProvider = context.watch<UIProvider>();
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          children: [
            //Page View
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: authProvider.userData?.role == 1
                    ? [
                        HomeScreen(),
                        ProfileScreen(),
                      ]
                    : [
                        HomeScreen(),
                        ExamplesScreen(),
                        ProfileScreen(),
                      ],
              ),
            ),

            AnimatedSwitcher(
              duration: Duration(milliseconds: 50),
              child: uiProvider.showNavbar
                  ? Material(
                      shape: Border(top: BorderSide(width: 0.1)),
                      color: Colors.white,
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          children: authProvider.userData?.role == 1
                              ? [
                                  _buildIconButton(Icons.home, "Home", 0),
                                  _buildIconButton(Icons.person, "Profil", 1),
                                ]
                              : [
                                  _buildIconButton(Icons.home, "Home", 0),
                                  _buildIconButton(
                                      Icons.airplane_ticket, "Examples", 1),
                                  _buildIconButton(Icons.person, "Profil", 2),
                                ],
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData iconData, String label, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _pageController.jumpToPage(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              iconData,
              color: _currentIndex == index
                  ? Theme.of(context).colorScheme.blueOldTheme
                  : Colors.grey,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: _currentIndex == index
                    ? Theme.of(context).colorScheme.blueOldTheme
                    : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
