import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/data/base_rest_data_source.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileRemoteDataSource extends RestDataSource {
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

  Future<Either<Alert, Profile>> getProfile() async {
    try {
      final response = await get('account/profile/',
          withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        final profile = Profile.fromJson(response);
        return Right(profile);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
