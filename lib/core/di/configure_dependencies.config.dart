// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/details/data/datasources/details_remote_data_source.dart'
    as _i35;
import '../../features/details/data/repositories/details_repository_data.dart'
    as _i10;
import '../../features/details/domain/repositories/details_repository_domain.dart'
    as _i684;
import '../../features/details/domain/use_cases/details_use_case.dart' as _i70;
import '../../features/details/presentation/cubit/details_cubit.dart' as _i347;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i362;
import '../../features/home/data/repositories/home_repository_data.dart'
    as _i145;
import '../../features/home/domain/repositories/home_repository_domain.dart'
    as _i257;
import '../../features/home/domain/use_cases/home_use_case.dart' as _i933;
import '../network/dio_client.dart' as _i667;
import '../services/local_keys_service.dart' as _i945;
import 'third_part.dart' as _i423;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyConfig = _$ThirdPartyConfig();
    gh.lazySingleton<_i792.GetStorage>(() => thirdPartyConfig.storage);
    gh.lazySingleton<_i454.SupabaseClient>(
      () => thirdPartyConfig.supabaseClient,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => thirdPartyConfig.flutterSecureStorage,
    );
    gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
    gh.lazySingleton<_i35.BaseDetailsRemoteDataSource>(
      () => _i35.DetailsRemoteDataSource(),
    );
    gh.lazySingleton<_i362.BaseHomeRemoteDataSource>(
      () => _i362.HomeRemoteDataSource(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i684.DetailsRepositoryDomain>(
      () => _i10.DetailsRepositoryData(gh<_i35.BaseDetailsRemoteDataSource>()),
    );
    gh.lazySingleton<_i257.HomeRepositoryDomain>(
      () => _i145.HomeRepositoryData(gh<_i362.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i70.DetailsUseCase>(
      () => _i70.DetailsUseCase(gh<_i684.DetailsRepositoryDomain>()),
    );
    gh.lazySingleton<_i933.HomeIdentifyPlantUseCase>(
      () => _i933.HomeIdentifyPlantUseCase(gh<_i257.HomeRepositoryDomain>()),
    );
    gh.lazySingleton<_i933.HomeGetPlantDetailsUseCase>(
      () => _i933.HomeGetPlantDetailsUseCase(gh<_i257.HomeRepositoryDomain>()),
    );
    gh.factory<_i347.DetailsCubit>(
      () => _i347.DetailsCubit(gh<_i70.DetailsUseCase>()),
    );
    gh.singleton<_i945.LocalKeysService>(() => _i945.LocalKeysService());
    return this;
  }
}

class _$ThirdPartyConfig extends _i423.ThirdPartyConfig {}
