import 'package:dartz/dartz.dart';
import 'package:ghasedak/core/domain/repository/base_repository.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:ghasedak/pages/profile/data/profile_local_data_source.dart';
import 'package:ghasedak/pages/profile/data/profile_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfileRepository
    extends Repository<ProfileLocalDataSource, ProfileRemoteDataSource> {
  ProfileRepository(ProfileLocalDataSource localDataSource,
      ProfileRemoteDataSource remoteDataSource)
      : super(localDataSource, remoteDataSource);

  Future<Either<Alert, bool>> updateProfile(
    String firstName,
    String lastName,
    String email,
    String ccNumber,
    String nationalId,
  ) async {
    return remoteDataSource!.updateProfile(
      firstName,
      lastName,
      email,
      ccNumber,
      nationalId,
    );
  }

  Future<Either<Alert, Profile>> getProfile() async {
    return remoteDataSource!.getProfile();
  }
}
