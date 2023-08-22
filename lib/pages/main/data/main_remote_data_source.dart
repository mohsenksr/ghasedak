import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/data/base_rest_data_source.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainRemoteDataSource extends RestDataSource {
  Future<Either<Alert, bool>> sendRegisterationPhone(String phone) async {
    try {
      final response = await get('account/auth/send-code/$phone/',
          withToken: false, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        return Right(true);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, String>> sendRegisterationCode(
      String phone, String code) async {
    try {
      final body = {'phone': phone, 'code': code};
      final response = await post(
          body: body,
          'account/auth/verify-code/',
          withToken: false,
          autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        final signUpToken = response['signup_token'];
        return Right(signUpToken);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, Map<String, List<Channel>>>> getChannels() async {
    try {
      final response = await get('channel/',
          withToken: true, autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        for (final owner_channel in response["owner"]) {
          owner_channel["mode"] = "OWNER";
        }
        for (final admin_channel in response["admin"]) {
          admin_channel["mode"] = "ADMIN";
        }
        for (final member_channel in response["member"]) {
          member_channel["mode"] = "MEMBER";
        }

        Map<String, List<Channel>> data = {};

        data["owner"] =
            response["owner"].map<Channel>((e) => Channel.fromJson(e)).toList();
        data["admin"] =
            response["admin"].map<Channel>((e) => Channel.fromJson(e)).toList();
        data["member"] = response["member"]
            .map<Channel>((e) => Channel.fromJson(e))
            .toList();

        return Right(data);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, bool>> createChannel(
      String title, String id, String bio) async {
    try {
      final body = {'title': title, 'bio': bio, 'channel_id': id};
      final response = await post(
          body: body,
          'channel/create/',
          withToken: true,
          autoHandleWithStatusCode: false);

      if (response['code'] == 201) {
        return Right(true);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, bool>> joinChannel(String id) async {
    try {
      final response = await get(
          'channel/join/${id}/',
          withToken: true,
          autoHandleWithStatusCode: false);

      if (response['code'] == 201) {
        return Right(true);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, bool>> register(String token, String firstName,
      String lastName, String username, String email, String password) async {
    try {
      final body = {
        "token": token,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "password": password,
        "role": "CUSTOMER"
      };
      final response = await post(
          body: body,
          'account/auth/signup/',
          withToken: false,
          autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        return Right(true);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  Future<Either<Alert, String>> login(String username, String password) async {
    try {
      final body = {"username": username, "password": password};
      final response = await post(
          body: body,
          'account/auth/signin/',
          withToken: false,
          autoHandleWithStatusCode: false);

      if (response['code'] == 200) {
        String token = response["access"];
        return Right(token);
      }
      return Left(FetchDataFailure('مشکلی پیش آمده‌است.'));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
