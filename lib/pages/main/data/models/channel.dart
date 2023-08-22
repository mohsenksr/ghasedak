enum ChannelMode { OWNER, ADMIN, MEMBER }


class Channel {
  final int id;
  final String lastContent;
  final String title;
  final ChannelMode mode;

  Channel(this.id, this.lastContent, this.title, this.mode);


  factory Channel.fromJson(Map<String, dynamic> data) {
    final int id = data["id"];
    final String title = data["title"];
    int idx = data["last_content"].indexOf("T");
    List<String> dateTimeParts = [data["last_content"].substring(0,idx).trim(), data["last_content"].substring(idx+1).trim()];
    
    int hourIdx = dateTimeParts[1].indexOf(":");
    List hourParts = [dateTimeParts[1].substring(0,hourIdx).trim(), dateTimeParts[1].substring(hourIdx+1).trim()];


    int minuteIdx = hourParts[1].indexOf(":");
    List minuteParts = [hourParts[1].substring(0,minuteIdx).trim(), hourParts[1].substring(minuteIdx+1).trim()];


    final String lastContent = dateTimeParts[0] + " " + hourParts[0] + ":" + minuteParts[0];
    final ChannelMode mode = data["mode"] == "OWNER" ? ChannelMode.OWNER : data["mode"] == "ADMIN" ? ChannelMode.ADMIN : ChannelMode.MEMBER;
    return Channel(id, lastContent, title, mode);
  }
}
