import 'package:app_flutter_arch/app/core/exceptions/repository_exception.dart';
import 'package:bloc/bloc.dart';

import 'package:app_flutter_arch/app/pages/home/home_state.dart';
import 'package:app_flutter_arch/app/repositories/repositoryExample/repository_example.dart';

class HomeController extends Cubit<HomeState> {
  final RepositoryExample _repositoryExample;

  HomeController(
    this._repositoryExample,
  ) : super(const HomeState.initial());

  Future<void> loadItems() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _repositoryExample.findAllItems();

      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } on RepositoryException catch (e) {
      final errorMessage = e.message;

      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: errorMessage,
        ),
      );
    }
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
