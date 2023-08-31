import 'package:app_flutter_arch/app/models/model_example.dart';

abstract class RemoteDataSource {
  Future<List<ModelExample>> findAllItems();
}
