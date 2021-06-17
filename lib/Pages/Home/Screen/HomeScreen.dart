import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Colors.dart';
import 'package:flutterboiler/Pages/Home/Widgets/BlogItems.dart';
import 'package:flutterboiler/Utils/Fetcher.dart';
import 'package:flutterboiler/Utils/PrintUtils.dart';
import 'package:flutterboiler/Widgets/Appbar/AppbarPrimary.dart';
import 'package:flutterboiler/Widgets/BottomNavbar/BottomNavbarPrimary.dart';
import 'package:flutterboiler/Widgets/BottomNavbar/Logic/NavbarLogic.dart';
import 'package:flutterboiler/Widgets/Drawer/DrawerPrimary.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var blogsArticle = [];
  @override
  void initState() {
    super.initState();
    doinit();
  }

  doinit() async {
    try {
      var result = await Fetcher.getData(
        context: context,
        uri: 'https://60c8c3513fcd810017036b8c.mockapi.io/Blog',
        params: {'page': 1, 'limit': 5},
        silent: true,
      );
      setState(() {
        blogsArticle = result;
      });
      PrintUtils.printWarning(result.toString());
    } catch (e) {
      PrintUtils.printError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.whiteTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppbarPrimary(
          title: "Home",
          fontColor: Theme.of(context).colorScheme.whiteTheme,
          backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
          connectionChange: (val) {
            if (val) {
              print('back online');
              doinit();
            }
          },
        ),
      ),
      endDrawer: DrawerPrimary(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: blogsArticle.isEmpty,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 4),
                        color: Colors.grey,
                        width: 100,
                        height: 12,
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: blogsArticle.isNotEmpty,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: blogsArticle.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BlogItems(
                      avatar: blogsArticle[index]['avatar'],
                      name: blogsArticle[index]['name'],
                      pic: blogsArticle[index]['img'],
                      desc: blogsArticle[index]['desc'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbarPrimary(
        activeBar: 0,
        onTap: (index) {
          NavbarLogic.navbarNavigation(
            context: context,
            currentIndex: 0,
            gotoIndex: index,
          );
        },
      ),
    );
  }
}
