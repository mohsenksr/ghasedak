part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  @override
  List<Object> get props => ['ProfileInitialState'];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => ['ProfileLoadingState'];
}

class ProfileShowState extends ProfileState {
  final Profile profile;

  ProfileShowState(this.profile);

  @override
  List<Object> get props => ['ProfileShowState'];
}

class ProfileErrorState extends ProfileState {
  @override
  List<Object> get props => ['ProfileErrorState'];
}
