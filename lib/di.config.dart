// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

import 'Data/Repositories/AuthRepositories/auth_repo.dart' as _i933;
import 'Data/Repositories/AuthRepositories/auth_repo_impl.dart' as _i890;
import 'Data/Repositories/AuthRepositories/Data%20Sources/auth-remote_data_source.dart'
    as _i918;
import 'Data/Repositories/AuthRepositories/Data%20Sources/auth_remote_data_source_impl.dart'
    as _i967;
import 'third_party_packaeg_module.dart' as _i520;
import 'UI/Screens/Auth/Login/cubit/login_view_model.dart' as _i62;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyPackagesModule = _$ThirdPartyPackagesModule();
    gh.factory<_i161.InternetConnectionCheckerPlus>(
        () => thirdPartyPackagesModule.provideInternetConnection());
    gh.factory<_i918.AuthRemoteDataSource>(
        () => _i967.AuthRemoteDataSourceImpl());
    gh.factory<_i933.AuthRepository>(() => _i890.AuthRepositoryImpl(
          gh<_i161.InternetConnectionCheckerPlus>(),
          gh<_i918.AuthRemoteDataSource>(),
        ));
    gh.factory<_i62.LoginViewModel>(
        () => _i62.LoginViewModel(gh<_i933.AuthRepository>()));
    return this;
  }
}

class _$ThirdPartyPackagesModule extends _i520.ThirdPartyPackagesModule {}
