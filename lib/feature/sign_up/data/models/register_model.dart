import 'dart:convert';

class RegisterRequestModel {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;

  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phone_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
