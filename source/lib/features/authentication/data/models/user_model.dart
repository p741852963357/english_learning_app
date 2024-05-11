class UserModel {
  String email;
  String password;

  UserModel(this.email, this.password);

  UserModel.fromJson(json)
      : email = json['email'],
        password = json['password'];

  Map toJson() => {
        'email': email,
        'password': password,
      };
}
