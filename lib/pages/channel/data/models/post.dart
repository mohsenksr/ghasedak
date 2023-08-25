enum PostType { TEXT, VOICE, VIDEO, IMAGE }

extension PostTypeExtension on PostType {
  String get stringMode {
    switch (this) {
      case PostType.TEXT:
        return 'text';
      case PostType.IMAGE:
        return 'image';
      case PostType.VIDEO:
        return 'video';
      case PostType.VOICE:
        return 'voice';
    }
  }
}

class Post {
  final int id;
  final String createdDate;
  final PostType type;
  final bool free;
  final bool edited;
  final String? summary;
  final int? price;

  const Post(this.id, this.createdDate, this.type, this.free, this.edited,
      this.summary, this.price);

  factory Post.fromJson(Map<String, dynamic> data) {
    final int id = data["id"];
    int idx = data["created_date"].indexOf("T");
    List<String> dateTimeParts = [
      data["created_date"].substring(0, idx).trim(),
      data["created_date"].substring(idx + 1).trim()
    ];

    int hourIdx = dateTimeParts[1].indexOf(":");
    List hourParts = [
      dateTimeParts[1].substring(0, hourIdx).trim(),
      dateTimeParts[1].substring(hourIdx + 1).trim()
    ];

    int minuteIdx = hourParts[1].indexOf(":");
    List minuteParts = [
      hourParts[1].substring(0, minuteIdx).trim(),
      hourParts[1].substring(minuteIdx + 1).trim()
    ];
    final String createdDate =
        dateTimeParts[0] + " " + hourParts[0] + ":" + minuteParts[0];

    final PostType type = data["type"] == PostType.TEXT.stringMode
        ? PostType.TEXT
        : data["type"] == PostType.IMAGE.stringMode
            ? PostType.IMAGE
            : data["type"] == PostType.VIDEO.stringMode
                ? PostType.VIDEO
                : PostType.VOICE;

    final bool free = data["free"];
    final bool edited = data["edited"];

    final String? summary = data["summary"];
    final int? price = data["price"];

    return Post(id, createdDate, type, free, edited, summary, price);
  }
}
