import 'dart:developer';

import 'package:app_flutter_arch/app/data_sources/remote_data_source/remote_data_source.dart';
import 'package:app_flutter_arch/app/models/model_example.dart';
import 'package:app_flutter_arch/app/core/result/failure.dart';
import 'package:app_flutter_arch/app/core/result/result.dart';
import 'package:app_flutter_arch/app/repositories/repositoryExample/repository_example.dart';
import 'package:dio/dio.dart';

class RepositoryExampleImpl implements RepositoryExample {
  final RemoteDataSource remoteDataSource;

  RepositoryExampleImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Result<List<ModelExample>>> findAllItems() async {
    try {
      final modelExamples = await remoteDataSource.findAllItems();
      return Result.success(data: modelExamples);
    } on DioException catch (e, s) {
      log('Erro de API ao buscar items', error: e, stackTrace: s);
      return Result.fail(
        failure: RemoteFailure(message: 'Erro ao buscar items'),
      );
    } catch (e, s) {
      log('Erro desconhecido ao buscar items', error: e, stackTrace: s);
      return Result.fail(
        failure: RemoteFailure(message: 'Erro ao buscar items'),
      );
    }
    //TODO esse try catch vai se repetir em muitos repositories. Acho que vale
    //criar um BaseRepository que faça um mapeamento default que possa ser
    //sobresscrito eventualmente.
  }
}
