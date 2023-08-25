part of 'channel_cubit.dart';

abstract class ChannelState extends Equatable {
  const ChannelState();
}

class ChannelInitialState extends ChannelState {
  @override
  List<Object> get props => ['ChannelInitialState'];
}

class ChannelLoadingState extends ChannelState {
  @override
  List<Object> get props => ['ChannelLoadingState'];
}

class ChannelNewPostAddedState extends ChannelState {
  @override
  List<Object> get props => ['ChannelNewPostAddedState'];
}

class ChannelShowState extends ChannelState {
  List<Post> posts;

  ChannelShowState(this.posts);

  @override
  List<Object> get props => ['ChannelShowState', posts];
}

class ChannelShowPostState extends ChannelShowState {
  @override
  List<Post> posts;
  String contentTextOrLink;
  PostType type;

  ChannelShowPostState(this.posts, this.contentTextOrLink, this.type)
      : super(posts);

  @override
  List<Object> get props => ['ChannelShowPostState', posts, contentTextOrLink];
}

class ChannelAddFileState extends ChannelShowState {
  @override
  List<Post> posts;
  int contentId;

  ChannelAddFileState(this.posts, this.contentId) : super(posts);

  @override
  List<Object> get props => ['ChannelAddFileState', posts, contentId];
}

class ChannelErrorState extends ChannelState {
  @override
  List<Object> get props => ['ChannelErrorState'];
}
