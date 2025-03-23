import 'dart:convert';
import 'package:education/feature/cart/data/models/shipping.dart';
import 'package:flutter/foundation.dart';


import 'billing.dart';
import 'line_model.dart';

class OrderModel {

   final String paymentMethodTitle;
   final String paymentMethod;

   final String email;
   final List<LineItems> lineItems;
   final bool setPaid;
   final int? customerId;
  OrderModel({
    required this.paymentMethodTitle,
    required this.paymentMethod,

    required this.email,
    required this.lineItems,
    required this.setPaid,
    this.customerId,
  });

  OrderModel copyWith({
    String? paymentMethodTitle,
    String? paymentMethod,
    Billing? billing,
    Shipping? shipping,
    String? email,
    List<LineItems>? lineItems,
    bool? setPaid,
    int? customerId,
  }) {
    return OrderModel(
      paymentMethodTitle: paymentMethodTitle ?? this.paymentMethodTitle,
      paymentMethod: paymentMethod ?? this.paymentMethod,

      email: email ?? this.email,
      lineItems: lineItems ?? this.lineItems,
      setPaid: setPaid ?? this.setPaid,
      customerId: customerId ?? this.customerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paymentMethodTitle': paymentMethodTitle,
      'paymentMethod': paymentMethod,

      'email': email,
      'lineItems': lineItems.map((x) => x.toMap()).toList(),
      'setPaid': setPaid,
      'customerId': customerId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      paymentMethodTitle: map['paymentMethodTitle'] as String,
      paymentMethod: map['paymentMethod'] as String,
      email: map['email'] as String,
      lineItems: List<LineItems>.from((map['lineItems'] as List<int>).map<LineItems>((x) => LineItems.fromMap(x as Map<String,dynamic>),),),
      setPaid: map['setPaid'] as bool,
      customerId: map['customerId'] != null ? map['customerId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(paymentMethodTitle: $paymentMethodTitle, paymentMethod: $paymentMethod,  email: $email, lineItems: $lineItems, setPaid: $setPaid, customerId: $customerId)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.paymentMethodTitle == paymentMethodTitle &&
      other.paymentMethod == paymentMethod &&
      other.email == email &&
      listEquals(other.lineItems, lineItems) &&
      other.setPaid == setPaid &&
      other.customerId == customerId;
  }

  @override
  int get hashCode {
    return paymentMethodTitle.hashCode ^
      paymentMethod.hashCode ^

      email.hashCode ^
      lineItems.hashCode ^
      setPaid.hashCode ^
      customerId.hashCode;
  }
}
