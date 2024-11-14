import 'dart:convert';

class LoginResponseModel {
  final String token;
  final String userEmail;
  final String userNiceName;
  final String userDisplayName;

  LoginResponseModel({
    required this.token,
    required this.userEmail,
    required this.userNiceName,
    required this.userDisplayName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is LoginResponseModel &&
              runtimeType == other.runtimeType &&
              token == other.token &&
              userEmail == other.userEmail &&
              userNiceName == other.userNiceName &&
              userDisplayName == other.userDisplayName);

  @override
  int get hashCode =>
      token.hashCode ^
      userEmail.hashCode ^
      userNiceName.hashCode ^
      userDisplayName.hashCode;

  @override
  String toString() {
    return 'LoginResponseModel{ token: $token, userEmail: $userEmail, userNiceName: $userNiceName, userDisplayName: $userDisplayName }';
  }

  LoginResponseModel copyWith({
    String? token,
    String? userEmail,
    String? userNiceName,
    String? userDisplayName,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      userEmail: userEmail ?? this.userEmail,
      userNiceName: userNiceName ?? this.userNiceName,
      userDisplayName: userDisplayName ?? this.userDisplayName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'user_email': userEmail,
      'user_nicename': userNiceName,
      'user_display_name': userDisplayName,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'] as String,
      userEmail: map['user_email'] as String,
      userNiceName: map['user_nicename'] as String,
      userDisplayName: map['user_display_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
