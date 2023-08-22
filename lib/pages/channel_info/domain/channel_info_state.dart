part of 'channel_info_cubit.dart';

abstract class ChannelInfoState extends Equatable {
  const ChannelInfoState();
}

class ChannelInfoInitialState extends ChannelInfoState {
  @override
  List<Object> get props => ['ChannelInfoInitialState'];
}

class ChannelInfoLoadingState extends ChannelInfoState {
  @override
  List<Object> get props => ['ChannelInfoLoadingState'];
}

class ChannelInfoShowState extends ChannelInfoState {
  final ChannelDescription description;
  final Map<String, dynamic>? adminData;

  ChannelInfoShowState(this.description, {this.adminData});

  @override
  List<Object> get props =>
      ['ChannelInfoShowState', description, adminData ?? ""];
}

class ChannelInfoErrorState extends ChannelInfoState {
  @override
  List<Object> get props => ['ChannelInfoErrorState'];
}
