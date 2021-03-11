// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository.dart' as _i5;
import '../screens/register/providers/button_enable_provider.dart' as _i3;
import '../screens/register/providers/privacy_state_provider.dart' as _i4;
import '../screens/register/providers/tooltip_provider.dart' as _i6;
import '../screens/register/register_controller.dart' as _i9;
import '../screens/register/register_state_manager.dart' as _i8;
import '../usecase/intro_usecase.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ButtonEnableProvider>(() => _i3.ButtonEnableProvider());
  gh.lazySingleton<_i4.PrivacyMessageStateProvider>(
      () => _i4.PrivacyMessageStateProvider());
  gh.lazySingleton<_i5.Repository>(() => _i5.Repository());
  gh.lazySingleton<_i6.TooltipProvider>(() => _i6.TooltipProvider());
  gh.lazySingleton<_i7.IntroUseCase>(
      () => _i7.IntroUseCase(get<_i5.Repository>()));
  gh.lazySingleton<_i8.RegisterScreenStateManager>(() =>
      _i8.RegisterScreenStateManager(
          get<_i6.TooltipProvider>(),
          get<_i4.PrivacyMessageStateProvider>(),
          get<_i3.ButtonEnableProvider>()));
  gh.lazySingleton<_i9.RegisterController>(() => _i9.RegisterController(
      get<_i8.RegisterScreenStateManager>(), get<_i7.IntroUseCase>()));
  return get;
}
