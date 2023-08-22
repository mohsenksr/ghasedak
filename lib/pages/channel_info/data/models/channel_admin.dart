class Admin {
  final int id;
  final String fullName;
  final int percent;

  Admin(this.id, this.fullName, this.percent);

  factory Admin.fromJson(Map<String, dynamic> data) {
    final int id = data["id"];
    final String fullName = data["admin"];
    final int percent = data["percent"];

    return Admin(id, fullName, percent);
  }
}
