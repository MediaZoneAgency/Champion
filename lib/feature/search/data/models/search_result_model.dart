class SearchResult {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final String price;
  final String regularPrice;
  final String salePrice;
  final bool onSale;
  final bool purchasable;
  final bool virtual;
  final bool downloadable;
  final bool shippingRequired;
  final List<Category> categories;
  final List<ProductImage> images;
  final List<int> relatedIds;
  final List<MetaData> metaData;
  final String priceHtml;
  final String stockStatus;

  SearchResult({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.purchasable,
    required this.virtual,
    required this.downloadable,
    required this.shippingRequired,
    required this.categories,
    required this.images,
    required this.relatedIds,
    required this.metaData,
    required this.priceHtml,
    required this.stockStatus,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      permalink: json['permalink'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      onSale: json['on_sale'],
      purchasable: json['purchasable'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      shippingRequired: json['shipping_required'],
      categories: (json['categories'] as List<dynamic>)
          .map((item) => Category.fromJson(item))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((item) => ProductImage.fromJson(item))
          .toList(),
      relatedIds: List<int>.from(json['related_ids']),
      metaData: (json['meta_data'] as List<dynamic>)
          .map((item) => MetaData.fromJson(item))
          .toList(),
      priceHtml: json['price_html'],
      stockStatus: json['stock_status'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class ProductImage {
  final int id;
  final String src;
  final String name;
  final String alt;

  ProductImage({
    required this.id,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      src: json['src'],
      name: json['name'],
      alt: json['alt'],
    );
  }
}

class MetaData {
  final int id;
  final String key;
  final dynamic value;

  MetaData({
    required this.id,
    required this.key,
    required this.value,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      id: json['id'],
      key: json['key'],
      value: json['value'],
    );
  }
}
