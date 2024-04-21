import 'package:barcode/core/injection/get_it.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

Future<void> initDepencies() async {
  getIt.registerLazySingleton(() => Dio());
  configureDependencies();
}
