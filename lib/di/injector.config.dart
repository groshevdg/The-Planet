// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../screens/auth/auth_controller.dart' as _i7;
import '../screens/auth/auth_state_manager.dart' as _i6;
import '../screens/auth/providers/button_enable_provider.dart' as _i3;
import '../screens/auth/providers/privacy_state_provider.dart' as _i4;
import '../screens/auth/providers/tooltip_provider.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ButtonEnableProvider>(() => _i3.ButtonEnableProvider());
  gh.lazySingleton<_i4.PrivacyMessageStateProvider>(
      () => _i4.PrivacyMessageStateProvider());
  gh.lazySingleton<_i5.TooltipProvider>(() => _i5.TooltipProvider());
  gh.lazySingleton<_i6.AuthScreenStateManager>(() => _i6.AuthScreenStateManager(
      get<_i5.TooltipProvider>(),
      get<_i4.PrivacyMessageStateProvider>(),
      get<_i3.ButtonEnableProvider>()));
  gh.lazySingleton<_i7.AuthController>(
      () => _i7.AuthController(get<_i6.AuthScreenStateManager>()));
  return get;
}
