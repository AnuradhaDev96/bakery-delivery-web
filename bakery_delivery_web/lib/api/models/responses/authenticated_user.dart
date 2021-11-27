class AuthenticatedUser {
  String email, uid, token, userType, fullName;
  AuthenticatedUser(
      {required this.email,
      required this.uid,
      required this.token,
      required this.userType,
      required this.fullName});

  AuthenticatedUser.fromMap(Map<String, dynamic> map)
      : email = map["email"],
        uid = map["uid"],
        token = map["token"],
        userType = map["userType"],
        fullName = map["fullName"];

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'token': token,
      'userType': userType,
      'fullName': fullName
    };
  }
}
