import 'package:app_flutter_arch/app/core/ui/helpers/shared_preferences.dart';
import 'package:flutter/material.dart';

class GlobalContext {
  late final GlobalKey<NavigatorState> _navigatorkey;

  static GlobalContext? _instance;

  GlobalContext._();

  static GlobalContext get i {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorkey = key;

  Future<void> unauthUser() async {
    await clearAllSharedPreferencesKeys();
    _navigatorkey.currentState!.pushNamedAndRemoveUntil('/', (route) => false);
  }
}
