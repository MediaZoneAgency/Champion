import 'dart:convert';

class LoginResponseModel {
  String? message;
  User? user;
  String token; // Token is now non-nullable

  LoginResponseModel({
    this.message,
    this.user,
    required this.token, // Token is required in the constructor
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is LoginResponseModel &&
              runtimeType == other.runtimeType &&
              message == other.message &&
              user == other.user &&
              token == other.token);

  @override
  int get hashCode => message.hashCode ^ user.hashCode ^ token.hashCode;

  @override
  String toString() {
    return 'LoginResponseModel{message: $message, user: $user, token: $token}';
  }

  LoginResponseModel copyWith({
    String? message,
    User? user,
    String? token,
  }) {
    return LoginResponseModel(
      message: message ?? this.message,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'user': user?.toMap(),
      'token': token, // Non-nullable token
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      message: map['message'] as String?,
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      token: map['token'] as String, // Ensure token is non-null
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is User &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              email == other.email &&
              phoneNumber == other.phoneNumber &&
              emailVerifiedAt == other.emailVerifiedAt &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      emailVerifiedAt.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int?,
      name: map['name'] as String?,
      email: map['email'] as String?,
      phoneNumber: map['phone_number'] as String?,
      emailVerifiedAt: map['email_verified_at'] as String?,
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
