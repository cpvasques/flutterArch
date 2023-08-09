import 'package:app_flutter_arch/app/core/config/env/env.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_arch/app/app_flutter_arch.dart';

Future<void> main() async {
  await Env.instance.load();

  runApp(const AppFlutterArch());
}
