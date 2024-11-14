class LoginModel {
  String? username;
  String? password;

  //<editor-fold desc="Data Methods">
  LoginModel({
    this.username,
    this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is LoginModel &&
              runtimeType == other.runtimeType &&
              username == other.username &&
              password == other.password);

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'LoginModel{ username: $username, password: $password }';
  }

  LoginModel copyWith({
    String? username,
    String? password,
  }) {
    return LoginModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      username: map['username'] as String?,
      password: map['password'] as String?,
    );
  }
//</editor-fold>
}
