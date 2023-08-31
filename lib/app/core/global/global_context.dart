import 'package:app_flutter_arch/app/core/router/app_router.dart';
import 'package:app_flutter_arch/app/core/ui/helpers/shared_preferences.dart';

class GlobalContext {
  late final AppRouter _appRouter;

  static GlobalContext? _instance;

  GlobalContext._();

  static GlobalContext get i {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set appRouter(AppRouter appRouter) => _appRouter = appRouter;

  Future<void> unauthUser() async {
    await clearAllSharedPreferencesKeys();
    _appRouter.pushNamedAndRemoveUntil('/', (route) => false);
  }
}
