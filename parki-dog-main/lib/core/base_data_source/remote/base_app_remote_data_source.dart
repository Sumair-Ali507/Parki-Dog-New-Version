import 'package:parki_dog/core/network/dio_factory.dart';
import 'package:parki_dog/core/services/service_locator.dart';

abstract class BaseAppRemoteDataSource {
  late DioFactory dio;

  BaseAppRemoteDataSource() {
    dio = getIt.get<DioFactory>();
  }
}
