class ProductModel {
  int? id;
  String? title;
  String? content;
  String? salePrice; // Change to String
  String? thumbnailUrl;
  String? link;

  ProductModel({
    this.id,
    this.title,
    this.content,
    this.salePrice,
    this.thumbnailUrl,
    this.link,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['ID'],
      title: map['title'],
      content: map['content'],
      salePrice: _parseSalePrice(map['sale_price']), // Handle String or num
      thumbnailUrl: map['thumbnail_url'],
      link: map['link'],
    );
  }

  static String? _parseSalePrice(dynamic salePrice) {
    if (salePrice == null) return null;
    if (salePrice is String) return salePrice;
    if (salePrice is num) return salePrice.toString(); // Convert num to String
    return null;
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'title': title,
      'content': content,
      'sale_price': salePrice,
      'thumbnail_url': thumbnailUrl,
      'link': link,
    };
  }
}