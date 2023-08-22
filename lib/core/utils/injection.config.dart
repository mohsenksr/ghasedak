// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../pages/main/data/main_local_data_source.dart' as _i6;
import '../../pages/main/data/main_remote_data_source.dart' as _i7;
import '../../pages/main/domain/main_cubit.dart' as _i12;
import '../../pages/main/domain/repository/main_repository.dart' as _i8;
import '../../pages/profile/data/profile_local_data_source.dart' as _i9;
import '../../pages/profile/data/profile_remote_data_source.dart' as _i10;
import '../../pages/profile/domain/profile_cubit.dart' as _i13;
import '../../pages/profile/domain/repositories/profile_repository.dart'
    as _i11;
import '../domain/data/base_local_data_source.dart' as _i4;
import 'alert_handler/alert_handler_cubit.dart' as _i3;
import 'log_util.dart' as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AlertHandlerCubit>(_i3.AlertHandlerCubit());
  gh.factory<_i4.LocalDataSource>(() => _i4.LocalDataSource());
  gh.singleton<_i5.Logger>(_i5.Logger());
  gh.singleton<_i6.MainLocalDataSource>(_i6.MainLocalDataSource());
  gh.factory<_i7.MainRemoteDataSource>(() => _i7.MainRemoteDataSource());
  gh.singleton<_i8.MainRepository>(_i8.MainRepository(
    gh<_i6.MainLocalDataSource>(),
    gh<_i7.MainRemoteDataSource>(),
  ));
  gh.singleton<_i9.ProfileLocalDataSource>(_i9.ProfileLocalDataSource());
  gh.factory<_i10.ProfileRemoteDataSource>(
      () => _i10.ProfileRemoteDataSource());
  gh.singleton<_i11.ProfileRepository>(_i11.ProfileRepository(
    gh<_i9.ProfileLocalDataSource>(),
    gh<_i10.ProfileRemoteDataSource>(),
  ));
  gh.singleton<_i12.MainCubit>(_i12.MainCubit(gh<_i8.MainRepository>()));
  gh.singleton<_i13.ProfileCubit>(
      _i13.ProfileCubit(gh<_i11.ProfileRepository>()));
  return getIt;
}
