part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainLoadingState extends MainState {
  @override
  List<Object> get props => ['MainLoadingState'];
}

class MainLoginState extends MainState {
  final Map<String, List<Channel>> channels;

  MainLoginState(this.channels);  
  
  @override
  List<Object> get props => ['MainLoginState'];
}

class MainLoginRequiredState extends MainState {
  @override
  List<Object> get props => ['MainLoginRequiredState'];
}

class MainRegisterRequiredState extends MainState {
  @override
  List<Object> get props => ['MainRegisterRequiredState'];
}

class MainErrorState extends MainState {
  @override
  List<Object> get props => ['MainErrorState'];
}