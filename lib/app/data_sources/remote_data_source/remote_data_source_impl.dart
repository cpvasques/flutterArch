import 'package:app_flutter_arch/app/core/rest_client/custom_dio.dart';
import 'package:app_flutter_arch/app/data_sources/remote_data_source/remote_data_source.dart';
import 'package:app_flutter_arch/app/models/model_example.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  //Vale criar uma abstração para a classe de network? Por exemplo, um criar uma
  //classe abstrata do tipo NetworkHttpClient e uma classe DioNetworkHttpClient,
  //dessa forma, temos mais liberadade de trocar o Dio por outra ferramenta
  final CustomDio dio;

  RemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<ModelExample>> findAllItems() async {
    final result = await dio.unauth().get('/endpoint');
    return await result.data
        .map<ModelExample>(
          (p) => ModelExample.fromMap(p),
        )
        .toList();
  }
}
