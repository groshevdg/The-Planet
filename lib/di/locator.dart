import 'package:get_it/get_it.dart';
import 'package:the_planet/data/repository.dart';
import 'package:the_planet/usecase/intro_usecase.dart';

GetIt getIt = GetIt.instance;

void setupAppSingletons() {
  getIt.registerLazySingleton<Repository>(() => Repository());
  getIt.registerLazySingleton<IntroUseCase>(() => IntroUseCase());
}