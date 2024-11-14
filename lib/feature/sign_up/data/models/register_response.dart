import 'dart:convert';

class RegisterResponseModel {
  final String message;
  final int userId;

  RegisterResponseModel({
    required this.message,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'user_id': userId,
    };
  }

  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
      message: map['message'] as String,
      userId: map['user_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromJson(String source) =>
      RegisterResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
