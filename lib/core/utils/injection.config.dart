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

import '../../pages/channel/data/channel_local_data_source.dart' as _i7;
import '../../pages/channel/data/channel_remote_data_source.dart' as _i8;
import '../../pages/channel/domain/channel_cubit.dart' as _i18;
import '../../pages/channel/domain/repositories/channel_repository.dart' as _i9;
import '../../pages/channel_info/data/channel_info_local_data_source.dart'
    as _i4;
import '../../pages/channel_info/data/channel_info_remote_data_source.dart'
    as _i5;
import '../../pages/channel_info/domain/channel_info_cubit.dart' as _i19;
import '../../pages/channel_info/domain/repositories/channel_info_repository.dart'
    as _i6;
import '../../pages/main/data/main_local_data_source.dart' as _i12;
import '../../pages/main/data/main_remote_data_source.dart' as _i13;
import '../../pages/main/domain/main_cubit.dart' as _i20;
import '../../pages/main/domain/repository/main_repository.dart' as _i14;
import '../../pages/profile/data/profile_local_data_source.dart' as _i15;
import '../../pages/profile/data/profile_remote_data_source.dart' as _i16;
import '../../pages/profile/domain/profile_cubit.dart' as _i21;
import '../../pages/profile/domain/repositories/profile_repository.dart'
    as _i17;
import '../domain/data/base_local_data_source.dart' as _i10;
import 'alert_handler/alert_handler_cubit.dart' as _i3;
import 'log_util.dart' as _i11;

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
  gh.factory<_i10.LocalDataSource>(() => _i10.LocalDataSource());
  gh.singleton<_i3.AlertHandlerCubit>(_i3.AlertHandlerCubit());
  gh.singleton<_i4.ChannelInfoLocalDataSource>(
      _i4.ChannelInfoLocalDataSource());
  gh.factory<_i5.ChannelInfoRemoteDataSource>(
      () => _i5.ChannelInfoRemoteDataSource());
  gh.singleton<_i6.ChannelInfoRepository>(_i6.ChannelInfoRepository(
    gh<_i4.ChannelInfoLocalDataSource>(),
    gh<_i5.ChannelInfoRemoteDataSource>(),
  ));
  gh.singleton<_i7.ChannelLocalDataSource>(_i7.ChannelLocalDataSource());
  gh.factory<_i8.ChannelRemoteDataSource>(() => _i8.ChannelRemoteDataSource());
  gh.singleton<_i9.ChannelRepository>(_i9.ChannelRepository(
    gh<_i7.ChannelLocalDataSource>(),
    gh<_i8.ChannelRemoteDataSource>(),
  ));
  gh.singleton<_i11.Logger>(_i11.Logger());
  gh.singleton<_i12.MainLocalDataSource>(_i12.MainLocalDataSource());
  gh.factory<_i13.MainRemoteDataSource>(() => _i13.MainRemoteDataSource());
  gh.singleton<_i14.MainRepository>(_i14.MainRepository(
    gh<_i12.MainLocalDataSource>(),
    gh<_i13.MainRemoteDataSource>(),
  ));
  gh.singleton<_i15.ProfileLocalDataSource>(_i15.ProfileLocalDataSource());
  gh.factory<_i16.ProfileRemoteDataSource>(
      () => _i16.ProfileRemoteDataSource());
  gh.singleton<_i17.ProfileRepository>(_i17.ProfileRepository(
    gh<_i15.ProfileLocalDataSource>(),
    gh<_i16.ProfileRemoteDataSource>(),
  ));
  gh.factory<_i18.ChannelCubit>(
      () => _i18.ChannelCubit(gh<_i9.ChannelRepository>()));
  gh.factory<_i19.ChannelInfoCubit>(
      () => _i19.ChannelInfoCubit(gh<_i6.ChannelInfoRepository>()));
  gh.singleton<_i20.MainCubit>(_i20.MainCubit(gh<_i14.MainRepository>()));
  gh.singleton<_i21.ProfileCubit>(
      _i21.ProfileCubit(gh<_i17.ProfileRepository>()));
  return getIt;
}
