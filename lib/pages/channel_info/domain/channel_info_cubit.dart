import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/custom_cubit.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_description.dart';
import 'package:ghasedak/pages/channel_info/domain/repositories/channel_info_repository.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/main/domain/repository/main_repository.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:ghasedak/pages/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

part 'channel_info_state.dart';

@singleton
class ChannelInfoCubit extends CustomCubit<ChannelInfoState> {
  final ChannelInfoRepository repository;

  ChannelInfoCubit(this.repository) : super(ChannelInfoInitialState());

  getDescription(int channelId, bool isAdmin) async {
    emit(ChannelInfoLoadingState());

    failureOrSuccess<ChannelDescription>(
        await repository.getDescription(channelId), (description) {
      if (isAdmin) {
        getAdminData(description);
      } else {
        emit(ChannelInfoShowState(description));
      }
    }, (failure) {
      emit(ChannelInfoErrorState());
    });
  }

  getAdminData(ChannelDescription channelDescription) async {
    failureOrSuccess<Map<String, dynamic>>(
        await repository.getAdminData(channelDescription.id), (adminData) {
      emit(ChannelInfoShowState(channelDescription, adminData: adminData));
    }, (failure) {
      emit(ChannelInfoErrorState());
    });
  }
}
