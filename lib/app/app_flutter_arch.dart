import 'package:app_flutter_arch/app/core/provider/application_binding.dart';
import 'package:app_flutter_arch/app/core/router/app_router.dart';
import 'package:app_flutter_arch/app/core/router/navigator_app_router.dart';
import 'package:app_flutter_arch/app/core/ui/theme/theme_config.dart';
import 'package:app_flutter_arch/app/core/global/global_context.dart';
import 'package:flutter/material.dart';

// Routes
import 'package:app_flutter_arch/app/pages/home/home_router.dart';
import 'package:app_flutter_arch/app/pages/splash/splash_page.dart';

class AppFlutterArch extends StatefulWidget {
  const AppFlutterArch({
    super.key,
  });

  @override
  State<AppFlutterArch> createState() => _AppFlutterArchState();
}

class _AppFlutterArchState extends State<AppFlutterArch> {
  final _navKey = GlobalKey<NavigatorState>();
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = NavigatorAppRouter(navigatorStateKey: _navKey);
    GlobalContext.i.appRouter = _appRouter;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      appRouter: _appRouter,
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
