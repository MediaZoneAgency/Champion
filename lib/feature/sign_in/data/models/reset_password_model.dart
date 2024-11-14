// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetPasswordModel {
  String? password;
  String? email;
  String? otp;
  ResetPasswordModel({
    this.password,
    this.email,
    this.otp,
  });

  ResetPasswordModel copyWith({
    String? password,
    String? email,
    String? otp,
  }) {
    return ResetPasswordModel(
      password: password ?? this.password,
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'email': email,
      'otp': otp,
    };
  }

  factory ResetPasswordModel.fromMap(Map<String, dynamic> map) {
    return ResetPasswordModel(
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      otp: map['otp'] != null ? map['otp'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordModel.fromJson(String source) => ResetPasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResetPasswordModel(password: $password, email: $email, otp: $otp)';

  @override
  bool operator ==(covariant ResetPasswordModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.password == password &&
      other.email == email &&
      other.otp == otp;
  }

  @override
  int get hashCode => password.hashCode ^ email.hashCode ^ otp.hashCode;
}
 