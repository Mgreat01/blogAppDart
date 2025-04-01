class Authentication {
  String email;
  String password;

  Authentication({
    required this.email,
    required this.password,
  });

  factory Authentication.fromJson(Map json) => Authentication(
    email: json["email"],
    password: json["password"],
  );

  Map toJson() => {
    "email": email,
    "password": password,
  };
}
