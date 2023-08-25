enum SubscriptionDuration { ONE_MONTH, THREE_MONTHS, SIX_MONTHS, TWELVE_MONTHS }

extension SubscriptionDurationExtension on SubscriptionDuration {
  String get stringMode {
    switch (this) {
      case SubscriptionDuration.ONE_MONTH:
        return '1month';
      case SubscriptionDuration.THREE_MONTHS:
        return '3months';
      case SubscriptionDuration.SIX_MONTHS:
        return '6months';
      case SubscriptionDuration.TWELVE_MONTHS:
        return '12months';
      default:
        return '1month';
    }
  }

  String get persianString {
    switch (this) {
      case SubscriptionDuration.ONE_MONTH:
        return 'یک ماهه';
      case SubscriptionDuration.THREE_MONTHS:
        return 'سه ماهه';
      case SubscriptionDuration.SIX_MONTHS:
        return 'شش ماهه';
      case SubscriptionDuration.TWELVE_MONTHS:
        return 'دوازده ماهه';
      default:
        return 'یک ماهه';
    }
  }
}

class Subscription {
  final int id;
  final int channelId;
  final SubscriptionDuration duration;
  final int price;

  Subscription(this.id, this.channelId, this.duration, this.price);

  factory Subscription.fromJson(Map<String, dynamic> data) {
    final int id = data["id"];
    final int channelId = data["channel_id"];
    final SubscriptionDuration duration = data["duration"] == "1month"
        ? SubscriptionDuration.ONE_MONTH
        : data["duration"] == "3months"
            ? SubscriptionDuration.THREE_MONTHS
            : data["duration"] == "6months"
                ? SubscriptionDuration.SIX_MONTHS
                : SubscriptionDuration.TWELVE_MONTHS;
    final int price = data["price"];

    return Subscription(id, channelId, duration, price);
  }
}
