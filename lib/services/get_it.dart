import 'package:get_it/get_it.dart';
import 'package:yollararo/services/api_service.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
