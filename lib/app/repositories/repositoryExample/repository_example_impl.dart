import 'dart:developer';

import 'package:app_flutter_arch/app/data_sources/remote_data_source/remote_data_source.dart';
import 'package:app_flutter_arch/app/models/model_example.dart';

import '../../core/exceptions/repository_exception.dart';
import './repository_example.dart';

class RepositoryExampleImpl implements RepositoryExample {
  final RemoteDataSource remoteDataSource;

  RepositoryExampleImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<ModelExample>> findAllItems() async {
    try {
      //TODO: check if network is available. If not, get from localRemoteDataSource
      return await remoteDataSource.findAllItems();
    } catch (e, s) {
      log('Erro ao buscar items', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar items');
    }
  }
}
