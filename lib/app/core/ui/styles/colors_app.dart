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
  Color get orange => const Color(0XffF38B35);
  Color get blue => const Color(0Xff0B80F3);
  Color get green => const Color(0Xff00B564);
  Color get lightGreen => const Color(0XffEDFFF7);
  Color get gray => const Color(0Xff626F86);
  Color get grayVariant => const Color(0xffDFE2E8);
  Color get darkGray => const Color(0Xff44546F);
  Color get lightGray => const Color.fromRGBO(98, 111, 134, 0.10);
  Color get lightGrayVariant => const Color(0xffEEF0F3);
  Color get red => const Color(0XffFF3B30);
  Color get lightRed => const Color.fromRGBO(255, 59, 48, 0.10);
  Color get black => const Color(0Xff000000);
  Color get white => const Color(0Xffffffff);
}

extension ColrosAppExtencions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
