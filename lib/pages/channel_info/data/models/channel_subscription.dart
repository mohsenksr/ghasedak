class Subscription {
  final int id;
  final int channelId;
  final String duration;
  final int price;

  Subscription(this.id, this.channelId, this.duration, this.price);

  factory Subscription.fromJson(Map<String, dynamic> data) {
    final int id = data["id"];
    final int channelId = data["channel_id"];
    final String duration = data["duration"];
    final int price = data["price"];

    return Subscription(id, channelId, duration, price);
  }
}
