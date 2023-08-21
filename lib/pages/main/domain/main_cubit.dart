import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/custom_cubit.dart';
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
    this.phone = phone;

    failureOrSuccess<bool>(
        await repository.sendRegisterationPhone(phone), (success) {},
        (failure) {
      emit(MainErrorState());
    });
  }

  sendRegisterationCode(String code) async {
    failureOrSuccess<String>(
        await repository.sendRegisterationCode(phone!, code), (token) async {
      await repository.setGlobalAuthToken(token);
    }, (failure) {
      emit(MainErrorState());
    });
  }

  login(String username, String passwrord) async {
    failureOrSuccess<String>(await repository.login(username, passwrord),
        (token) {
      repository.setGlobalAuthToken(token);
      emit(MainLoginState(token));
    }, (failure) {
      emit(MainErrorState());
    });
  }

  register(String firstName, String lastName, String username, String email,
      String password) async {
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
