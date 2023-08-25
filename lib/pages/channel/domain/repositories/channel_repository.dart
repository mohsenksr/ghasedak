import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/repository/base_repository.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/pages/channel/data/channel_local_data_source.dart';
import 'package:ghasedak/pages/channel/data/channel_remote_data_source.dart';
import 'package:ghasedak/pages/channel/data/models/post.dart';
import 'package:ghasedak/pages/channel_info/data/channel_info_local_data_source.dart';
import 'package:ghasedak/pages/channel_info/data/channel_info_remote_data_source.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_description.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_subscription.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChannelRepository
    extends Repository<ChannelLocalDataSource, ChannelRemoteDataSource> {
  ChannelRepository(ChannelLocalDataSource localDataSource,
      ChannelRemoteDataSource remoteDataSource)
      : super(localDataSource, remoteDataSource);

  Future<Either<Alert, List<Post>>> getChannelPosts(int channelId) async {
    return remoteDataSource!.getChannelPosts(channelId);
  }

  Future<Either<Alert, bool>> buyContent(int contentId) async {
    return remoteDataSource!.buyContent(contentId);
  }

  Future<Either<Alert, String>> getContentFile(
      int contentId, PostType type) async {
    return remoteDataSource!.getContentFile(contentId, type);
  }

  Future<Either<Alert, int>> AddContent(
      int channelId, PostType type, int price, String summary) async {
    return remoteDataSource!.AddContent(channelId, type, price, summary);
  }

  Future<Either<Alert, bool>> AddContentText(int contentId, String text) async {
    return remoteDataSource!.AddContentText(contentId, text);
  }
}
