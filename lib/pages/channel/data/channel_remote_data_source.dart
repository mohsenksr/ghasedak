import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/data/base_rest_data_source.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/pages/channel/data/models/post.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChannelRemoteDataSource extends RestDataSource {
  Future<Either<Alert, List<Post>>> getChannelPosts(int channelId) async {
    try {
      final response = await get('/channel/content/get/$channelId/',
          withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        List<Post> posts =
            response["posts"].map<Post>((e) => Post.fromJson(e)).toList();
        return Right(posts);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, bool>> buyContent(int contentId) async {
    try {
      final response = await get('/channel/subscription/sell/$contentId/',
          withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        return Right(true);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, String>> getContentFile(
      int contentId, PostType type) async {
    try {
      final response = await get('/channel/content/get-file/$contentId/',
          withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        return Right(response[type.stringMode]);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, int>> AddContent(
      int channelId, PostType type, int price, String summary) async {
    try {
      final body = {
        "type": type.stringMode,
        "price": price,
        "summary": summary,
      };
      final response = await post('/channel-admin/content/add/$channelId/',
          body: body, withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 201) {
        return Right(response["id"]);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, bool>> AddContentText(int contentId, String text) async {
    try {
      final body = {"text": text};
      final response = await post('/channel-admin/content/add-file/$contentId/',
          body: body, withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        return Right(true);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
