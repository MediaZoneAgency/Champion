// import 'dart:convert';
//
// class RegisterResponseModel {
//
//
//   //<editor-fold desc="Data Methods">
//   //</editor-fold>
//   String? message;
//   int? userId;
//   String? token;
//
//   RegisterResponseModel({
//     this.message,
//     this.userId,
//     this.token,
//   });
//
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           (other is RegisterResponseModel &&
//               runtimeType == other.runtimeType &&
//               message == other.message &&
//               userId == other.userId &&
//               token == other.token
//           );
//
//
//   @override
//   int get hashCode =>
//       message.hashCode ^
//       userId.hashCode ^
//       token.hashCode;
//
//
//   @override
//   String toString() {
//     return 'RegisterResponseModel{' +
//         ' message: $message,' +
//         ' userId: $userId,' +
//         ' token: $token,' +
//         '}';
//   }
//
//
//   RegisterResponseModel copyWith({
//     String? message,
//     int? userId,
//     String? token,
//   }) {
//     return RegisterResponseModel(
//       message: message ?? this.message,
//       userId: userId ?? this.userId,
//       token: token ?? this.token,
//     );
//   }
//
//
//   Map<String, dynamic> toMap() {
//     return {
//       'message': this.message,
//       'userId': this.userId,
//       'token': this.token,
//     };
//   }
//
//   factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
//     return RegisterResponseModel(
//       message: map['message'],
//       userId: map['userId'],
//       token: map['token'],
//     );
//   }
// }
//
//
//
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'message': message,
// //       'user_id': userId,
// //     };
// //   }
// //
// //   factory RegisterResponseModel.fromMapM(ap<String, dynamic> map) {
// //     return RegisterResponseModel(
// //       message: map['message'] as String,
// //       userId: map['user_id'] as int,
// //     );
// //   }
// //
// //   String toJson() => json.encode(toMap());
// //
// //   factory RegisterResponseModel.fromJson(String source) =>
// //       RegisterResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
// // }
import 'dart:convert';

class RegisterResponseModel {
  String? message;
  int? userId;
  String? token;

//<editor-fold desc="Data Methods">
  RegisterResponseModel({
    this.message,
    this.userId,
    this.token,
  });
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'user_id': userId,
      'token': token,
    };
  }
  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
      message: map['message'] as String,
      userId: map['user_id'] as int,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromJson(String source) =>
      RegisterResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
