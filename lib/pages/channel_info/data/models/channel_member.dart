class Member {
  final String username;
  final String fullName;

  Member(this.username, this.fullName);

  factory Member.fromJson(Map<String, dynamic> data) {
    final String username = data["username"];
    final String fullName = data["full_name"];

    return Member(username, fullName);
  }
}
