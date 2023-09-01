import 'package:app_flutter_arch/app/core/controller/base/base_cubit_controller.dart';

import 'package:app_flutter_arch/app/pages/home/home_state.dart';
import 'package:app_flutter_arch/app/repositories/repositoryExample/repository_example.dart';

class HomeController extends BaseCubitController<HomeState> {
  final RepositoryExample _repositoryExample;

  HomeController(
    this._repositoryExample,
  ) : super(HomeState.initial());

  Future<void> loadItems() async {
    emit(state.copyWith(status: HomeStateStatus.loading));

    final productsResult = await _repositoryExample.findAllItems();
    if (emitStateIfFailure(productsResult)) return;

    emit(state.copyWith(
      status: HomeStateStatus.loaded,
      products: productsResult.data,
    ));
  }

  Future<void> login({
    required String? user,
    required String? password,
  }) async {
    if (user?.isNotEmpty != true && password?.isNotEmpty != true) {
      emit(state.copyWith(
        status: HomeStateStatus.error,
        errorMessage: "Preencha todos os campos.",
      ));
      emit(state.copyWith(
        status: HomeStateStatus.noError,
      ));
    }
  }
}
