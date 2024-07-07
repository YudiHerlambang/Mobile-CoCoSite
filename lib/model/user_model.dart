class User {
  int id;
  String name;
  String email;
  String password;

  User({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.password = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['Id'],
      name: json['Name'],
      email: json['Email'],
      password: json['Password'],
    );
  }
}
