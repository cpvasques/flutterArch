// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

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
    } on Exception catch (e, s) {
      log('Erro ao buscar items', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar items',
        ),
      );
    }
  }
}
