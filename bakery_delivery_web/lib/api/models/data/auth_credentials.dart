class AuthCredentials {
  String email;
  String password;

  AuthCredentials({required this.email, required this.password});

  AuthCredentials.fromMap(Map<String, dynamic> map)
      : email = map["email"],
        password = map["password"];

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }

  toJson() {
    return {'email': email, 'password': password};
  }
}
