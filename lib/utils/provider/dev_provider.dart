import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

class DevProvider extends ChangeNotifier {
  final Database _db = GetIt.I.get();
  final StoreRef<String, dynamic> _store = StoreRef.main();
  bool _isDevMode = false;

  static final DevProvider _instance = DevProvider();

  static DevProvider get instance => _instance;

  Future<void> init() async {
    _isDevMode = (await _store.record('isDevMode').get(_db)) ?? false;
  }

  bool get isDevMode => _isDevMode;

  set isDevMode(bool isDevMode) {
    _isDevMode = isDevMode;
    _store.record('isDevMode').put(_db, isDevMode);
    notifyListeners();
  }
}
