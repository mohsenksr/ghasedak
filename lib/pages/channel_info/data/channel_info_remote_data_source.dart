import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/data/base_rest_data_source.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_admin.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_description.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_member.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_subscription.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChannelInfoRemoteDataSource extends RestDataSource {
  Future<Either<Alert, bool>> updateProfile(
    String firstName,
    String lastName,
    String email,
    String ccNumber,
    String nationalId,
  ) async {
    try {
      final body = {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'cc_number': ccNumber,
        'national_id': nationalId
      };

      final response = await post(
          body: body,
          'account/profile/',
          withToken: true,
          autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        return Right(true);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, ChannelDescription>> getDescription(int id) async {
    try {
      final response = await get('/channel/description/$id/',
          withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        final profile = ChannelDescription.fromJson(response);
        return Right(profile);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, Map<String, dynamic>>> getAdminData(int id) async {
    try {
      final response = await get('/channel-admin/data/$id/',
          withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        Map<String, dynamic> data = {};
        data["subscriptions"] = response["subscriptions"]
            .map<Subscription>((e) => Subscription.fromJson(e))
            .toList();
        data["admins"] =
            response["admins"].map<Admin>((e) => Admin.fromJson(e)).toList();
        data["members"] =
            response["members"].map<Member>((e) => Member.fromJson(e)).toList();
        return Right(data);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
