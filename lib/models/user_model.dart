class User {
  String? id;
  late String email;
  late String password;

  User({required this.id, required this.email, required this.password});

  User.from(
      {required this.email,
      required this.password,
      });

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
      };

  @override
  String toString() {
    return toString();
  }
}
