// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


import '../../../coursedetails/data/models/product_model.dart';


class CartItemModel {
  final ProductModel productModel;
   int quantity;
  int variantId;
  CartItemModel( {
   required this.productModel,
    this.quantity = 1,
    this.variantId = 0,
  });

  CartItemModel copyWith({
   ProductModel? productModel,
    int? quantity,
    int? variantId,
  }) {
    return CartItemModel(
      productModel: productModel ?? this.productModel,
      quantity: quantity ?? this.quantity,
      variantId: variantId ?? this.variantId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'donationItemModel': productModel.toMap(),
      'quantity': quantity,
      'variantId': variantId,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
        productModel: ProductModel.fromMap(
          map['donationItemModel'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
      variantId: map['variantId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CartItemModel(donationItemModel: $productModel, quantity: $quantity, variantId: $variantId)';

  @override
  bool operator ==(covariant CartItemModel other) {
    if (identical(this, other)) return true;

    return other.productModel == productModel &&
        other.quantity == quantity &&
        other.variantId == variantId;
  }

  @override
  int get hashCode =>
      productModel.hashCode ^ quantity.hashCode ^ variantId.hashCode;
}
