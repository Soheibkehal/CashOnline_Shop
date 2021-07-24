class IUser {
  int id;
  String firstname;
  String lastname;
  String username;
  String password;
  String token;
  double cash;

  Map<String,dynamic> get map {
    return {
      "id": id,
      "firstname": firstname,
      "lastname":lastname,
      "username": username,
      "password": password,
      "token": token,
      "cash": cash,
    };
  }

  IUser({this.id, this.firstname, this.lastname, this.username, this.password, this.token, this.cash});
}