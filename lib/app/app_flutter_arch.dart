import 'package:app_flutter_arch/app/core/provider/application_binding.dart';
import 'package:app_flutter_arch/app/core/ui/theme/theme_config.dart';
import 'package:app_flutter_arch/app/pages/home/home_router.dart';
import 'package:app_flutter_arch/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppFlutterArch extends StatelessWidget {
  const AppFlutterArch({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
        },
      ),
    );
  }
}
