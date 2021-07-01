import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

class AuthProvider extends ChangeNotifier {
  static final instance = AuthProvider();

  final _db = GetIt.I.get<Database>();
  final _store = StoreRef.main();

  dynamic _userData;

  Future<void> init() async {
    _userData = await _store.record('user_data').get(_db) ?? null;
  }

  dynamic get userData => _userData != null ? jsonDecode(_userData) : null;

  Future<void> setLoginData(String data) async {
    _userData = data;
    await _store.record('user_data').put(
          _db,
          data,
        );
    notifyListeners();
  }

  Future<void> logOut() async {
    _userData = null;
    await _store.records(['user_data']).delete(_db);
    notifyListeners();
  }
}
