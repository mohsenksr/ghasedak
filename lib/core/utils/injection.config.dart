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

import '../../pages/channel_info/data/channel_info_local_data_source.dart'
    as _i4;
import '../../pages/channel_info/data/channel_info_remote_data_source.dart'
    as _i5;
import '../../pages/channel_info/domain/channel_info_cubit.dart' as _i15;
import '../../pages/channel_info/domain/repositories/channel_info_repository.dart'
    as _i6;
import '../../pages/main/data/main_local_data_source.dart' as _i9;
import '../../pages/main/data/main_remote_data_source.dart' as _i10;
import '../../pages/main/domain/main_cubit.dart' as _i16;
import '../../pages/main/domain/repository/main_repository.dart' as _i11;
import '../../pages/profile/data/profile_local_data_source.dart' as _i12;
import '../../pages/profile/data/profile_remote_data_source.dart' as _i13;
import '../../pages/profile/domain/profile_cubit.dart' as _i17;
import '../../pages/profile/domain/repositories/profile_repository.dart'
    as _i14;
import '../domain/data/base_local_data_source.dart' as _i7;
import 'alert_handler/alert_handler_cubit.dart' as _i3;
import 'log_util.dart' as _i8;

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
  gh.factory<_i7.LocalDataSource>(() => _i7.LocalDataSource());

  gh.singleton<_i3.AlertHandlerCubit>(_i3.AlertHandlerCubit());
  gh.singleton<_i4.ChannelInfoLocalDataSource>(
      _i4.ChannelInfoLocalDataSource());
  gh.factory<_i5.ChannelInfoRemoteDataSource>(
      () => _i5.ChannelInfoRemoteDataSource());
  gh.singleton<_i6.ChannelInfoRepository>(_i6.ChannelInfoRepository(
    gh<_i4.ChannelInfoLocalDataSource>(),
    gh<_i5.ChannelInfoRemoteDataSource>(),
  ));
  gh.singleton<_i8.Logger>(_i8.Logger());
  gh.singleton<_i9.MainLocalDataSource>(_i9.MainLocalDataSource());
  gh.factory<_i10.MainRemoteDataSource>(() => _i10.MainRemoteDataSource());
  gh.singleton<_i11.MainRepository>(_i11.MainRepository(
    gh<_i9.MainLocalDataSource>(),
    gh<_i10.MainRemoteDataSource>(),
  ));
  gh.singleton<_i12.ProfileLocalDataSource>(_i12.ProfileLocalDataSource());
  gh.factory<_i13.ProfileRemoteDataSource>(
      () => _i13.ProfileRemoteDataSource());
  gh.singleton<_i14.ProfileRepository>(_i14.ProfileRepository(
    gh<_i12.ProfileLocalDataSource>(),
    gh<_i13.ProfileRemoteDataSource>(),
  ));
  gh.singleton<_i15.ChannelInfoCubit>(
      _i15.ChannelInfoCubit(gh<_i6.ChannelInfoRepository>()));
  gh.singleton<_i16.MainCubit>(_i16.MainCubit(gh<_i11.MainRepository>()));
  gh.singleton<_i17.ProfileCubit>(
      _i17.ProfileCubit(gh<_i14.ProfileRepository>()));
  return getIt;
}
