// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LineItems {
   final int quantity;
   final int productId;
   final int variationId;
  LineItems({
    required this.quantity,
    required this.productId,
    required this.variationId,
  });
 

  LineItems copyWith({
    int? quantity,
    int? productId,
    int? variationId,
  }) {
    return LineItems(
      quantity: quantity ?? this.quantity,
      productId: productId ?? this.productId,
      variationId: variationId ?? this.variationId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'productId': productId,
      'variationId': variationId,
    };
  }

  factory LineItems.fromMap(Map<String, dynamic> map) {
    return LineItems(
      quantity: map['quantity'] as int,
      productId: map['productId'] as int,
      variationId: map['variationId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LineItems.fromJson(String source) => LineItems.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LineItems(quantity: $quantity, productId: $productId, variationId: $variationId)';

  @override
  bool operator ==(covariant LineItems other) {
    if (identical(this, other)) return true;
  
    return 
      other.quantity == quantity &&
      other.productId == productId &&
      other.variationId == variationId;
  }

  @override
  int get hashCode => quantity.hashCode ^ productId.hashCode ^ variationId.hashCode;
 }
