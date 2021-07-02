import 'package:flutter/material.dart';
import 'package:flutterboiler/models/user.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

class AuthProvider extends ChangeNotifier {
  static final instance = AuthProvider();

  final _db = GetIt.I.get<Database>();
  final _store = StoreRef.main();

  UserModel? _userData;

  Future<void> init() async {
    final _tempDataUser = (await _store.record('user_data').get(_db));
    _userData =
        _tempDataUser != null ? UserModel.fromJson(_tempDataUser) : null;
  }

  UserModel? get userData => _userData;

  bool get isLogin => _userData != null;

  Future<void> setLoginData(Map<String, dynamic> data) async {
    _userData = UserModel.fromJson(data);
    await _store.record('user_data').put(
          _db,
          _userData!.toJson(),
        );
    notifyListeners();
  }

  Future<void> logOut() async {
    _userData = null;
    await _store.records(['user_data']).delete(_db);
    notifyListeners();
  }
}
