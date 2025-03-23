// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Shipping {
   final String? firstName;
   final String? lastName;
   final String? city;
   final String? address;
   final String? postalCode;
   final String? phone;
  Shipping({
    this.firstName,
    this.lastName,
    this.city,
    this.address,
    this.postalCode,
    this.phone,
  });

  Shipping copyWith({
    String? firstName,
    String? lastName,
    String? city,
    String? address,
    String? postalCode,
    String? phone,
  }) {
    return Shipping(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      city: city ?? this.city,
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'city': city,
      'address': address,
      'postalCode': postalCode,
      'phone': phone,
    };
  }

  factory Shipping.fromMap(Map<String, dynamic> map) {
    return Shipping(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      postalCode: map['postalCode'] != null ? map['postalCode'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shipping.fromJson(String source) => Shipping.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Shipping(firstName: $firstName, lastName: $lastName, city: $city, address: $address, postalCode: $postalCode, phone: $phone)';
  }

  @override
  bool operator ==(covariant Shipping other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.city == city &&
      other.address == address &&
      other.postalCode == postalCode &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      city.hashCode ^
      address.hashCode ^
      postalCode.hashCode ^
      phone.hashCode;
  }
}
