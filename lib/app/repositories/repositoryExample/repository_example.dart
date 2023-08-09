import '../../models/model_example.dart';

abstract class RepositoryExample {
  Future<List<ModelExample>> findAllItems();
}
