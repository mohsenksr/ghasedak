import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/custom_cubit.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/main/domain/repository/main_repository.dart';
import 'package:injectable/injectable.dart';

part 'main_state.dart';

@singleton
class MainCubit extends CustomCubit<MainState> {
  final MainRepository repository;
  String? phone;

  MainCubit(this.repository) : super(MainLoginRequiredState());

  goToLoginPage() {
    emit(MainLoginRequiredState());
  }

  goToRegisterPage() {
    emit(MainRegisterRequiredState());
  }

  sendRegisterationPhone(String phone) async {
    final lastState = state;
    emit(MainLoadingState());
    this.phone = phone;

    failureOrSuccess<bool>(await repository.sendRegisterationPhone(phone),
        (success) {
      emit(lastState);
    }, (failure) {
      emit(MainErrorState());
    });
  }

  sendRegisterationCode(String code) async {
    final lastState = state;
    emit(MainLoadingState());
    failureOrSuccess<String>(
        await repository.sendRegisterationCode(phone!, code), (token) async {
      await repository.setGlobalAuthToken(token);
      emit(lastState);
    }, (failure) {
      emit(MainErrorState());
    });
  }

  getChannels() async {
    emit(MainLoadingState());
    failureOrSuccess<Map<String, List<Channel>>>(await repository.getChannels(),
        (channels) async {
      emit(MainLoginState(channels));
    }, (failure) {
      emit(MainErrorState());
    });
  }

  createChannel(String title, String id, String bio) async {
    emit(MainLoadingState());
    failureOrSuccess<bool>(await repository.createChannel(title, id, bio),
        (success) async {
      await getChannels();
    }, (failure) {
      emit(MainErrorState());
    });
  }

  joinChannel(String id) async {
    emit(MainLoadingState());
    failureOrSuccess<bool>(await repository.joinChannel(id),
        (success) async {
      await getChannels();
    }, (failure) {
      emit(MainErrorState());
    });
  }

  login(String username, String passwrord) async {
    emit(MainLoadingState());
    failureOrSuccess<String>(await repository.login(username, passwrord),
        (token) async {
      await repository.setGlobalAuthToken(token);

      await getChannels();
    }, (failure) {
      emit(MainErrorState());
    });
  }

  register(String firstName, String lastName, String username, String email,
      String password) async {
    emit(MainLoadingState());
    String? token = await repository.getGlobalAuthToken();
    failureOrSuccess<bool>(
        await repository.register(
            token!, firstName, lastName, username, email, password), (success) {
      emit(MainLoginRequiredState());
    }, (failure) {
      emit(MainErrorState());
    });
  }
}
