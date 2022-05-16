class Exploiter {
  late String accounts;
  late String email;
  late String phone;
  late String password;
  late String confirm;

  Exploiter({
    required this.accounts,
    required this.email,
    required this.password,
    required this.phone,
    required this.confirm,
  });

  Exploiter.from({
    required this.accounts,
    required this.email,
    required this.password,
    required this.phone,
    required this.confirm,
  });

  Exploiter.fromJson(Map<String, dynamic> json)
      : accounts = json["account"],
        phone = json["phone"],
        email = json["email"],
        password = json["password"],
        confirm = json["confirm"];

  Map<String, dynamic> toJson() => {
        "account": accounts,
        "email": email,
        "password": password,
        "phone": phone,
        "confirm": confirm,
      };
}