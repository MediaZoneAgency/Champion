import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WishListModel {
  final int id;
  final String? name;
  final String? description;
  final String? price;
  final String? image;
  WishListModel({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.image,
  });

  WishListModel copyWith({
    required int id,
    String? name,
    String? description,
    String? price,
    String? image,
  }) {
    return WishListModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory WishListModel.fromMap(Map<String, dynamic> map) {
    return WishListModel(
      id: map['id'] ,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WishListModel.fromJson(String source) => WishListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WishListModel(id: $id, name: $name, description: $description, price: $price, image: $image)';
  }

  @override
  bool operator ==(covariant WishListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}
