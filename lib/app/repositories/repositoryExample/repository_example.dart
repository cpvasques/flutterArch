import 'package:app_flutter_arch/app/core/result/result.dart';

import '../../models/model_example.dart';

abstract class RepositoryExample {
  Future<Result<List<ModelExample>>> findAllItems();
}
