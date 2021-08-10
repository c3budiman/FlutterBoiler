import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutterboiler/routes.dart';
import 'package:flutterboiler/utils/notification_utils.dart';
import 'package:flutterboiler/utils/provider/auth_provider.dart';
import 'package:flutterboiler/utils/provider/dev_provider.dart';
import 'package:flutterboiler/utils/provider/ui_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

void main() async {
  final LocalAuthentication auth = LocalAuthentication();
  NotificationUtils.initNotif();
  // biar appbarnya bening / transparent color
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  final appDirDoc = await getApplicationDocumentsDirectory();
  String dbPath = appDirDoc.path + '/peersona.db';
  DatabaseFactory dbFactory = databaseFactoryIo;
  Database db = await dbFactory.openDatabase(dbPath);
  GetIt.I.registerSingleton(db);
  GetIt.I.registerSingleton(auth);
  final isDeviceSupport = await auth.isDeviceSupported();

  AuthProvider.instance.init();
  DevProvider.instance.init();
  UIProvider.instance.isDeviceSupport = isDeviceSupport;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UIProvider.instance),
        ChangeNotifierProvider.value(value: AuthProvider.instance),
        ChangeNotifierProvider.value(value: DevProvider.instance),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Template',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Theme.of(context).colorScheme.whiteTheme,
      ),
      initialRoute: "/",
      onGenerateRoute: generateRoutes,
    );
  }
}
