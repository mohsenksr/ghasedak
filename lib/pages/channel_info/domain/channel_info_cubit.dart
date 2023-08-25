import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/custom_cubit.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_description.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_subscription.dart';
import 'package:ghasedak/pages/channel_info/domain/repositories/channel_info_repository.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/main/domain/repository/main_repository.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:ghasedak/pages/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

part 'channel_info_state.dart';

@injectable
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
        getSubscriptions(description);
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

  getSubscriptions(ChannelDescription channelDescription) async {
    failureOrSuccess<List<Subscription>>(
        await repository.getSubscriptions(channelDescription.id),
        (subscriptions) {
      emit(ChannelInfoShowState(channelDescription,
          subscriptions: subscriptions));
    }, (failure) {
      emit(ChannelInfoErrorState());
    });
  }

  buySubscription(int subscriptionId) async {
    failureOrSuccess<bool>(
        await repository.buySubscription(subscriptionId), (success) {},
        (failure) {
      emit(ChannelInfoErrorState());
    });
  }

  createAdmin(int channelId, String username, int percent) async {
    emit(ChannelInfoLoadingState());

    failureOrSuccess<bool>(
        await repository.createAdmin(channelId, username, percent), (bool) {
      getDescription(channelId, true);
    }, (failure) {
      emit(ChannelInfoErrorState());
    });
  }

  createSubscription(
      int channelId, int price, SubscriptionDuration duration) async {
    emit(ChannelInfoLoadingState());

    failureOrSuccess<bool>(
        await repository.createSubscription(channelId, price, duration),
        (bool) {
      getDescription(channelId, true);
    }, (failure) {
      emit(ChannelInfoErrorState());
    });
  }
}
