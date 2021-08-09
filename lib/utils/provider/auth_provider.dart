import 'package:flutter/material.dart';
import 'package:flutterboiler/models/user.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

class AuthProvider extends ChangeNotifier {
  static final instance = AuthProvider();

  final _db = GetIt.I.get<Database>();
  final _store = StoreRef.main();

  UserModel? _userData;
  String? _token;

  Future<void> init() async {
    final _tempDataUser = (await _store.record('user_data').get(_db));
    _userData =
        _tempDataUser != null ? UserModel.fromJson(_tempDataUser) : null;
    _token = await _store.record('token').get(_db);
  }

  UserModel? get userData => _userData;
  String? get token => _token;
  bool get isLogin => _token != null;

  Future<void> setLoginData({Map<String, dynamic>? data, String? token}) async {
    _userData = UserModel.fromJson(data!);
    await _store.record('user_data').put(
          _db,
          _userData!.toJson(),
        );
    if (token != null) {
      _token = token;
      await _store.record('token').put(_db, token);
    }
    notifyListeners();
  }

  Future<void> logOut() async {
    _userData = null;
    _token = null;
    await _store.records(['user_data', 'token']).delete(_db);
    notifyListeners();
  }
}
