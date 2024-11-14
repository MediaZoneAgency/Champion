import 'dart:ui';

import 'package:education/core/models/image_model.dart';

class ProductModel {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? type;
  String? description;
  String? price;
  String? regularPrice;
  String? salePrice;
  int? ratingCount;
  List<ImageModel>? images;

//<editor-fold desc="Data Methods">
  ProductModel({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.type,
    this.description,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.ratingCount,
    this.images,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          slug == other.slug &&
          permalink == other.permalink &&
          dateCreated == other.dateCreated &&
          dateCreatedGmt == other.dateCreatedGmt &&
          type == other.type &&
          description == other.description &&
          price == other.price &&
          regularPrice == other.regularPrice &&
          salePrice == other.salePrice &&
          ratingCount == other.ratingCount &&
          images == other.images);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      slug.hashCode ^
      permalink.hashCode ^
      dateCreated.hashCode ^
      dateCreatedGmt.hashCode ^
      type.hashCode ^
      description.hashCode ^
      price.hashCode ^
      regularPrice.hashCode ^
      salePrice.hashCode ^
      ratingCount.hashCode ^
      images.hashCode;

  @override
  String toString() {
    return 'ProductModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' slug: $slug,' +
        ' permalink: $permalink,' +
        ' dateCreated: $dateCreated,' +
        ' dateCreatedGmt: $dateCreatedGmt,' +
        ' type: $type,' +
        ' description: $description,' +
        ' price: $price,' +
        ' regularPrice: $regularPrice,' +
        ' salePrice: $salePrice,' +
        ' ratingCount: $ratingCount,' +
        ' images: $images,' +
        '}';
  }

  ProductModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? permalink,
    String? dateCreated,
    String? dateCreatedGmt,
    String? type,
    String? description,
    String? price,
    String? regularPrice,
    String? salePrice,
    int? ratingCount,
    List<ImageModel>? images,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      permalink: permalink ?? this.permalink,
      dateCreated: dateCreated ?? this.dateCreated,
      dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
      type: type ?? this.type,
      description: description ?? this.description,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      ratingCount: ratingCount ?? this.ratingCount,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'slug': this.slug,
      'permalink': this.permalink,
      'dateCreated': this.dateCreated,
      'dateCreatedGmt': this.dateCreatedGmt,
      'type': this.type,
      'description': this.description,
      'price': this.price,
      'regularPrice': this.regularPrice,
      'salePrice': this.salePrice,
      'ratingCount': this.ratingCount,
      'images': this.images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ,
      name: map['name'] ,
      slug: map['slug'] ,
      permalink: map['permalink'] ,
      dateCreated: map['dateCreated'] ,
      dateCreatedGmt: map['dateCreatedGmt'] ,
      type: map['type'] ,
      description: map['description'] ,
      price: map['price'] ,
      regularPrice: map['regularPrice'] ,
      salePrice: map['salePrice'] ,
      ratingCount: map['ratingCount'] ,
      images: map['images'] != null ? List<ImageModel>.from((map['images'] as List<dynamic>).map<ImageModel?>((x) => ImageModel.fromMap(x as Map<String,dynamic>),),) : null,
    );

  }

//</editor-fold>
}