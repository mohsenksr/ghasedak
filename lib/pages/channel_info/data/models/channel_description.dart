class ChannelDescription {
  final int id;
  final String channelId;
  final String bio;
  final String title;

  ChannelDescription(this.id, this.channelId, this.title, this.bio);

  factory ChannelDescription.fromJson(Map<String, dynamic> data) {
    final int id = data["id"];
    final String channelId = data["channel_id"];
    final String title = data["title"];
    final String bio = data["bio"];

    return ChannelDescription(id, channelId, title, bio);
  }
}
