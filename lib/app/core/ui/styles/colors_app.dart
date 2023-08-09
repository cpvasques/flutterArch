import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0Xff0080E7);
  Color get secondary => const Color(0XffF88B0C);
  Color get white => const Color(0Xffffffff);
}

extension ColrosAppExtencions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
