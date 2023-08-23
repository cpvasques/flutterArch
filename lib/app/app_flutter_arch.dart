import 'package:app_flutter_arch/app/core/provider/application_binding.dart';
import 'package:app_flutter_arch/app/core/ui/theme/theme_config.dart';
import 'package:app_flutter_arch/app/core/global/global_context.dart';
import 'package:flutter/material.dart';

// Routes
import 'package:app_flutter_arch/app/pages/home/home_router.dart';
import 'package:app_flutter_arch/app/pages/splash/splash_page.dart';

class AppFlutterArch extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  AppFlutterArch({super.key}) {
    GlobalContext.i.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
        },
      ),
    );
  }
}
