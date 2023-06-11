class User {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['c_password'],
    );
  }
}
