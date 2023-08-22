import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/custom_cubit.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/main/domain/repository/main_repository.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:ghasedak/pages/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@singleton
class ProfileCubit extends CustomCubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(ProfileInitialState());

  getProfile() async {
    emit(ProfileLoadingState());

    failureOrSuccess<Profile>(await repository.getProfile(), (profile) {
      emit(ProfileShowState(profile));
    }, (failure) {
      emit(ProfileErrorState());
    });
  }

  updateProfile(
    String firstName,
    String lastName,
    String email,
    String ccNumber,
    String nationalId,
  ) async {
    emit(ProfileLoadingState());

    failureOrSuccess<bool>(
        await repository.updateProfile(
          firstName,
          lastName,
          email,
          ccNumber,
          nationalId,
        ), (success) {
      getProfile();
    }, (failure) {
      emit(ProfileErrorState());
    });
  }
}
