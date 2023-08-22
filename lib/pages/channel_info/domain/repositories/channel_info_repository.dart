import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/repository/base_repository.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/pages/channel_info/data/channel_info_local_data_source.dart';
import 'package:ghasedak/pages/channel_info/data/channel_info_remote_data_source.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_description.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChannelInfoRepository extends Repository<ChannelInfoLocalDataSource,
    ChannelInfoRemoteDataSource> {
  ChannelInfoRepository(ChannelInfoLocalDataSource localDataSource,
      ChannelInfoRemoteDataSource remoteDataSource)
      : super(localDataSource, remoteDataSource);

  Future<Either<Alert, ChannelDescription>> getDescription(int id) async {
    return remoteDataSource!.getDescription(id);
  }

  Future<Either<Alert, Map<String, dynamic>>> getAdminData(int id) async {
    return remoteDataSource!.getAdminData(id);
  }
}
