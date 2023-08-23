import 'package:app_flutter_arch/app/core/global/global_context.dart';
import 'package:app_flutter_arch/app/core/ui/helpers/shared_preferences.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? token = await getSharedPreferencesKey('token') as String?;
    options.headers['Authorization'] = 'Bearer $token';

    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      //redirecionar o user para a tela de home e limpar sharedPreferences
      GlobalContext.i.unauthUser();
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}
