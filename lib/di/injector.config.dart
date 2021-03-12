// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository.dart' as _i7;
import '../screens/auth/auth_controller.dart' as _i11;
import '../screens/auth/auth_state_manager.dart' as _i4;
import '../screens/auth/providers/error_provider.dart' as _i3;
import '../screens/register/providers/button_enable_provider.dart' as _i5;
import '../screens/register/providers/privacy_state_provider.dart' as _i6;
import '../screens/register/providers/tooltip_provider.dart' as _i8;
import '../screens/register/register_controller.dart' as _i12;
import '../screens/register/register_state_manager.dart' as _i10;
import '../usecase/intro_usecase.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthErrorProvider>(() => _i3.AuthErrorProvider());
  gh.factory<_i4.AuthStateManager>(
      () => _i4.AuthStateManager(get<_i3.AuthErrorProvider>()));
  gh.lazySingleton<_i5.ButtonEnableProvider>(() => _i5.ButtonEnableProvider());
  gh.lazySingleton<_i6.PrivacyMessageStateProvider>(
      () => _i6.PrivacyMessageStateProvider());
  gh.lazySingleton<_i7.Repository>(() => _i7.Repository());
  gh.lazySingleton<_i8.TooltipProvider>(() => _i8.TooltipProvider());
  gh.lazySingleton<_i9.IntroUseCase>(
      () => _i9.IntroUseCase(get<_i7.Repository>()));
  gh.lazySingleton<_i10.RegisterScreenStateManager>(() =>
      _i10.RegisterScreenStateManager(
          get<_i8.TooltipProvider>(),
          get<_i6.PrivacyMessageStateProvider>(),
          get<_i5.ButtonEnableProvider>()));
  gh.lazySingleton<_i11.AuthController>(() => _i11.AuthController(
      get<_i9.IntroUseCase>(), get<_i4.AuthStateManager>()));
  gh.lazySingleton<_i12.RegisterController>(() => _i12.RegisterController(
      get<_i10.RegisterScreenStateManager>(), get<_i9.IntroUseCase>()));
  return get;
}
