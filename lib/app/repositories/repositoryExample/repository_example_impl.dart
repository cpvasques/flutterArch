import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:app_flutter_arch/app/models/model_example.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import './repository_example.dart';

class RepositoryExampleImpl implements RepositoryExample {
  final CustomDio dio;
  RepositoryExampleImpl({required this.dio});

  @override
  Future<List<ModelExample>> findAllItems() async {
    try {
      final result = await dio.unauth().get('/endpoint');
      return result.data
          .map<ModelExample>(
            (p) => ModelExample.fromMap(p),
          )
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar items', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar items');
    }
  }
}
