import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:the_planet/di/injector.config.dart';

final getIt = GetIt.instance;

@injectableInit
void initialInject() => $initGetIt(getIt);