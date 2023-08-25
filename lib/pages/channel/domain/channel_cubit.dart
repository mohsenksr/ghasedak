import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/custom_cubit.dart';
import 'package:ghasedak/pages/channel/data/models/post.dart';
import 'package:ghasedak/pages/channel/domain/repositories/channel_repository.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_description.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_subscription.dart';
import 'package:ghasedak/pages/channel_info/domain/repositories/channel_info_repository.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/main/domain/repository/main_repository.dart';
import 'package:ghasedak/pages/profile/data/models/profile.dart';
import 'package:ghasedak/pages/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';

part 'channel_state.dart';

@injectable
class ChannelCubit extends CustomCubit<ChannelState> {
  final ChannelRepository repository;

  ChannelCubit(this.repository) : super(ChannelInitialState());

  getChannelPosts(int channelId) async {
    emit(ChannelLoadingState());

    failureOrSuccess<List<Post>>(await repository.getChannelPosts(channelId),
        (posts) {
      emit(ChannelShowState(posts));
    }, (failure) {
      emit(ChannelErrorState());
    });
  }

  buyContent(int contentId) async {
    failureOrSuccess<bool>(await repository.buyContent(contentId), (success) {},
        (failure) {
      emit(ChannelErrorState());
    });
  }

  getContentFile(int contentId, PostType type) async {
    ChannelShowState lastState = state as ChannelShowState;
    emit(ChannelLoadingState());

    failureOrSuccess<String>(await repository.getContentFile(contentId, type),
        (textOrLink) {
      emit(ChannelShowPostState(lastState.posts, textOrLink, type));
    }, (failure) {
      emit(ChannelErrorState());
    });
  }

  AddContent(int channelId, PostType type, int price, String summary) async {
    ChannelShowState lastState = state as ChannelShowState;
    emit(ChannelLoadingState());

    failureOrSuccess<int>(
        await repository.AddContent(channelId, type, price, summary),
        (contentId) {
      emit(ChannelAddFileState(lastState.posts, contentId));
    }, (failure) {
      emit(ChannelErrorState());
    });
  }

  AddContentText(int channelId, int contentId, String text) async {
    emit(ChannelLoadingState());

    failureOrSuccess<bool>(await repository.AddContentText(contentId, text),
        (success) {
      emit(ChannelNewPostAddedState());
      getChannelPosts(channelId);
    }, (failure) {
      emit(ChannelErrorState());
    });
  }
}
