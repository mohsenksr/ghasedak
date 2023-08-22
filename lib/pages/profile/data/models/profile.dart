class Profile {
  final int id;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final int? credit;
  final String? ccNumber;

  Profile(this.id, this.username, this.firstName, this.lastName, this.phone,
      this.email, this.credit, this.ccNumber);

  factory Profile.fromJson(Map<String, dynamic> data) {
    final int id = data["id"];
    final String username = data["username"];
    final String? firstName = data["first_Name"];
    final String? lastName = data["last_name"];
    final String? phone = data["phone"];
    final String? email = data["email"];
    final int? credit = data["credit"];
    final String? ccNumber = data["cc_number"];

    return Profile(
        id, username, firstName, lastName, phone, email, credit, ccNumber);
  }
}
