import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/data/base_rest_data_source.dart';
import 'package:ghasedak/core/errors/failures.dart';
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
      final body = {
        'phone': phone,
        'code': code
      };
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
      final body = {
        "username": username,
        "password": password
      };
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
