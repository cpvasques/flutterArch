import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarExample extends AppBar {
  AppBarExample({super.key, double elevation = 1})
      : super(
          elevation: elevation,
          toolbarHeight: 94,
          title: const SizedBox(),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xFF0080E7),
                  Color(0xFF203348),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
