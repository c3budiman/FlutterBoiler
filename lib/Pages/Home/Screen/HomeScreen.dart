import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  var _controller = ScrollController();
  bool loadinginit = false;
  bool loadingmore = false;
  bool canmore = true;
  int page = 1;

  @override
  void initState() {
    super.initState();
    doinit();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          // You're at the top.
        } else {
          // You're at the bottom.
          print('at bottom');
          fetchMore();
        }
      }
    });
  }

  fetchMore() async {
    if (canmore) {
      print('can fetch');
      setState(() {
        loadingmore = true;
        page++;
      });

      var result = await Fetcher.getData(
        context: context,
        uri: 'https://60c8c3513fcd810017036b8c.mockapi.io/Blog',
        params: {'page': page, 'limit': 5},
        silent: true,
      );

      List res = result;

      if (res.isNotEmpty) {
        blogsArticle.addAll(res);
      } else {
        setState(() {
          canmore = false;
        });
      }

      setState(() {
        loadingmore = false;
      });
    }
  }

  doinit() async {
    try {
      setState(() {
        loadinginit = true;
      });
      var result = await Fetcher.getData(
        context: context,
        uri: 'https://60c8c3513fcd810017036b8c.mockapi.io/Blog',
        params: {'page': page, 'limit': 5},
        silent: true,
      );
      if (mounted) {
        setState(() {
          blogsArticle = result;
          loadinginit = false;
        });
      }

      // PrintUtils.printWarning(result.toString());
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
          title: "Cepsgram",
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
        physics: ScrollPhysics(),
        controller: _controller,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: loadinginit,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: BlogItems(
                        avatar: '',
                        name: '',
                        pic: '',
                        desc: '',
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: !loadinginit,
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
              Visibility(
                visible: loadingmore,
                child: Column(
                  children: [
                    SpinKitCircle(
                      color: Theme.of(context).colorScheme.blueOldTheme,
                      size: 30.0,
                    ),
                  ],
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
