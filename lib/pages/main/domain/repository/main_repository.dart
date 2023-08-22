import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/repository/base_repository.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/pages/main/data/main_local_data_source.dart';
import 'package:ghasedak/pages/main/data/main_remote_data_source.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:injectable/injectable.dart';

@singleton
class MainRepository
    extends Repository<MainLocalDataSource, MainRemoteDataSource> {
  MainRepository(MainLocalDataSource localDataSource,
      MainRemoteDataSource remoteDataSource)
      : super(localDataSource, remoteDataSource);

  Future<Either<Alert, bool>> sendRegisterationPhone(String phone) async {
    return remoteDataSource!.sendRegisterationPhone(phone);
  }

  Future<Either<Alert, String>> sendRegisterationCode(
      String phone, String code) async {
    return remoteDataSource!.sendRegisterationCode(phone, code);
  }

  Future<Either<Alert, Map<String, List<Channel>>>> getChannels() async {
    return remoteDataSource!.getChannels();
  }

  Future<Either<Alert, bool>> createChannel(String title, String id, String bio) async {
    return remoteDataSource!.createChannel(title, id, bio);
  }

  Future<Either<Alert, bool>> joinChannel(String id) async {
    return remoteDataSource!.joinChannel(id);
  }

  Future<Either<Alert, bool>> register(String token, String firstName,
      String lastName, String username, String email, String password) async {
    return remoteDataSource!
        .register(token, firstName, lastName, username, email, password);
  }

  Future<Either<Alert, String>> login(String username, String password) async {
    return remoteDataSource!.login(username, password);
  }

  Future<void> setGlobalAuthToken(String token) {
    return localDataSource.setToken(token);
  }

  Future<String?> getGlobalAuthToken() {
    return localDataSource.getToken();
  }

}
