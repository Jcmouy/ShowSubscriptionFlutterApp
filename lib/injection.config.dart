// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/data/datasources/remote/account_remote_data_source.dart';
import 'features/data/datasources/cache/authorization_cache_data_source.dart';
import 'features/data/datasources/remote/authorization_remote_data_source.dart';
import 'features/domain/repositories/authorization_repository.dart';
import 'features/data/repositories/authorization_repository_impl.dart';
import 'features/domain/business/change_user_account_password_service.dart';
import 'features/domain/business/create_pago_service.dart';
import 'features/domain/business/create_persona_service.dart';
import 'features/domain/business/create_subscripcion_service.dart';
import 'features/domain/business/create_usuario_service.dart';
import 'features/data/datasources/cache/cuenta_cache_data_source.dart';
import 'features/data/datasources/remote/clients/cuenta_remote_client.dart';
import 'features/data/datasources/remote/cuenta_remote_data_source.dart';
import 'features/domain/repositories/cuenta_repository.dart';
import 'features/data/repositories/cuenta_repository_impl.dart';
import 'features/data/datasources/local/dao_factory.dart';
import 'features/data/datasources/cache/etiqueta_cache_data_source.dart';
import 'features/data/datasources/remote/clients/etiqueta_remote_client.dart';
import 'features/data/datasources/remote/etiqueta_remote_data_source.dart';
import 'features/domain/repositories/etiqueta_repository.dart';
import 'features/data/repositories/etiqueta_repository_impl.dart';
import 'features/data/datasources/cache/funcion_cache_data_source.dart';
import 'features/data/datasources/remote/clients/funcion_remote_client.dart';
import 'features/data/datasources/remote/funcion_remote_data_source.dart';
import 'features/domain/repositories/funcion_repository.dart';
import 'features/data/repositories/funcion_repository_impl.dart';
import 'features/domain/business/get_cuentas_service.dart';
import 'features/domain/business/get_current_persona_service.dart';
import 'features/domain/business/get_current_usuario_service.dart';
import 'features/domain/business/get_funciones_service.dart';
import 'features/domain/business/get_obras_service.dart';
import 'features/domain/business/get_pais_service.dart';
import 'features/domain/business/get_paises_service.dart';
import 'features/domain/business/get_subscripciones_service.dart';
import 'features/domain/business/get_usuario_service.dart';
import 'features/domain/business/login_manual_service.dart';
import 'features/data/datasources/cache/mensaje_cache_data_source.dart';
import 'features/data/datasources/remote/clients/mensaje_remote_client.dart';
import 'features/data/datasources/remote/mensaje_remote_data_source.dart';
import 'features/domain/repositories/mensaje_repository.dart';
import 'features/data/repositories/mensaje_repository_impl.dart';
import 'features/data/datasources/cache/moneda_cache_data_source.dart';
import 'features/data/datasources/remote/clients/moneda_remote_client.dart';
import 'features/data/datasources/remote/moneda_remote_data_source.dart';
import 'features/domain/repositories/moneda_repository.dart';
import 'features/data/repositories/moneda_repository_impl.dart';
import 'core/network/network_info.dart';
import 'features/data/datasources/cache/obra_cache_data_source.dart';
import 'features/data/datasources/remote/clients/obra_remote_client.dart';
import 'features/data/datasources/remote/obra_remote_data_source.dart';
import 'features/domain/repositories/obra_repository.dart';
import 'features/data/repositories/obra_repository_impl.dart';
import 'features/data/datasources/cache/pago_cache_data_source.dart';
import 'features/data/datasources/remote/clients/pago_remote_client.dart';
import 'features/data/datasources/remote/pago_remote_data_source.dart';
import 'features/domain/repositories/pago_repository.dart';
import 'features/data/repositories/pago_repository_impl.dart';
import 'features/data/datasources/cache/pais_cache_data_source.dart';
import 'features/data/datasources/remote/clients/pais_remote_client.dart';
import 'features/data/datasources/remote/pais_remote_data_source.dart';
import 'features/domain/repositories/pais_repository.dart';
import 'features/data/repositories/pais_repository_impl.dart';
import 'features/data/datasources/cache/persona_cache_data_source.dart';
import 'features/data/datasources/remote/clients/persona_remote_client.dart';
import 'features/data/datasources/remote/persona_remote_data_source.dart';
import 'features/domain/repositories/persona_repository.dart';
import 'features/data/repositories/persona_repository_impl.dart';
import 'injection.dart';
import 'features/domain/business/security_service.dart';
import 'features/data/datasources/cache/subscripcion_cache_data_source.dart';
import 'features/data/datasources/remote/clients/subscripcion_remote_client.dart';
import 'features/data/datasources/remote/subscripcion_remote_data_source.dart';
import 'features/domain/repositories/subscripcion_repository.dart';
import 'features/data/repositories/subscripcion_repository_impl.dart';
import 'features/data/datasources/cache/tipo_de_obra_cache_data_source.dart';
import 'features/data/datasources/remote/clients/tipo_de_obra_remote_client.dart';
import 'features/data/datasources/remote/tipo_de_obra_remote_data_source.dart';
import 'features/domain/repositories/tipo_de_obra_repository.dart';
import 'features/data/repositories/tipo_de_obra_repository_impl.dart';
import 'features/data/datasources/cache/usuario_cache_data_source.dart';
import 'features/data/datasources/remote/clients/usuario_remote_client.dart';
import 'features/data/datasources/remote/usuario_remote_data_source.dart';
import 'features/domain/repositories/usuario_repository.dart';
import 'features/data/repositories/usuario_repository_impl.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerExternalModules = _$RegisterExternalModules();
  gh.factory<AuthorizationRemoteDataSource>(
      () => AuthorizationRemoteDataSourceImpl());
  gh.factory<DataConnectionChecker>(
      () => registerExternalModules.dataConnectionChecker);
  gh.factory<Dio>(() => registerExternalModules.dio);
  gh.factory<EtiquetaRemoteClient>(() => EtiquetaRemoteClient(get<Dio>()));
  gh.factory<FuncionRemoteClient>(() => FuncionRemoteClient(get<Dio>()));
  gh.factory<MensajeRemoteClient>(() => MensajeRemoteClient(get<Dio>()));
  gh.factory<MonedaRemoteClient>(() => MonedaRemoteClient(get<Dio>()));
  gh.factory<NetworkInfo>(() => NetworkInfoImpl(get<DataConnectionChecker>()));
  gh.factory<ObraRemoteClient>(() => ObraRemoteClient(get<Dio>()));
  gh.factory<PagoRemoteClient>(() => PagoRemoteClient(get<Dio>()));
  gh.factory<PaisRemoteClient>(() => PaisRemoteClient(get<Dio>()));
  gh.factory<PersonaRemoteClient>(() => PersonaRemoteClient(get<Dio>()));
  final sharedPreferences = await registerExternalModules.sharedPreferences;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.factory<SubscripcionCacheDataSource>(() => SubscripcionCacheDataSourceImpl(
      sharedPreferences: get<SharedPreferences>()));
  gh.factory<SubscripcionRemoteClient>(
      () => SubscripcionRemoteClient(get<Dio>()));
  gh.factory<TipoDeObraCacheDataSource>(() => TipoDeObraCacheDataSourceImpl(
      sharedPreferences: get<SharedPreferences>()));
  gh.factory<TipoDeObraRemoteClient>(() => TipoDeObraRemoteClient(get<Dio>()));
  gh.factory<UsuarioCacheDataSource>(() =>
      UsuarioCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<UsuarioRemoteClient>(() => UsuarioRemoteClient(get<Dio>()));
  gh.factory<AuthorizationCacheDataSource>(() =>
      AuthorizationCacheDataSourceImpl(
          sharedPreferences: get<SharedPreferences>()));
  gh.factory<AuthorizationRepository>(() => AuthorizationRepositoryImpl(
      get<AuthorizationCacheDataSource>(),
      get<AuthorizationRemoteDataSource>()));
  gh.factory<CuentaCacheDataSource>(() =>
      CuentaCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<CuentaRemoteClient>(() => CuentaRemoteClient(get<Dio>()));
  gh.factory<CuentaRemoteDataSource>(() => CuentaRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      cuentaRemoteClient: get<CuentaRemoteClient>()));
  gh.factory<CuentaRepository>(() => CuentaRepositoryImpl(
      remoteDataSource: get<CuentaRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  gh.factory<EtiquetaCacheDataSource>(() =>
      EtiquetaCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<EtiquetaRemoteDataSource>(() => EtiquetaRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      etiquetaRemoteClient: get<EtiquetaRemoteClient>()));
  gh.factory<EtiquetaRepository>(() => EtiquetaRepositoryImpl(
      remoteDataSource: get<EtiquetaRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  gh.factory<FuncionCacheDataSource>(() =>
      FuncionCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<FuncionRemoteDataSource>(() => FuncionRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      funcionRemoteClient: get<FuncionRemoteClient>()));
  gh.factory<FuncionRepository>(() => FuncionRepositoryImpl(
        remoteDataSource: get<FuncionRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
        daoProvider: get<DaoProvider>(),
      ));
  gh.factory<GetCuentasService>(
      () => GetCuentasService(get<CuentaRepository>()));
  gh.factory<GetFuncionesService>(
      () => GetFuncionesService(get<FuncionRepository>()));
  gh.factory<LoginManualService>(
      () => LoginManualService(get<AuthorizationRepository>()));
  gh.factory<MensajeCacheDataSource>(() =>
      MensajeCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<MensajeRemoteDataSource>(() => MensajeRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      mensajeRemoteClient: get<MensajeRemoteClient>()));
  gh.factory<MensajeRepository>(() => MensajeRepositoryImpl(
      remoteDataSource: get<MensajeRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  gh.factory<MonedaCacheDataSource>(() =>
      MonedaCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<MonedaRemoteDataSource>(() => MonedaRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      monedaRemoteClient: get<MonedaRemoteClient>()));
  gh.factory<MonedaRepository>(() => MonedaRepositoryImpl(
      remoteDataSource: get<MonedaRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  gh.factory<ObraCacheDataSource>(() =>
      ObraCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<ObraRemoteDataSource>(() => ObraRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      obraRemoteClient: get<ObraRemoteClient>()));
  gh.factory<ObraRepository>(() => ObraRepositoryImpl(
        remoteDataSource: get<ObraRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
        daoProvider: get<DaoProvider>(),
      ));
  gh.factory<PagoCacheDataSource>(() =>
      PagoCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<PagoRemoteDataSource>(() => PagoRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      pagoRemoteClient: get<PagoRemoteClient>()));
  gh.factory<PagoRepository>(() => PagoRepositoryImpl(
      remoteDataSource: get<PagoRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  gh.factory<PaisCacheDataSource>(() =>
      PaisCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<PaisRemoteDataSource>(() => PaisRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      paisRemoteClient: get<PaisRemoteClient>()));
  gh.factory<PaisRepository>(() => PaisRepositoryImpl(
        remoteDataSource: get<PaisRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
        daoProvider: get<DaoProvider>(),
      ));
  gh.factory<PersonaCacheDataSource>(() =>
      PersonaCacheDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.factory<PersonaRemoteDataSource>(() => PersonaRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      personaRemoteClient: get<PersonaRemoteClient>()));
  gh.factory<PersonaRepository>(() => PersonaRepositoryImpl(
        remoteDataSource: get<PersonaRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
        daoProvider: get<DaoProvider>(),
      ));
  gh.factory<SecurityService>(
      () => SecurityService(get<AuthorizationRepository>()));
  gh.factory<SubscripcionRemoteDataSource>(() =>
      SubscripcionRemoteDataSourceImpl(
          authorizationRepository: get<AuthorizationRepository>(),
          subscripcionRemoteClient: get<SubscripcionRemoteClient>()));
  gh.factory<SubscripcionRepository>(() => SubscripcionRepositoryImpl(
      remoteDataSource: get<SubscripcionRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  gh.factory<TipoDeObraRemoteDataSource>(() => TipoDeObraRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      tipoDeObraRemoteClient: get<TipoDeObraRemoteClient>()));
  gh.factory<TipoDeObraRepository>(() => TipoDeObraRepositoryImpl(
      remoteDataSource: get<TipoDeObraRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  gh.factory<UsuarioRemoteDataSource>(() => UsuarioRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>(),
      usuarioRemoteClient: get<UsuarioRemoteClient>()));
  gh.factory<AccountRemoteDataSource>(() => AccountRemoteDataSourceImpl(
      authorizationRepository: get<AuthorizationRepository>()));
  gh.factory<CreatePagoService>(() => CreatePagoService(get<PagoRepository>()));
  gh.factory<CreatePersonaService>(
      () => CreatePersonaService(get<PersonaRepository>()));
  gh.factory<CreateSubscripcionService>(
      () => CreateSubscripcionService(get<SubscripcionRepository>()));
  gh.factory<GetCurrentPersonaService>(() => GetCurrentPersonaService(
      get<PersonaRepository>(), get<AuthorizationRepository>()));
  gh.factory<GetObraByIdService>(
      () => GetObraByIdService(get<ObraRepository>()));
  gh.factory<GetObrasService>(() => GetObrasService(get<ObraRepository>()));
  gh.factory<GetPaisService>(() => GetPaisService(get<PaisRepository>()));
  gh.factory<GetPaisesService>(() => GetPaisesService(get<PaisRepository>()));
  gh.factory<GetSubscripcionesService>(
      () => GetSubscripcionesService(get<SubscripcionRepository>()));
  gh.factory<UsuarioRepository>(() => UsuarioRepositoryImpl(
        accountRemoteDataSource: get<AccountRemoteDataSource>(),
        remoteDataSource: get<UsuarioRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
        daoProvider: get<DaoProvider>(),
      ));
  gh.factory<ChangeUserAccountPasswordService>(
      () => ChangeUserAccountPasswordService(get<UsuarioRepository>()));
  gh.factory<CreateUsuarioService>(() => CreateUsuarioService(
      get<UsuarioRepository>(), get<AuthorizationRepository>()));
  gh.factory<GetCurrentUsuarioService>(() => GetCurrentUsuarioService(
      get<UsuarioRepository>(), get<AuthorizationRepository>()));
  gh.factory<GetUsuarioService>(
      () => GetUsuarioService(get<UsuarioRepository>()));

  // Eager singletons must be registered in the right order
  gh.singleton<DaoProvider>(DaoProvider());
  return get;
}

class _$RegisterExternalModules extends RegisterExternalModules {}
